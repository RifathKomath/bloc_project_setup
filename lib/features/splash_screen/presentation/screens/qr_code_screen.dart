// import 'dart:convert';

// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/screen/onboarding_screen.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_bloc.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_event.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_state.dart';
// import 'package:easyfy_care_patient/widgets/app_confirmation_popup.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// import '../../../../core/utils/device_info.dart';

// class QRScanScreen extends StatefulWidget {
//   @override
//   State<QRScanScreen> createState() => _QRScanScreenState();
// }

// class _QRScanScreenState extends State<QRScanScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool dialogShown = false;

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//  void _onQRViewCreated(QRViewController controller) {
//   this.controller = controller;
//   controller.scannedDataStream.listen((scanData) async {
//     controller.pauseCamera();

//     try {
//       final qrRaw = scanData.code ?? '';
//       final Map<String, dynamic> qrMap = jsonDecode(qrRaw);

//       final doctorId = qrMap['doctorId']?.toString();

//       if (doctorId != null) {
//         context.read<SplashBloc>().add(QrSubmit(doctorId: doctorId));
//       } else {
//         throw Exception("Doctor ID not found in QR.");
//       }
//     } catch (e) {
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Invalid QR code format"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SplashBloc, SplashState>(
//     listener: (context, state) {
//   if (state is SplashLoaded && state.isSuccess) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(state.qrData?.message ?? "Success"),
//         backgroundColor: Colors.green,
//       ),
//     );
//     Navigator.pop(context); 
//     openAsNewPage(context, OnboardingScreen()); 
//   } else if (state is SplashLoaded && state.error?.isNotEmpty == true) {
//     Navigator.pop(context);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(state.error ?? "Something went wrong"),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// },

//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           iconTheme: IconThemeData(color: blueTextClr),
//         ),
//         body: QRView(
//           key: qrKey,
//           onQRViewCreated: _onQRViewCreated,
//         ),
//       ),
//     );
//   }
// }
