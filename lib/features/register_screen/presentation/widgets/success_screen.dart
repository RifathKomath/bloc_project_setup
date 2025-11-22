// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_bloc.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/screens/upload_files_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../no_data_screen/presentation/screens/no_data_screen.dart';

// class SuccessScreen extends StatefulWidget {
//   final int? userId;
//   const SuccessScreen({super.key,required this.userId});

//   @override
//   State<SuccessScreen> createState() => _SuccessScreenState();
// }

// class _SuccessScreenState extends State<SuccessScreen> {
//   @override
// void initState() {
//   super.initState();

//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: context.read<RegisterBloc>(),
//             child: UploadFilesScreen(userId: widget.userId),
//           ),
//         ),
//       );
//     });
//   });
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(43.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Image.network(
//               //   'https://s3-alpha-sig.figma.com/img/76fe/6c10/a52022e59aabfcd325ca30195f6d3c5f?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=j4AXIo64vktpNc3VhhafP9-3stInH-n5Xy50b6cnx2y9Gns7xgbPmN286VmB-3BDo5E~pAyebDZqRrEijTQMRtx5tvTXjpUGBHbxXw-yuVI4HH-XCEtb9Yf6tVv0eNtSmKO9ffecrtR1YHM5vjC~CcYeUDk6yiV1t8rsSmRBZyHHcvQIlzSLo5~xf4FgAR1dS~6OyRiF4sc-aO8WYjKv-sHyqmTQLEoLPmZ24feUlc8M8UAlIT0kNb9X2k60L6rQG2wCfe2RrKZVfrJOySjp9w3mZkYCvsXQDPmsDJ6yqEiT0jqul3ATJ1YPIw2lhlFaAGI6TxQrhfOh1ZWuAwNFkQ__',
//               //   width: 144,
//               //   height: 144,
//               //   fit: BoxFit.cover,
//               // ),
//               24.gapBox,
//               Text(
//                 "Congratulations",
//                 style:
//                     AppTextStyles.textStyle_700_28.copyWith(color: blueTextClr),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "You're just one step away from setting up",
//                     style: AppTextStyles.textStyle_500_14
//                         .copyWith(color: blueTextClr),
//                   ),
//                 ],
//               ),
//               8.gapBox,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "your account!",
//                     style: AppTextStyles.textStyle_500_14
//                         .copyWith(color: blueTextClr),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
