// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/style.dart';
// import '../../../../widgets/app_svg.dart';

// class DashboardActionCard extends StatelessWidget {
//   const DashboardActionCard(
//       {super.key,
//       required this.title,
//       required this.iconPath,
//       this.onTap,
//       this.width = 43});

//   final String title;
//   final String iconPath;
//   final double width;
//    final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//          onTap: onTap,
//       child: Container(
//           height: 66,
//           padding: EdgeInsets.symmetric(
//             horizontal: 12,
//           ),
//           decoration: BoxDecoration(
//             color: pinkColor,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               AppSvg(name: iconPath, width: 42, height: 42),
//               12.wBox,
//               Flexible(
                
//                 child: Text(
//                   title,
//                   style: AppTextStyles.textStyle_700_14,
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
