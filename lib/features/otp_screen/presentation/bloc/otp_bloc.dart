// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import '../../domain/usecases/otp_usecase.dart';
// import 'otp_event.dart';
// import 'otp_state.dart';

// class OtpBloc extends Bloc<OtpEvent, OtpState> with CodeAutoFill {
//   Timer? _timer;
//   StreamSubscription? _smsSubscription;
//   final OtpUseCase otpUseCase;

//   OtpBloc({required this.otpUseCase}) : super(OtpState.initial()) {
//     on<StartTimer>((event, emit) async {
//       _timer?.cancel();
//       emit(state.copyWith(otpTimer: 30, canResendOtp: false));

//       int currentTime = 30;

//       _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//         currentTime--;

//         if (currentTime > 0) {
//           add(Tick(currentTime));
//         } else {
//           timer.cancel();
//           add(Tick(0)); // trigger UI update for 0 seconds
//           add(EnableResendOtp()); // dispatch a separate event to enable resend
//         }
//       });
//     });

//     on<EnableResendOtp>((event, emit) {
//       emit(state.copyWith(canResendOtp: true));
//     });

//     on<Tick>((event, emit) {
//       emit(state.copyWith(otpTimer: event.secondsRemaining));
//     });

//     on<ResendOtpPressed>((event, emit) async {
//       emit(state.copyWith(
//         isresendingOtp: true,
//         resentError: null,
//         otpStatus: OtpStatus.sending,
//       ));
    
//       try {
//         final response = await otpUseCase.resentOtp(phoneNo: event.phoneNumber);
//         add(StartTimer());
        
//         // Start listening for SMS when OTP is sent/resent
//         _listenForSmsCode();
        
//         emit(state.copyWith(
//           isresendingOtp: false,
//           otpStatus: OtpStatus.resent,
//           otpResponse: response,
//         ));
//       } catch (e) {
//         emit(state.copyWith(
//           isSendingOtp: false,
//           resentError: e.toString(),
//           otpStatus: OtpStatus.error,
//         ));
//       }
//     });

//     on<SendOtp>((event, emit) async {
//       emit(state.copyWith(
//         isSendingOtp: true,
//         sendOtpError: null,
//         otpStatus: OtpStatus.sending,
//       ));

//       try {
//         final response = await otpUseCase.sentOtp(phoneNo: event.phoneNumber);
        
//         // Get app signature for SMS autofill
//         final appSignature = await SmsAutoFill().getAppSignature;
//         print("App Signature: $appSignature");
        
//         // Start listening for SMS when OTP is sent
//         _listenForSmsCode();
        
//         emit(state.copyWith(
//           isSendingOtp: false,
//           otpStatus: OtpStatus.sent,
//           otpResponse: response,
//           phoneNumber: event.phoneNumber,
//         ));
        
//       } catch (e) {
//         emit(state.copyWith(
//           isSendingOtp: false,
//           sendOtpError: e.toString(),
//           otpStatus: OtpStatus.error,
//         ));
//       }
//     });

//     on<VerifyOtp>((event, emit) async {
//       emit(state.copyWith(
//         isVerifyingOtp: true,
//         verifyOtpError: null,
//         otpStatus: OtpStatus.verifying,
//       ));

//       try {
//         final response = await otpUseCase.verifyOtp(
//           phoneNo: event.phoneNumber,
//           otp: event.otp,
//         );
        
//         emit(state.copyWith(
//           isVerifyingOtp: false,
//           otpStatus: OtpStatus.verified,
//           verifyOtpResponse: response,
//         ));
        
//         // Cancel timer and SMS listener after successful verification
//         _timer?.cancel();
//         _smsSubscription?.cancel();
//       } catch (e) {
//         emit(state.copyWith(
//           isVerifyingOtp: false,
//           verifyOtpError: e.toString(),
//           otpStatus: OtpStatus.error,
//         ));
//       }
//     });

//     on<OtpAutoFilled>((event, emit) {
//       // Automatically submit the OTP if it's the correct length
//       if (event.otp.length == 5) {
//         add(VerifyOtp(
//           phoneNumber: state.phoneNumber ?? "",
//           otp: event.otp,
//         ));
//       }
//     });
//   }

//   void _listenForSmsCode() {
//     // Cancel existing subscription if any
//     _smsSubscription?.cancel();
    
//     // Start listening for SMS
//     _smsSubscription = SmsAutoFill().code.listen((code) {
//       if (code.isNotEmpty) {
//         add(OtpAutoFilled(code));
//       }
//     });
    
//     // Start the SMS listener
//     SmsAutoFill().listenForCode();
//   }

//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     _smsSubscription?.cancel();
//     return super.close();
//   }
  
//   @override
//   void codeUpdated() {
//        if (code != null && code!.isNotEmpty) {
//       add(OtpAutoFilled(code!));
//     }
//   }
// }