// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class ReportCard extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String? subtitle;
//   final double? height;
//   final VoidCallback? onArrowTap;
//   final bool isDeleteIconEnable;

//   const ReportCard({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     this.subtitle,
//     this.onArrowTap,
//     this.isDeleteIconEnable= false,
//     this.height
//   });

//  @override
// Widget build(BuildContext context) {
//   final hasSubtitle = subtitle != null;
//   return Container(
//     height: height,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       border: Border.all(
//         color: textborderClr,
//         width: 1,
//       ),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Row(
//         children: [
//           SvgPicture.asset(imagePath),
//           12.gapBox,
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment:
//                   hasSubtitle ? MainAxisAlignment.start : MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: AppTextStyles.textStyle_600_16,
//                 ),
//                 if (hasSubtitle) ...[
//                   4.gapBox,
//                   Text(
//                     subtitle!,
//                     style: AppTextStyles.textStyle_500_14.copyWith(color: grey2Clr),
//                   ),
//                 ]
//               ],
//             ),
//           ),
//           12.gapBox,
//           GestureDetector(
//             onTap: onArrowTap,
//             child: SvgPicture.asset(
//               isDeleteIconEnable? "assets/images/delete_icon.svg":
//               "assets/images/forward_arrow.svg"),
//           )
//         ],
//       ),
//     ),
//   );
// }

// }
