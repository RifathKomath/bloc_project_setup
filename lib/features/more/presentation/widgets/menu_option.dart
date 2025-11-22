// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';

// class MenuOption extends StatelessWidget {
//   final String icon;
//   final String label;
//   final VoidCallback onTap;

//   const MenuOption({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.onTap
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: borderClr),
//           borderRadius: BorderRadius.circular(18),
         
         
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//            AppSvg(name: icon,height: 50,width: 50,color: blueTextClr,),
//            13.hBox,
//             Text(
//               label,
//               style: AppTextStyles.textStyle_700_14.copyWith(color: blueTextClr)
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }