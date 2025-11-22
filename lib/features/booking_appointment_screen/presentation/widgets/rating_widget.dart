// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/style.dart';

// class RatingWidget extends StatelessWidget {
//   const RatingWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Rating (72)",
//                 style: AppTextStyles.textStyle_500_12
//                     .copyWith(color: blackTextClr, fontSize: 16),
//               ),
//               Spacer(),
//               AppSvg(name: "star_half"),
//               8.wBox,
//               Text(
//                 "4.5",
//                 style: AppTextStyles.textStyle_500_12.copyWith(color: grey2Clr),
//               ),
//             ],
//           ),
//           ListView.separated(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) => ReviewContainer(
//                   reviewerName: "Joe Deo",
//                   rating: 4.5,
//                   reviewText:
//                       "The hospital staff responded quickly to my requests and were generally helpful.",
//                   timestamp: "Today"),
//               separatorBuilder: (context, index) => 2.hBox,
//               itemCount: 3)
//         ],
//       ),
//     );
//   }
// }

// class ReviewContainer extends StatelessWidget {
//   final String reviewerName;

//   final double rating;
//   final String reviewText;
//   final String timestamp;

//   const ReviewContainer({
//     super.key,
//     required this.reviewerName,
//     required this.rating,
//     required this.reviewText,
//     required this.timestamp,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12),
      
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Reviewer profile image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(25),
//             child: Image.asset(
//               "assets/images/drprofile.png",
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(width: 12),

//           // Review content
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Reviewer name and timestamp
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       reviewerName,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       timestamp,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),

//                 // Star rating
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     ...List.generate(5, (index) {
//                       return Icon(
//                         index < rating.floor()
//                             ? Icons.star
//                             : index < rating
//                                 ? Icons.star_half
//                                 : Icons.star_border,
//                         color: Colors.orange,
//                         size: 18,
//                       );
//                     }),
//                     SizedBox(width: 6),
//                     Text(
//                       rating.toString(),
//                       style: TextStyle(
//                         color: Colors.black87,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),

//                 // Review text
//                 SizedBox(height: 4),
//                 Text(
//                   reviewText,
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
