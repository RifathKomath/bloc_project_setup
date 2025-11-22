// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:flutter/material.dart';

// import '../core/constants/style.dart';
// import '../core/utils/screen_utils.dart';
// import 'common_button.dart';

// Future<bool?> appShowDialog(
//   BuildContext context, {
//   required String dialog,

//   Function()? onTap,
// }) {
//   bool isProcessing = false;

//   return showDialog<bool>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 24,
//           vertical: 20,
//         ),
//         content: Text(
//           dialog,
//           textAlign: TextAlign.center,
//           style: AppTextStyles.textStyle_500_14.copyWith(fontSize: 16),
//         ),
//         actionsAlignment: MainAxisAlignment.center,
//         actionsPadding: const EdgeInsets.only(bottom: 16),
//         actions: [
//           SizedBox(
           
//             width: 60,
//             child: CommonButton(
              
//               label: "No",
//               onTap: () {
//                 close(context);
//               },
//             ),
//           ),
//           50.wBox,
//           SizedBox(
            
//             width: 60,
//             child: CommonButton(
//               label: "Yes",
//               onTap: () {
//                 close(context);
//                 if (!isProcessing) {
//                   isProcessing = true;
//                   onTap?.call();
//                 }
//               },
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
