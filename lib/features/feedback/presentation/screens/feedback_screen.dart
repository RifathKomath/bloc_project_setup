// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:easyfy_care_patient/widgets/common_textfield.dart';
// import 'package:flutter/material.dart';

// class FeedbackScreen extends StatelessWidget {
//   const FeedbackScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//   appBar: AppBar(
//             title: Text("Feedbacks"),
//             automaticallyImplyLeading: false,
//             leading: GestureDetector(
//               onTap: () {
//                 close(context);
//               },
//               child: Icon(Icons.arrow_back_ios_new,size: 18.5,)),
//           ),
//       body: Column(
//         children: [
//           Divider(thickness: 0.5), // Fixed divider
//           Expanded(
//             child: ListView(
//               children: [
//                 16.hBox,
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     FeedbackActionCards(
//                       mainText: "Emergency",
//                       subText: "24/7 urgent care line",
//                       assetName: "call",
//                       textClr: redClr,
//                       bgClr: lightredClr,
//                     ),
//                     16.wBox,
//                     FeedbackActionCards(
//                       mainText: "Live Chat",
//                       subText: "Talk to care team",
//                       assetName: "chatf",
//                       textClr: purpleClr,
//                       bgClr: lightPeachClr,
//                     ),
//                   ],
//                 ).paddingSymmetricHorizontal(16),
//                 25.hBox,
//                 ShareFeedbackWidget(),
//                 ContactDetailsWidgets(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ContactDetailsWidgets extends StatelessWidget {
//   const ContactDetailsWidgets({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Contact Information",
//           style: AppTextStyles.textStyle_400_14.copyWith(fontSize: 18),
//         ),
//         ContactTile(
//           tittle: "Toll Free",
//           subTittle: "1-800-123-4567",
//           icon: "call_p",
//         ),
//         ContactTile(
//           tittle: "Email Support",
//           subTittle: "support@oncologycare.com",
//           icon: "mail",
//         ),
//       ],
//     ).paddingSymmetricHorizontal(16);
//   }
// }

// class ShareFeedbackWidget extends StatelessWidget {
//   const ShareFeedbackWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Share your feedback",
//           style: AppTextStyles.textStyle_400_14.copyWith(fontSize: 18),
//         ),
//         18.hBox,
//         Text("How was your experience?"),
//         9.hBox,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               "😔",
//               style: TextStyle(fontSize: 24),
//             ),
//             Spacer(),
//             Text(
//               "😐",
//               style: TextStyle(fontSize: 24),
//             ),
//             Spacer(),
//             Text(
//               "🙂",
//               style: TextStyle(fontSize: 24),
//             ),
//             Spacer(),
//             Text(
//               "😊",
//               style: TextStyle(fontSize: 24),
//             ),
//             Spacer(),
//             Text(
//               "🤩",
//               style: TextStyle(fontSize: 24),
//             ),
//           ],
//         ),
//         18.hBox,
//         CommonTextField(
//           hint: "Tell us more about your experience...",
//           borderColor: borderClr,
//           maxline: 5,
//           isborder: true,
//         ),
//         18.hBox,
//         CommonButton(
//           label: "Submit Feedback",
//           onTap: () {},
//         ),
//         30.hBox,
//       ],
//     ).paddingSymmetricHorizontal(16);
//   }
// }

// class ContactTile extends StatelessWidget {
//   const ContactTile({
//     super.key,
//     required this.tittle,
//     required this.subTittle,
//     required this.icon,
//   });
//   final String tittle, subTittle, icon;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//       leading: AppSvg(name: icon),
//       title: Text(
//         tittle,
//         style: AppTextStyles.textStyle_400_16,
//       ),
//       subtitle: Text(subTittle,
//           style: AppTextStyles.textStyle_400_14.copyWith(color: grey6Clr)),
//     );
//   }
// }

// class FeedbackActionCards extends StatelessWidget {
//   const FeedbackActionCards({
//     super.key,
//     required this.mainText,
//     required this.subText,
//     required this.assetName,
//     required this.bgClr,
//     required this.textClr,
//   });
//   final String mainText, subText, assetName;
//   final Color bgClr, textClr;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             color: bgClr, borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppSvg(name: assetName),
//             Text(
//               mainText,
//               style: AppTextStyles.textStyle_400_16.copyWith(color: textClr),
//             ),
//             Text(
//               subText,
//               maxLines: 1,
//               style: AppTextStyles.textStyle_400_14.copyWith(color: textClr),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
