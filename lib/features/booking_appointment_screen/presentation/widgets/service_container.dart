// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/style.dart';

// class ServiceDataContainer extends StatelessWidget {
//   const ServiceDataContainer({super.key, this.isSelectBtn = false,this.onTap});
//   final bool isSelectBtn;
//   final  void Function()? onTap;


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: borderClr),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start, // Align items at the top
//             children: [
//               // Image container
//               Container(
//                 height: 78,
//                 width: 120,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: Image.asset(
//                   "assets/images/service.png",
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               SizedBox(width: 12),
//               // Content column
//               Expanded(
//                 child: Container(
//                   height: 78, // Same height as the image container
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment
//                         .spaceBetween, // Distribute space evenly
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Cheamotherapy",
//                             style: AppTextStyles.textStyle_500_14
//                                 .copyWith(color: blackTextClr),
//                           ),
//                           Text(
//                             "Best Chaemotherapy treatment in city",
//                             style: AppTextStyles.textStyle_500_12
//                                 .copyWith(color: grey2Clr),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "Starts at Rs 599",
//                         style: AppTextStyles.textStyle_500_14
//                             .copyWith(color: blackTextClr),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           if (isSelectBtn) 20.hBox,
//           isSelectBtn
//               ? CommonButton(
//                   label: "Select",
//                   onTap:onTap?? () {},
//                 )
//               : 0.hBox
//         ],
//       ),
//     );
//   }
// }
