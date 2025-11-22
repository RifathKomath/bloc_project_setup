// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/style.dart';

// class TreatmentCenterLocationWidget extends StatelessWidget {
//   final String address;
//   final double latitude;
//   final double longitude;
  
//   const TreatmentCenterLocationWidget({
//     Key? key,
//     required this.address,
//     required this.latitude,
//     required this.longitude,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Treatment Center Location",
//             style: AppTextStyles.textStyle_500_12
//                 .copyWith(color: blackTextClr, fontSize: 16),
//           ),
//          2.hBox,
         
//               Text(
//                 address,
//                 style: AppTextStyles.textStyle_500_14.copyWith(color: grey2Clr,fontSize: 12),
//               ),
//              8.hBox,
//               Container(
//                 height: 128,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey[200],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Stack(
//                     children: [
//                       // Static map image or placeholder
//                       Container(
//                         width: double.infinity,
//                         height: double.infinity,
//                         color: Colors.grey[300],
//                         child: Image.asset(
//                           "assets/images/map.png", 
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Center(
//                               child: Icon(
//                                 Icons.map,
//                                 size: 50,
//                                 color: Colors.grey[500],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       // Marker indicator
//                       Center(
//                         child: Icon(
//                           Icons.location_pin,
//                           color: Colors.red,
//                           size: 36,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
            
//         ],
//       ),
//     );
//   }
// }