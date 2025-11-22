// import 'dart:io';

// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_bloc.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_event.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_state.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FileUploadingDialog extends StatelessWidget {
//   final File file;
//   final String documentType;
//   final int? userId;

//   const FileUploadingDialog({
//     super.key,
//     required this.file,
//     required this.userId,
//     required this.documentType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: context.read<RegisterBloc>(),
//       child: BlocListener<RegisterBloc, RegisterState>(
//         listener: (context, state) {
//           if (!state.isUploading && state.fileUploadSuccess) {
//             Navigator.of(context).pop();
//           }
//         },
//         child: BlocBuilder<RegisterBloc, RegisterState>(
//           builder: (context, state) {
//             return Dialog(
//               insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
//               backgroundColor: whiteText,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     15.hBox,
//                     Container(
//                       height: 176,
//                       width: 176,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: silverClr),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.file(
//                           file,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) =>
//                               Center(child: Icon(Icons.error)),
//                         ),
//                       ),
//                     ),
//                     27.hBox,
//                     Text(
//                       "Would you use this document for your next chemo cycle?",
//                       style: AppTextStyles.textStyle_600_16,
//                       textAlign: TextAlign.center,
//                     ),
//                     26.hBox,
//                     CommonButton(
//                       label: state.isUploading ? "Uploading..." : "Yes",
//                       onTap: state.isUploading
//                           ? null
//                           : () {
//                               print(
//                                   "Yes button tapped, dispatching file upload event...");
//                               context.read<RegisterBloc>().add(
//                                     FileUploadRequestedEvent(
//                                       documentType: documentType,
//                                       userId: userId,
//                                       file: file,
//                                       fileSize: file.lengthSync(),
//                                       treatmentCycle: 1,
//                                     ),
//                                   );
//                             },
//                     ).paddingSymmetricHorizontal(10),
//                     17.hBox,
//                     CommonButton(
//                       label: "Cancel",
//                       onTap: () => Navigator.of(context).pop(),
//                       borderClr: blueTextClr,
//                       color: whiteText,
//                       textColor: blueTextClr,
//                     ).paddingSymmetricHorizontal(10),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
