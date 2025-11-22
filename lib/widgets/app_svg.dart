// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class AppSvg extends StatelessWidget {
//   final String name;
//   final double? width;
//   final double? height;
//   final Color? color;
//   final void Function()? ontap;
  

//   const AppSvg({
//     super.key,
//     required this.name,
//     this.width,
//     this.height,
//     this.ontap, this.color
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: SvgPicture.asset(
//         "assets/images/$name.svg",
//         width: width,
//         height: height,
//         color: color,
      
//       ),
//     );
//   }
// }