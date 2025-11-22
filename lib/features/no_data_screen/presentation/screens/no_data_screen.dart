// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/appointment_confirmation_screen.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_bloc.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_event.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/bloc/splash_state.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NoDataScreen extends StatelessWidget {
//   const NoDataScreen({super.key});
//   Future<void> _pullToRefresh(BuildContext context) async {
//     // Check if patient details exist before refreshing

//     context.read<SplashBloc>().add(GetUser());
//     return Future.value(); // Ensure a future is always returned
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<SplashBloc>(),
//       child: Scaffold(
//         body: BlocConsumer<SplashBloc, SplashState>(
//           listener: (context, state) {
//             if (state is NavigateToBase) {
//               openAsNewPage(context, BaseScreen(currentIndex: 0));
//             }

//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             return RefreshIndicator(
//               onRefresh: () async {
//                 // Dispatch event to SplashBloc to get user
//                 context.read<SplashBloc>().add(GetUser());
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF0077B6), Color(0xFF60D394)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     Positioned(
//                       top: 130,
//                       left: 15,
//                       right: 15,
//                       child: ClipPath(
//                         clipper: CenterCurveClipper(),
//                         child: Container(
//                           height: 600,
//                           decoration: BoxDecoration(
//                             color: whiteText,
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               80.hBox,
//                               // Text(
//                               //   "Our Support team will contact you shortly",
//                               //   style: AppTextStyles.textStyle_600_18.copyWith(
//                               //     fontSize: 20,
//                               //   ),
//                               //   textAlign: TextAlign.center,
//                               // ),
//                               59.hBox,
//                             AppSvg(name: "app_logo_xl",height: 186,width: 183,),
//                               96.hBox,
//                               Text(
//                                 "Waiting for Oncologist Approval",
//                                 style: AppTextStyles.textStyle_700_16,
//                                 textAlign: TextAlign.center,
//                               ).paddingSymmetricHorizontal(70),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 85,
//                       child: Row(
//                         children: [
//                           borderContainer(),
//                           AppSvg(
//                             name: "app_logo",
//                             height: 88,
//                           ),
//                           borderContainer(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
