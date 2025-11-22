// import 'dart:io';
// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/core/utils/string_utils.dart';
// import 'package:easyfy_care_patient/features/account_screen/presentation/bloc/account_bloc.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../../widgets/app_loader.dart';
// import '../../../../widgets/app_success_dialog.dart';
// import '../../../../widgets/common_snack_bar.dart';
// import '../bloc/account_state.dart';  

// class AccountScreen extends StatelessWidget {
//   const AccountScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final List contactName = ["Robert Johnson", "Emily Johnson"];
//     final List relation = ["Spouse", "Daughter"];
//     final List number = ["+1 (555) 987-6543", "+1 (555) 234-5678"];
//     return WillPopScope(
//       onWillPop: () async {
//         open(context, BaseScreen(currentIndex: 4));
//         return false;
//       },
//       child: BlocProvider(
//         create: (context) {
//           final bloc = getIt<AccountBloc>();
//           bloc.add(LoadProfileImageEvent(patientDetails?.id ?? 0));
//           return bloc;
//         },
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             title: Text("Profile"),
//             automaticallyImplyLeading: false,
//             leading: GestureDetector(
//               onTap: () {
//                 close(context);
//               },
//               child: Icon(Icons.arrow_back_ios_new,size: 18.5,)),
//           ),
//           body: SingleChildScrollView(
//             child: BlocConsumer<AccountBloc, AccountState>(
//               listener: (context, state) {
//                 // Show success dialog when upload completes successfully
//                 if (state.isUploadSuccess) {
//                   SuccessDialog.show(
//                     context,
//                     message: state.uploadMessage,
//                     onComplete: () {},
//                   );
//                 }

//                 // Show error dialog if there's an error
//                 if (state.isError) {
//                   showCustomSnackBar(context, state.error, isError: true);
//                 }
//               },
//               builder: (context, state) {
//                 // Get a reference to the bloc at build time
//                 final accountBloc = context.read<AccountBloc>();

//                 // Show loader when uploading or loading
//                 if (state.isUploading) {
//                   return const Center(
//                     child: AppLoader(),
//                   );
//                 }

