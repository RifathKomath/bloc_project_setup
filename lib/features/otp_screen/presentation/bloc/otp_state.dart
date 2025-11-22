// import 'package:easyfy_care_patient/features/otp_screen/domain/entities/otp_entity.dart';
// import 'package:easyfy_care_patient/features/otp_screen/domain/entities/verify_otp_entity.dart';

// enum OtpStatus {
//   initial,
//   sending,
//   sent,
//   verifying,
//   verified,
//   error,
//   resent
// }

// class OtpState {
 

//   final int otpTimer; 
//   final bool isSendingOtp;
//   final bool isVerifyingOtp;
//   final bool isResentingOtp;
//   final bool canResendOtp;
//   final String? phoneNumber;
//   final String? sendOtpError;
//   final String? verifyOtpError;
//   final OtpStatus otpStatus;
//   final OtpResponseEntity? otpResponse;
//   final VerifyOtpEntity? verifyOtpResponse;
//   // final String? extractedOtp;

//   OtpState({
   
   
//     required this.otpTimer,  
//     required this.isSendingOtp,
//     required this.isVerifyingOtp,
//     required this.isResentingOtp,
//     required this.canResendOtp,
//     this.phoneNumber,
//     this.sendOtpError,
//     this.verifyOtpError,
//     required this.otpStatus,
//     this.otpResponse,
//     // this.extractedOtp,
//     this.verifyOtpResponse
//   });

//   factory OtpState.initial() {
//     return OtpState(
      
    
//       otpTimer: 30,
//       canResendOtp: false,
     
//       isSendingOtp: false,
//       isResentingOtp: false,
//       isVerifyingOtp: false,
//       otpStatus: OtpStatus.initial,
//     );
//   }

//   OtpState copyWith({
//     String? otp,
//     int? otpTimer,
//     bool?canResendOtp,
    
//     bool? isSendingOtp,
//     bool? isVerifyingOtp,
//     bool? isresendingOtp,
//     String? phoneNumber,
//     String? sendOtpError,
//     String? verifyOtpError,
//     String? resentError,
//     OtpStatus? otpStatus,
//     OtpResponseEntity? otpResponse,
//     VerifyOtpEntity? verifyOtpResponse,
//     // String? extractedOtp,
//   }) {
//     return OtpState(
      
   
//       otpTimer: otpTimer ?? this.otpTimer,
//       isResentingOtp:isresendingOtp ?? this.isResentingOtp,
//       canResendOtp: canResendOtp?? this.canResendOtp,
     
//       isSendingOtp: isSendingOtp ?? this.isSendingOtp,
//       isVerifyingOtp: isVerifyingOtp ?? this.isVerifyingOtp,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       sendOtpError: sendOtpError,
//       verifyOtpError: verifyOtpError,
//       otpStatus: otpStatus ?? this.otpStatus,
//       otpResponse: otpResponse ?? this.otpResponse,
//       verifyOtpResponse: verifyOtpResponse??this.verifyOtpResponse,
//       // extractedOtp: extractedOtp ?? this.extractedOtp,
//     );
//   }
// }