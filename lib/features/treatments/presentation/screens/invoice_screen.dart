// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/home_screen.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// import '../../../../core/constants/style.dart';
// import '../../../../core/utils/screen_utils.dart';

// class InvoiceScreen extends StatelessWidget {
//   const InvoiceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 close(context);
//               },
//               icon: Icon(Icons.arrow_back_ios)),
//           title: Text("Cycle 3"),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Divider(thickness: 0.5),
//             Expanded(
//               child: ListView(
//                 children: [
//                   16.hBox,
//                   TreatmentDescriptionCard(),
//                   20.hBox,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Note",
//                         style: AppTextStyles.textStyle_400_14
//                             .copyWith(color: grey6Clr),
//                       ),
//                       10.hBox,
//                       Text(
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in condimentum dolor, sed porttitor quam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in condimentum dolor, sed porttitor quam.",
//                         style: AppTextStyles.textStyle_400_14
//                             .copyWith(fontSize: 12),
//                       ),
//                       30.hBox,
//                       Text(
//                         "Logistic Tracking",
//                         style: AppTextStyles.textStyle_400_14,
//                       ),
//                       TimelineTile(
//                         alignment: TimelineAlign.manual,
//                         lineXY: 0.1,
//                         isFirst: true,
//                         indicatorStyle: IndicatorStyle(
//                           width: 9,
//                           color: primaryColor,
//                         ),
//                         endChild: _buildTimelineContent(
//                           title: 'Prescription Uploaded',
//                           time: '9:00 am',
//                           date: "03/06/2025",
//                           isHighlighted: false,
//                         ),
//                         beforeLineStyle: const LineStyle(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                       ),
//                       // Timeline step 2
//                       TimelineTile(
//                         alignment: TimelineAlign.manual,
//                         lineXY: 0.1,
//                         indicatorStyle: IndicatorStyle(
//                           width: 9,
//                           color: primaryColor,
//                         ),
//                         endChild: _buildTimelineContent(
//                           title: 'Drugs Packed',
//                           time: '12:00 pm',
//                           date: "03/06/2025",
//                           isHighlighted: false,
//                         ),
//                         beforeLineStyle: const LineStyle(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                         afterLineStyle: const LineStyle(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                       ),
//                       // Timeline step 3
//                       TimelineTile(
//                         alignment: TimelineAlign.manual,
//                         lineXY: 0.1,
//                         indicatorStyle: IndicatorStyle(
//                           width: 9,
//                           color: primaryColor,
//                         ),
//                         endChild: _buildTimelineContent(
//                           title: 'Drugs Dispatched',
//                           date: '08/06/2025',
//                           time: '1:20 pm',
//                           isHighlighted: true,
//                         ),
//                         beforeLineStyle: const LineStyle(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                         afterLineStyle: const LineStyle(
//                           color: Colors.grey,
//                           thickness: 1,
//                         ),
//                       ),
//                       // Timeline step 4
//                       TimelineTile(
//                         alignment: TimelineAlign.manual,
//                         lineXY: 0.1,
//                         isLast: true,
//                         indicatorStyle: IndicatorStyle(
//                           width: 9,
//                           color: grey7Clr,
//                         ),
//                         endChild: _buildTimelineContent(
//                           title: 'Drugs Arrived',
//                           isHighlighted: false,
//                         ),
//                         beforeLineStyle: const LineStyle(
//                           color: grey7Clr,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ).paddingSymmetricHorizontal(16)
//                 ],
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.only(left: 33,bottom: 15,right: 29,top: 10),
//           child: CommonButton(label: "Make Payment", onTap: (){}),
//         ),
//         );
//   }

//   Widget _buildTimelineContent({
//     required String title,
//     String? date,
//     String? time,
//     required bool isHighlighted,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,  
//         children: [
//             isHighlighted? AppSvg(name: "capsule"):0.hBox,
//             isHighlighted? 5.wBox:0.hBox,
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: isHighlighted
//                     ? AppTextStyles.textStyle_600_14.copyWith(color: primaryColor)
//                     : AppTextStyles.textStyle_400_14,
//               ),
//               if (date != null || time != null)
//                 Text(
//                   [
//                     if (date != null) date,
//                     if (time != null) time,
//                   ].join('  '),
//                   style: AppTextStyles.textStyle_400_14.copyWith(
//                       fontSize: 10,
//                       color: isHighlighted ? primaryColor : blackText1Color),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TreatmentDescriptionCard extends StatelessWidget {
//   const TreatmentDescriptionCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: grey3Clr,
//           border: Border.all(color: grey9Clr)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Modified FOLFOX-6 ",
//                 style: AppTextStyles.textStyle_500_16,
//               ),
//               Text(
//                 "Cycle 3",
//                 style: AppTextStyles.textStyle_600_16,
//               ),
//             ],
//           ),
//           11.hBox,
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "City Cancer Center",
//                   style: AppTextStyles.textStyle_600_18,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Date",
//                       style: AppTextStyles.textStyle_400_14
//                           .copyWith(color: grey6Clr),
//                     ),
//                     CustomChip(
//                         textClr: blueTextClr, isBorder: true, text: "Change")
//                   ],
//                 ),
//                 5.hBox,
//                 Text(
//                   "May 30, 2025",
//                   style: AppTextStyles.textStyle_500_16,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ).paddingSymmetricHorizontal(16);
//   }
// }
