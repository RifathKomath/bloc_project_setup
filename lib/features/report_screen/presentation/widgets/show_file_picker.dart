// import 'dart:io';

// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_bloc.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../../register_screen/presentation/screens/file_uploading_dialog.dart';

// void showPicker(BuildContext context,
//     {required String documentType, required int userId}) {
//   final blocContext = context;

//   showModalBottomSheet(
//     context: context,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//     ),
//     builder: (BuildContext bc) {
//       return SafeArea(
//         child: Wrap(
//           children: <Widget>[
//             ListTile(
//               title: Text(
//                 'Open Camera',
//                 textAlign: TextAlign.center,
//                 style:
//                     AppTextStyles.textStyle_700_16.copyWith(color: blueTextClr),
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 _pickImage(
//                     ImageSource.camera, blocContext, documentType, userId);
//               },
//             ),
//             ListTile(
//               title: Text(
//                 'Choose from Device',
//                 textAlign: TextAlign.center,
//                 style:
//                     AppTextStyles.textStyle_700_16.copyWith(color: blueTextClr),
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 _pickImage(
//                     ImageSource.gallery, blocContext, documentType, userId);
//               },
//             ),
//             ListTile(
//               title: Text(
//                 'Choose from My Records',
//                 textAlign: TextAlign.center,
//                 style:
//                     AppTextStyles.textStyle_700_16.copyWith(color: blueTextClr),
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 _pickDocument(blocContext, documentType, userId);
//               },
//             ),
//             ListTile(
//               title: Text(
//                 'Cancel',
//                 textAlign: TextAlign.center,
//                 style: AppTextStyles.textStyle_700_16.copyWith(color: grey4Clr),
//               ),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// Future<File> compressImage(File file) async {
//   final result = await FlutterImageCompress.compressWithFile(
//     file.absolute.path,
//     minWidth: 800,
//     minHeight: 800,
//     quality: 85,
//   );
//   final tempDir = await getTemporaryDirectory();
//   final compressedFile =
//       File('${tempDir.path}/compressed_${file.uri.pathSegments.last}');
//   await compressedFile.writeAsBytes(result!);
//   return compressedFile;
// }

// final ImagePicker _picker = ImagePicker();

// void _pickImage(ImageSource source, BuildContext context, String documentType,
//     int? userId) async {
//   try {
//     final XFile? pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       final file = File(pickedFile.path);

    
//       final compressedFile = await compressImage(file);

     
//       await Future.delayed(Duration(milliseconds: 300));

//       context
//           .read<RegisterBloc>()
//           .add(FileSelectedEvent(compressedFile, documentType));

//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (dialogContext) {
//           return BlocProvider.value(
//             value: context.read<RegisterBloc>(),
//             child: FileUploadingDialog(
//               file: compressedFile,
//               documentType: documentType,
//               userId: userId,
//             ),
//           );
//         },
//       );
//     }
//   } catch (e) {
//     print('Error picking image: $e');
//   }
// }

// void _pickDocument(
//     BuildContext context, String documentType, int? userId) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//   if (result != null && result.files.single.path != null) {
//     final file = File(result.files.single.path!);
//     context.read<RegisterBloc>().add(FileSelectedEvent(file, documentType));

//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (dialogContext) {
//         return BlocProvider.value(
//           value: context.read<RegisterBloc>(),
//           child: FileUploadingDialog(
//             file: file,
//             userId: userId,
//             documentType: documentType,
//           ),
//         );
//       },
//     );
//   }
// }
