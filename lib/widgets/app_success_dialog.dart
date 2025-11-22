// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:flutter/material.dart';

// import '../core/constants/style.dart';
// import 'app_lottie.dart';

// class SuccessDialog extends StatelessWidget {
//   const SuccessDialog({
//     super.key,
//     required this.message,
//     this.onComplete,
//     this.duration = const Duration(milliseconds: 2000),
//   });

//   final String message;
//   final VoidCallback? onComplete;
//   final Duration duration;

//   static void show(
//     BuildContext context, {
//     required String message,
//     VoidCallback? onComplete,
//     Duration duration = const Duration(milliseconds: 2000),
//   }) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => SuccessDialog(
//         message: message,
//         onComplete: onComplete,
//         duration: duration,
//       ),
//     );

//     Future.delayed(duration, () {
//       if (Navigator.of(context, rootNavigator: true).canPop()) {
//         Navigator.of(context, rootNavigator: true).pop();
//         onComplete?.call();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const AppLottie(assetName: "success"),
//             16.hBox,
//             Text(
//               message,
//               style: AppTextStyles.textStyle_400_14.copyWith(
//                 fontSize: 16,
//                 color: blackTextClr,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }