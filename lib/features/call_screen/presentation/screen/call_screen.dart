// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';

// class CallScreen extends StatelessWidget {
//   const CallScreen({super.key});

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
//             Column(
//               children: [
//                 50.hBox,
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         close(context);
//                       },
//                       child: Icon(
//                         Icons.arrow_back,
//                         color: whiteText,
//                       ).paddingSymmetricHorizontal(20),
//                     ),
//                     Text(
//                       "Audio Call",
//                       style: AppTextStyles.textStyle_700_16
//                           .copyWith(color: whiteText),
//                     ),
//                   ],
//                 ),
//                 100.hBox,
//                 CircleAvatar(
//                   radius: 70,
//                   backgroundImage: AssetImage("assets/images/doc.png"),
//                 ),
//                 20.hBox,
//                 Text(
//                   "Dr. Narayanan",
//                   style:
//                       AppTextStyles.textStyle_500_18.copyWith(color: whiteText),
//                 ),
//                 5.hBox,
//                 Text("22:55 min",
//                     style: AppTextStyles.textStyle_600_16
//                         .copyWith(color: shadowText)),
//                 110.hBox,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CallIconButton(
//                       color: callButton,
//                       iconName: "Loud speaker",
//                     ),
//                     CallIconButton(
//                       color: callButton,
//                       iconName: "Video call",
//                     ),
//                     CallIconButton(
//                       color: callButton,
//                       iconName: "Voice",
//                     ),
//                   ],
//                 ).paddingSymmetricHorizontal(30),
//                 20.hBox,
//                 CallIconButton(
//                   color: hungButtonClr,
//                   iconName: "IconsCall_Hung",
//                   onTap: () {
//                     close(context);
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CallIconButton extends StatelessWidget {
//   final Color color;
//   final String iconName;
//   final double width;
//   final double height;
//   final VoidCallback? onTap;

//   const CallIconButton({
//     super.key,
//     required this.color,
//     required this.iconName,
//     this.width = 80,
//     this.height = 64,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(48),
//           color: color,
//         ),
//         child: Center(
//           child: AppSvg(name: iconName, width: 36, height: 36),
//         ),
//       ),
//     );
//   }
// }
