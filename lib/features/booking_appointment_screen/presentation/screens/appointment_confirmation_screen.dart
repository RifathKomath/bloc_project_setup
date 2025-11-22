// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class AppointmentConfrimationScreen extends StatelessWidget {
//   const AppointmentConfrimationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF0077B6), Color(0xFF60D394)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Positioned(
//               top: 130,
//               left: 15,
//               right: 15,
//               child: ClipPath(
//                 clipper: CenterCurveClipper(),
//                 child: Container(
//                   height: 600,
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: whiteText,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       50.hBox,
//                       Text("You have successfully made an appointment",
//                           style: AppTextStyles.textStyle_600_20,textAlign: TextAlign.center,),
//                       15.hBox,
//                       Text(
//                         "The appointment confirmation has been send to your email.",
//                         style: AppTextStyles.textStyle_500_12.copyWith(
//                           color: textGreyColor,
//                         ),textAlign: TextAlign.center,
//                       ),
//                       50.hBox,
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         width: 129,
//                         height: 64,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.asset(
//                             "assets/images/hospital.png",
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       20.hBox,
//                       Text(
//                         "Nano Hospital",
//                         style: AppTextStyles.textStyle_700_28
//                             .copyWith(fontSize: 16),
//                       ),
//                       5.hBox,
//                       Text(
//                         "Chaemotherapy",
//                         style: AppTextStyles.textStyle_500_12.copyWith(
//                           color: textGreyColor,
//                         ),
//                       ),
//                       35.hBox,
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             SvgPicture.asset("assets/images/calender_svg.svg",
//                                 height: 42),
//                             10.wBox,
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Appointment",
//                                   style:
//                                       AppTextStyles.textStyle_500_12.copyWith(
//                                     color: textGreyColor,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Wednesday, 10 Jan 2024, 11:00",
//                                   style: AppTextStyles.textStyle_700_28
//                                       .copyWith(fontSize: 14),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       65.hBox,
//                       CommonButton(label: "Back to home", onTap: () {
//                         openAsNewPage(context, BaseScreen(currentIndex: 0));
//                       }),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 85,
//               child: Row(
//                 children: [
//                   borderContainer(),
//                   SvgPicture.asset('assets/images/app_logo.svg', height: 88),
//                   borderContainer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

 
// }

//  Widget borderContainer() {
//     return Padding(
//       padding: EdgeInsets.only(top: 32),
//       child: Container(
//         width: 30,
//         height: 30,
//         decoration: BoxDecoration(
//           color: whiteText,
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }

// class CenterCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(size.width / 2 - 60, 0);
//     path.quadraticBezierTo(size.width / 2, 80, size.width / 2 + 60, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
