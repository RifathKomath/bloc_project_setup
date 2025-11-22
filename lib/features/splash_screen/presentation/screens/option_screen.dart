// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/screen/onboarding_screen.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/screens/qr_code_screen.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_bloc.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_event.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../../core/utils/device_info.dart';

// class OptionScreen extends StatelessWidget {
//   const OptionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<SplashBloc>(),
//       child: const OptionScreenBody(),
//     );
//   }
// }

// class OptionScreenBody extends StatelessWidget {
//   const OptionScreenBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteText,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AppSvg(name: "app_logo_xl"),
//             50.hBox,
//             Text(
//               "Welcome to EasyfyCare",
//               style: AppTextStyles.textStyle_700_16.copyWith(fontSize: 20),
//             ),
//             5.hBox,
//             Text("Your health, our priority",
//                 style:
//                     AppTextStyles.textStyle_600_16.copyWith(color: grey4Clr)),
//             80.hBox,
//             Row(
//               children: [
//                 const Flexible(
//                     child: Divider(thickness: 0.5, color: blueTextClr)),
//                 10.wBox,
//                 Text("Please choose an option to register",
//                     style: AppTextStyles.textStyle_400_14
//                         .copyWith(color: grey4Clr)),
//                 10.wBox,
//                 const Flexible(
//                     child: Divider(thickness: 0.5, color: blueTextClr)),
//               ],
//             ).paddingSymmetricHorizontal(10),
//             20.hBox,
//             CommonButton(
//               label: "Procced with QR Code",
//               onTap: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (ctx) => BlocProvider.value(
//                       value: context.read<
//                           SplashBloc>(), 
//                       child: QRScanScreen(),
//                     ),
//                   ),
//                 );

//                 if (result != null && context.mounted) {
//                   final deviceId = await DeviceUtils.getDeviceId();
//                   if (deviceId != null) {
//                     context
//                         .read<SplashBloc>()
//                         .add(StartQRCodeScan(result, deviceId));
//                   }
//                 }
//               },
//               color: whiteText,
//               borderClr: blueTextClr,
//               textColor: blueTextClr,
//             ).paddingSymmetricHorizontal(30),
//             20.hBox,
//             Text("OR",
//                 style:
//                     AppTextStyles.textStyle_700_14.copyWith(color: grey4Clr)),
//             20.hBox,
//             CommonButton(
//               label: "Procced without QR Code",
//               onTap: () {
//                 open(context, OnboardingScreen());
//               },
//               color: whiteText,
//               borderClr: blueTextClr,
//               textColor: blueTextClr,
//             ).paddingSymmetricHorizontal(30),
//           ],
//         ),
//       ),
//     );
//   }
// }
