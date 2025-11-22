// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:flutter/material.dart';

// class OnboardingPage extends StatelessWidget {
//   final String image;
//   final String title;
//   final String subtitle;
//   final bool isOtpScreen;
//   final double pageOffset;

//   const OnboardingPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subtitle,
//     required this.isOtpScreen,
//     required this.pageOffset,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;

//     return SafeArea(
//       top: false,
//       child: Transform.translate(
//         offset: Offset(pageOffset * 50, 0),
//         child: Opacity(
//           opacity: (1 - pageOffset.abs()).clamp(0.0, 1.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(25),
//                     bottomRight: Radius.circular(25),
//                   ),
//                   child: Image.asset(
//                     image,
//                     width: w,
//                     height: double.infinity,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               24.gapBox,
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       title,
//                       textAlign: TextAlign.center,
//                       style: AppTextStyles.textStyle_500_24,
//                     ),
//                     12.gapBox,
//                     Text(
//                       subtitle,
//                       textAlign: isOtpScreen ? TextAlign.left : TextAlign.center,
//                       style: isOtpScreen
//                           ? AppTextStyles.textStyle_400_14
//                           : AppTextStyles.textStyle_500_16.copyWith(
//                               color: const Color(0xff8A8AA2),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               16.gapBox,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



