// import 'dart:async';
// import 'dart:io';
// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/utils/device_info.dart';
// import 'package:easyfy_care_patient/features/splash_screen/data/model/qr_request.dart';
// import 'package:easyfy_care_patient/features/splash_screen/domain/usecase/splash_usecase.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_event.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/utils/shared_pref.dart';
// import 'package:device_info_plus/device_info_plus.dart';

// class SplashBloc extends Bloc<SplashEvent, SplashState> {
//   final SplashUsecase useCase;
//   final SharedPref sharedPref = SharedPref();
//   SplashBloc({required this.useCase}) : super(SplashLoaded()) {

    
//     on<StartSplashTimer>((event, emit) async {
//       patientDetails = await sharedPref.getUserData();
//       doctorDetails = await sharedPref.getQrDoctorData();
//        patientDetailsFromRegister = await sharedPref.getUserDataByRegister();



//       print("🟨 Fetched PatientDetails: $patientDetails");
//       if (patientDetails?.status == "P" && patientDetails != null) {
//         print("🟩 Calling API with ID: ${patientDetails?.id}");
//         await useCase.getUser(id: patientDetails?.id.toString() ?? "");
//       } else {
//         await Future.delayed(const Duration(seconds: 2));
//       }

//       emit(NavigateToOnboarding());
//     });

//     on<GetUser>((event, emit) async {
//       await useCase.getUser(id: patientDetails?.id.toString() ?? "");
//       if (patientDetails?.status == "A") {
//         emit(NavigateToBase());
//       }
//     });

//     on<StartQRCodeScan>((event, emit) async {
//       try {
//         final scannedData = event.qrData;
//         final deviceId = event.deviceId;

//         print("✅ QR Data: $scannedData");
//         print("📱 Device ID: $deviceId");

//         emit(QRCodeScanSuccess(scannedData));
//       } catch (e) {
//         emit(QRCodeScanFailed("Something went wrong while scanning QR Code"));
//       }
//     });

//     on<QrSubmit>((event, emit) async {
//       try {
//         SplashLoaded currentState =
//             state is SplashLoaded ? state as SplashLoaded : SplashLoaded();

//         emit(currentState.copyWith(isSubmitting: true, error: ''));

//         final deviceId = await DeviceUtils.getDeviceId();


//         final qrRequest = QrRequest(
//           deviceInfo: deviceId ?? "",
//           doctorId: event.doctorId,
//         );

//         final response = await useCase.qrTracking(qrRequest: qrRequest);

//         if (response.success == true) {
//           emit(currentState.copyWith(
//             isSubmitting: false,
//             isSuccess: true,
//             qrData: response,
//           ));
//         } else {
//           emit(currentState.copyWith(
//             isSubmitting: false,
//             isSuccess: false,
//             qrData: response,
//             error: response.message ?? 'Qr failed',
//           ));
//         }
//       } catch (e) {
//         SplashLoaded currentState =
//             state is SplashLoaded ? state as SplashLoaded : SplashLoaded();

//         emit(currentState.copyWith(
//           isSubmitting: false,
//           error: 'Qr failed',
//         ));
//       }
//     });
//   }
// }
