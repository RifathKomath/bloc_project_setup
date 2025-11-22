// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/area_selection_screen.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/book_appointment_screen.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_bloc.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_state.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/widgets/show_file_picker.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../widgets/common_button.dart';

// class UploadFilesScreen extends StatelessWidget {
//   final int? userId;
//   const UploadFilesScreen({super.key, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> tiles = [
//       {"svg": "upload_discharge_tile", "type": "Discharge Summary"},
//       {"svg": "chemo_tile", "type": "Chemo Chart"},
//       {"svg": "lab_tile", "type": "Lab Report"},
//     ];
//     return BlocProvider.value(
//       value: context.read<RegisterBloc>(),
//       child: Scaffold(
//         backgroundColor: whiteText,
//         appBar: AppBar(
//           title: Text("Upload Files"),
//           automaticallyImplyLeading: false,
//         ),
//         body: Column(
//           children: [
//             Divider(
//               thickness: 0.5,
//             ),
//             33.hBox,
//             Text(
//               "Upload below documents to continue with your treatment",
//               style: AppTextStyles.textStyle_500_14,
//               textAlign: TextAlign.center,
//             ).paddingSymmetricHorizontal(46),
//             31.hBox,
//             Expanded(
//               child: ListView.separated(
//                 itemBuilder: (context, index) {
//                   return UploadTileWithAction(
//                     svgName: tiles[index]["svg"]!,
//                     documentType: tiles[index]["type"]!,
//                     userId: userId,
//                   );
//                 },
//                 separatorBuilder: (context, index) => 32.hBox,
//                 itemCount: tiles.length,
//               ).paddingSymmetricHorizontal(18),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BlocBuilder<RegisterBloc, RegisterState>(
//           builder: (context, state) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Divider(
//                   thickness: 0.5,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: CommonButton( 
//                     bgColor: state.uploadedDocumentTypes!.length == 3
//                         ? buttonColor
//                         : LinearGradient(colors: [
//                             Colors.grey.shade400,
//                             Colors.grey.shade400
//                           ]),
//                     textColor: state.uploadedDocumentTypes!.length == 3
//                         ? whiteText
//                         : grey3Clr,
//                     label: "Continue",
//                     onTap: state.uploadedDocumentTypes!.length == 3
//                         ? () {
//                             openAsNewPage(context,AreaSelectionScreen() );
//                           }
//                         : null,
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class UploadTileWithAction extends StatelessWidget {
//   final String svgName;
//   final String documentType;
//   final double width;
//   final double height;
//   final int? userId;

//   const UploadTileWithAction({
//     super.key,
//     required this.svgName,
//     required this.documentType,
//     required this.userId,
//     this.width = 341,
//     this.height = 109,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterBloc, RegisterState>(
//       builder: (context, state) {
//         final isUploaded =
//             state.uploadedDocumentTypes?.contains(documentType) ?? false;
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             AppSvg(
//               name: svgName,
//               width: width,
//               height: height,
//             ),
//             Positioned(
//               top: 42,
//               right: 15,
//               child: isUploaded
//                   ? Container(
//                       height: 25,
//                       width: 25,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,gradient: buttonColor),
//                       child: Icon(
//                         Icons.check ,
//                         size: 20,
//                         color: whiteText,
//                       ),
//                     )
//                   : GestureDetector(
//                       onTap: () {
//                         showPicker(context,
//                             documentType: documentType, userId: userId!);
//                       },
//                       child: Container(
//                         height: 25,
//                         width: 25,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                         ),
//                       ),
//                     ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