//                 return Column(
//                   children: [
//                     20.gapBox,
//                     GestureDetector(
//                       onTap: () {
//                         _showPicker(
//                           context,
//                           (patientDetails?.id ?? "").toString(),
//                           accountBloc,
//                         );
//                       },
//                       child: Align(
//                           alignment: Alignment.topRight,
//                           child: AppSvg(name: "edit_button")),
//                     ),
//                     15.gapBox,
//                       CircleAvatar(
//                           radius: 70,
//                           backgroundColor: Colors.grey.shade200,
//                           backgroundImage: state.imageBytes != null &&
//                                   state.imageBytes!.isNotEmpty
//                               ? MemoryImage(state.imageBytes!)
//                               : const AssetImage('assets/images/profile.png')
//                                   as ImageProvider,
//                         ),
//                     15.gapBox,
//                     Text(
//                       (patientDetails?.fullName ?? "--").upperFirst,
//                       style: AppTextStyles.textStyle_600_20
//                           .copyWith(color: blackTextClr),
//                     ),
//                     Text(
//                       (patientDetails?.patientId ?? "--"),
//                       style: AppTextStyles.textStyle_400_16
//                           .copyWith(color: blackTextClr),
//                     ),
//                     5.gapBox,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         StatusBadge(status: "Critical"),
//                         20.wBox,
//                         StatusBadge(status: "Stage 3"),
//                       ],
//                     ),
//                     30.hBox,
//                     DetailsSection(
//                       title: "Personal Details",
//                       onEdit: () {},
//                       details: [
//                         {'label': 'Age', 'value': patientDetails?.age.toString() ?? ""},
//                         {
//                           'label': 'Gender',
//                           'value': patientDetails?.gender ?? "--"
//                         },
//                         {
//                           'label': 'Blood Type',
//                           'value': patientDetails?.bloodGroup ?? "--"
//                         },
//                         {
//                           'label': 'Contact',
//                           'value': patientDetails?.mobile ?? "--"
//                         },
//                       ],
//                     ),
//                     30.hBox,
//                     DetailsSection(
//                       title: "Diagnosis Details",
//                       onEdit: () {},
//                       details: [
//                         {'label': 'Cancer Type', 'value': 'Breast Cancer'},
//                         {'label': 'Stage', 'value': 'Stage 3'},
//                         {'label': 'Diagnosed Date', 'value': 'Jan 15, 2025'},
//                         {'label': 'Oncologist', 'value': 'Dr. Michael Chen'},
//                       ],
//                     ),
//                     30.hBox,
//                     TreatmentPlanSection(
//                       title: "Treatment Plan",
//                       actionText: "Update",
//                       onActionTap: () {},
//                       treatmentName: "Chemotherapy",
//                       status: "Active",
//                       sessionInfo: "Next session: Mar 15, 2025",
//                     ),
//                     30.hBox,
//                     StaticsSection(
//                       title: "Vital Statistics",
//                       actionText: "Update",
//                       onActionTap: () {},
//                       weight: "80",
//                       height: "176 cm",
//                     ),
//                     30.hBox,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Emergency Contacts",
//                           style: AppTextStyles.textStyle_600_18,
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: Text(
//                             "Edit",
//                             style: AppTextStyles.textStyle_400_14
//                                 .copyWith(color: blue2Clr),
//                           ),
//                         ),
//                       ],
//                     ),
//                     20.hBox,
//                     SizedBox(
//                       height: 200,
//                       child: ListView.separated(
//                           itemBuilder: (context, index) {
//                             return Row(
//                               children: [
//                                 Container(
//                                     height: 40,
//                                     width: 40,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: const Color.fromARGB(
//                                             255, 222, 226, 231)),
//                                     child: Icon(
//                                       Icons.person,
//                                       color: grey6Clr,
//                                     )),
//                                 15.wBox,
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       contactName[index],
//                                       style: AppTextStyles.textStyle_500_16,
//                                     ),
//                                     Text(relation[index],
//                                         style: AppTextStyles.textStyle_500_16
//                                             .copyWith(color: grey4Clr)),
//                                     Text(number[index],
//                                         style: AppTextStyles.textStyle_500_16
//                                             .copyWith(color: grey4Clr)),
//                                   ],
//                                 )
//                               ],
//                             );
//                           },
//                           separatorBuilder: (context, index) {
//                             return 20.hBox;
//                           },
//                           itemCount: contactName.length),
//                     ),
//                   ],
//                 );
//               },
//             ).paddingSymmetricHorizontal(24),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showPicker(
//       BuildContext context, String userId, AccountBloc bloc) async {
//     final picker = ImagePicker();

//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bottomSheetContext) => SafeArea(
//         child: Wrap(
//           children: [
//             ListTile(
//               title: Text(
//                 'Gallery',
//                 style: AppTextStyles.textStyle_600_18
//                     .copyWith(fontSize: 16, color: blueTextClr),
//                 textAlign: TextAlign.center,
//               ),
//               onTap: () async {
//                 Navigator.of(bottomSheetContext).pop();
//                 final picked =
//                     await picker.pickImage(source: ImageSource.gallery);
//                 if (picked != null) {
//                   // Use the passed bloc reference instead of context.read
//                   bloc.add(
//                     UploadProfileImageEvent(
//                       file: File(picked.path),
//                       userId: userId,
//                     ),
//                   );
//                 }
//               },
//             ),
//             ListTile(
//               title: Text(
//                 'Camera',
//                 style: AppTextStyles.textStyle_600_18
//                     .copyWith(fontSize: 16, color: blueTextClr),
//                 textAlign: TextAlign.center,
//               ),
//               onTap: () async {
//                 Navigator.of(bottomSheetContext).pop();
//                 final picked =
//                     await picker.pickImage(source: ImageSource.camera);
//                 if (picked != null) {
//                   // Use the passed bloc reference instead of context.read
//                   bloc.add(
//                     UploadProfileImageEvent(
//                       file: File(picked.path),
//                       userId: userId,
//                     ),
//                   );
//                 }
//               },
//             ),
//             ListTile(
//               minTileHeight: 67,
//               title: Text(
//                 'Cancel',
//                 style: AppTextStyles.textStyle_600_18
//                     .copyWith(fontSize: 16, color: grey4Clr),
//                 textAlign: TextAlign.center,
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TreatmentPlanSection extends StatelessWidget {
//   final String title;
//   final String actionText;
//   final VoidCallback? onActionTap;
//   final String treatmentName;
//   final String status;
//   final String sessionInfo;

//   const TreatmentPlanSection({
//     super.key,
//     required this.title,
//     required this.actionText,
//     this.onActionTap,
//     required this.treatmentName,
//     required this.status,
//     required this.sessionInfo,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: AppTextStyles.textStyle_600_18,
//             ),
//             GestureDetector(
//               onTap: onActionTap,
//               child: Text(
//                 actionText,
//                 style: AppTextStyles.textStyle_400_14.copyWith(color: blue2Clr),
//               ),
//             ),
//           ],
//         ),
//         20.hBox,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               treatmentName,
//               style: AppTextStyles.textStyle_500_16,
//             ),
//             StatusBadge(status: status),
//           ],
//         ).paddingSymmetricHorizontal(10),
//         10.hBox,
//         Text(
//           sessionInfo,
//           style: AppTextStyles.textStyle_400_14.copyWith(color: grey4Clr),
//         ).paddingSymmetricHorizontal(10),
//       ],
//     );
//   }
// }

// class StaticsSection extends StatelessWidget {
//   final String title;
//   final String actionText;
//   final VoidCallback? onActionTap;
//   final String weight;
//   final String height;

//   const StaticsSection({
//     super.key,
//     required this.title,
//     required this.actionText,
//     this.onActionTap,
//     required this.weight,
//     required this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: AppTextStyles.textStyle_600_18,
//             ),
//             GestureDetector(
//               onTap: onActionTap,
//               child: Text(
//                 actionText,
//                 style: AppTextStyles.textStyle_400_14.copyWith(color: blue2Clr),
//               ),
//             ),
//           ],
//         ),
//         20.hBox,
//         Row(
//           children: [
//             15.wBox,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Weight",
//                   style:
//                       AppTextStyles.textStyle_400_14.copyWith(color: grey4Clr),
//                 ),
//                 Text(
//                   weight,
//                   style: AppTextStyles.textStyle_500_18,
//                 ),
//               ],
//             ),
//             120.wBox,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Height",
//                   style:
//                       AppTextStyles.textStyle_400_14.copyWith(color: grey4Clr),
//                 ),
//                 Text(
//                   height,
//                   style: AppTextStyles.textStyle_500_18,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class DetailsSection extends StatelessWidget {
//   final String title;
//   final VoidCallback? onEdit;
//   final List<Map<String, String>> details;

//   const DetailsSection({
//     super.key,
//     required this.title,
//     required this.details,
//     this.onEdit,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: AppTextStyles.textStyle_600_18,
//             ),
//             GestureDetector(
//               onTap: onEdit,
//               child: Text(
//                 "Edit",
//                 style: AppTextStyles.textStyle_400_14.copyWith(color: blue2Clr),
//               ),
//             )
//           ],
//         ),
//         10.hBox,
//         ...details.map(
//           (item) => Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   item['label'] ?? '',
//                   style:
//                       AppTextStyles.textStyle_400_16.copyWith(color: grey2Clr),
//                 ),
//                 Text(
//                   item['value'] ?? '',
//                   style: AppTextStyles.textStyle_400_16,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class StatusBadge extends StatelessWidget {
//   final String status;

//   const StatusBadge({super.key, required this.status});

//   @override
//   Widget build(BuildContext context) {
//     Color bgColor;
//     Color textColor;

//     if (status.toLowerCase() == "critical") {
//       bgColor = const Color.fromARGB(255, 248, 211, 211);
//       textColor = const Color.fromARGB(255, 243, 46, 46);
//     } else if (status.toLowerCase() == "normal") {
//       bgColor = const Color.fromARGB(255, 198, 239, 207);
//       textColor = const Color.fromARGB(255, 40, 167, 69);
//     } else if (status.toLowerCase() == "active") {
//       bgColor = const Color.fromARGB(255, 198, 239, 207);
//       textColor = const Color.fromARGB(255, 40, 167, 69);
//     } else {
//       bgColor = const Color.fromARGB(255, 173, 194, 240);
//       textColor = blue2Clr;
//     }

//     return Container(
//       height: 24,
//       width: 65,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: bgColor,
//       ),
//       child: Center(
//         child: Text(
//           status,
//           style: AppTextStyles.textStyle_400_14.copyWith(color: textColor),
//         ),
//       ),
//     );
//   }
// }

// Widget moreOptions({
//   required String assetName,
//   required String label,
//   bool isForwardIconNeed = true,
//   VoidCallback? onTap,
// }) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: borderClr, width: 1),
//       ),
//       child: Row(
//         children: [
//           AppSvg(name: assetName),
//           12.wBox,
//           Text(label, style: AppTextStyles.textStyle_600_16),
//           const Spacer(),
//           if (isForwardIconNeed)
//             const Icon(Icons.arrow_forward_ios_outlined, size: 24),
//         ],
//       ).paddingAll(24),
//     ),
//   );
// }
