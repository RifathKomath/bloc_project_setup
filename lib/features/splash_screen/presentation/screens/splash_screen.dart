// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/screens/option_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/screen/onboarding_screen.dart';
// import '../../../no_data_screen/presentation/screens/no_data_screen.dart';
// import '../bloc/splash_bloc.dart';
// import '../bloc/splash_event.dart';
// import '../bloc/splash_state.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<SplashBloc>()..add(StartSplashTimer()),
//       child: BlocListener<SplashBloc, SplashState>(
//         listener: (context, state) {
//           if (state is NavigateToOnboarding) {
//             if (patientDetails != null) {
//               if (patientDetails?.status == "A") {
//                 openAsNewPage(context, BaseScreen(currentIndex: 0));
//               } else {
//                 openAsNewPage(context, NoDataScreen());
//               }
//             } else {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (_) => OptionScreen()),
//               );
//             }
//           }
//         },
//         child: Scaffold(
//           body: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF0077B6), Color(0xFF60D394)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset('assets/images/app_logo.svg'),
//                 40.gapBox,
//                 Text(
//                   "Easyfy Care",
//                   style: AppTextStyles.textStyle_700_28
//                       .copyWith(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
