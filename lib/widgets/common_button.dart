// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:flutter/material.dart';

// class CommonButton extends StatelessWidget {
//   final String label;
//   final Color? color;
//   final VoidCallback? onTap; 
//   final LinearGradient? bgColor;
//   final Color? textColor;
//   final Color? borderClr;
//   final double? height;
//   final bool isIconBtn;
//   final Widget? icon;

//   const CommonButton(
//       {super.key,
//       required this.label,
//       required this.onTap,
//       this.color,
//       this.bgColor,
//       this.icon,
//       this.textColor,
//       this.borderClr,
//       this.height,
//       this.isIconBtn = false});

//   @override
//   Widget build(BuildContext context) {
//     final BoxDecoration decoration;

//     if (color != null) {
//       decoration = BoxDecoration(
//         color: color,
//         border: Border.all(color: borderClr ?? Colors.transparent),
//         borderRadius: BorderRadius.circular(12),
//       );
//     } else {
//       decoration = BoxDecoration(
//         gradient: bgColor ?? buttonColor,
//         border: Border.all(color: borderClr ?? Colors.transparent),
//         borderRadius: BorderRadius.circular(12),
//       );
//     }

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: height ?? 50,
//         decoration: decoration,
//         alignment: Alignment.center,
//         child: isIconBtn
//             ? Center(
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,                
//                   children: [
//                     icon ?? 0.wBox,
//                     5.wBox,
//                     Text(
//                       label,
//                       style: AppTextStyles.textStyle_500_16
//                           .copyWith(color: textColor ?? Colors.white),
//                     )
//                   ],
//                 ),
//             )
//             : Text(
//                 label,
//                 style: AppTextStyles.textStyle_500_16
//                     .copyWith(color: textColor ?? Colors.white),
//               ).paddingSymmetricVertical(14),
//       ),
//     );
//   }
// }
