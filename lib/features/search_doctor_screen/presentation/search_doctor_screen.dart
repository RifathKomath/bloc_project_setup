// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/screens/register_screen.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/domain/entity/doctor_list_entity.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/presentation/bloc/search_doctor_bloc.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/presentation/bloc/search_doctor_state.dart';
// import 'package:easyfy_care_patient/widgets/app_loader.dart';
// import 'package:easyfy_care_patient/widgets/app_success_dialog.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/apptextfield.dart';
// import 'package:easyfy_care_patient/widgets/common_snack_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../core/network/di.dart';

// class SearchDoctorScreen extends StatelessWidget {
//   final String? mobileNumber;
//   const SearchDoctorScreen({super.key, this.mobileNumber});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         final bloc = getIt<SearchDoctorBloc>();
//         bloc.add(FetchDoctorsEvent());
//         return bloc;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           forceMaterialTransparency: true,
//           backgroundColor: Colors.white,
//           // leading: GestureDetector(
//           //   onTap: () => close(context),
//           //   child: Padding(
//           //     padding: const EdgeInsets.only(right: 10),
//           //     child: Icon(Icons.arrow_back_ios, size: 18),
//           //   ),
//           // ),
//           title: Text(
//             "Choose Doctor",
//           ),
//         ),
//         body: BlocConsumer<SearchDoctorBloc, SearchDoctorState>(
//           listener: (context, state) {
//             // TODO: implement listener
//             if (state.error.isNotEmpty) {
//               showCustomSnackBar(context, state.error, isError: true);
//             }

//             // Handle allocation success
//             if (state.isAllocationSuccess) {
//               SuccessDialog.show(
//                 context,
//                 message: "Request Sent Successfully ",
//                 onComplete: () {
//                   open(context, BaseScreen(currentIndex: 0));
//                 },
//               );
//             }

//             // Handle allocation errors
//             if (state.allocationError.isNotEmpty) {
//               showCustomSnackBar(context, state.allocationError, isError: true);
//             }
//           },
//           builder: (context, state) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Divider below appbar
//                 Divider(thickness: 0.5),
//                 27.hBox,
//                 Text(
//                   "You are not associated with any doctor yet",
//                   style: AppTextStyles.textStyle_600_20,
//                   textAlign: TextAlign.center,
//                 ),
//                 38.hBox,
//                 Text("Choose your doctor",
//                         style: AppTextStyles.textStyle_500_18)
//                     .paddingSymmetricHorizontal(16),
//                 9.hBox,
//                 if (state.isLoading)
//                   const Expanded(
//                     child: Center(
//                       child: AppLoader(),
//                     ),
//                   )
//                 else if (state.filteredDoctors == null ||
//                     state.filteredDoctors!.isEmpty)
//                   const Expanded(
//                     child: Center(
//                       child: Text(
//                         "No doctors found",
//                         style: AppTextStyles.textStyle_500_14,
//                       ),
//                     ),
//                   )
//                 else
//                   Expanded(
//                     child: ListView.separated(
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (context, index) {
//                         final doctor = state.filteredDoctors![index];
//                         return DoctorTile(
//                           mobileNumber: mobileNumber,
//                           doctor: doctor,
//                           isAllocating: state.isAllocating &&
//                               state.allocationData?.success == true,
//                         );
//                       },
//                       separatorBuilder: (context, index) => const Divider(
//                         thickness: 0.5,
//                       ),
//                       itemCount: state.filteredDoctors!.length,
//                     ),
//                   ),

//                 // Divider after last tile
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Divider(thickness: 0.5),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class DoctorTile extends StatelessWidget {
//   const DoctorTile(
//       {super.key,
//       this.ischat = false,
//       required this.doctor,
//       this.mobileNumber,
//       this.isAllocating});
//   final bool ischat;
//   final String? mobileNumber;
//   final DoctorEntity doctor;
//   final bool? isAllocating;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         contentPadding: EdgeInsets.symmetric(horizontal: 0),
//         leading:  CircleAvatar(
//                                     radius: 28,
//                                     backgroundColor: Colors.grey.shade200,
//                                     backgroundImage:
//                                         doctor.profilePicUrl!= null
//                                             ? NetworkImage(
//                                                 doctor.profilePicUrl ?? "")
//                                             : const AssetImage(
//                                                     'assets/images/profile.png')
//                                                 as ImageProvider,
//                                   ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               doctor.fullName ?? "Dr. Narayanan",
//               style:
//                   AppTextStyles.textStyle_600_14.copyWith(color: lightBlackClr),
//             ),
//             Text(
//               ischat ? "Hey collect your reports" : "Oncologist",
//               style: AppTextStyles.textStyle_400_14
//                   .copyWith(fontSize: 12, color: lightBlackClr),
//             ),
//           ],
//         ),
//         trailing: ischat
//             ? Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "5:14 PM",
//                     style: AppTextStyles.textStyle_500_12
//                         .copyWith(color: blueTextClr, fontSize: 8),
//                   ),
//                   CircleAvatar(
//                     backgroundColor: blueTextClr,
//                     radius: 8,
//                     child: Text("3",
//                         style: AppTextStyles.textStyle_500_12
//                             .copyWith(color: Colors.white, fontSize: 8)),
//                   )
//                 ],
//               )
//             : GestureDetector(
//                 onTap: () {
//   if (isAllocating != true) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => RegisterScreen(
//           phoneNumber: mobileNumber ?? "",
//           id: doctor.id ?? 0,
//           doctorName: doctor.fullName ?? "",
//           profileImage: doctor.profilePicUrl ?? "",
//         ),
//       ),
//     );
//   }
// },

//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: blueTextClr,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: blueTextClr,
//                           borderRadius: BorderRadius.circular(8)),
//                       child: isAllocating == true
//                           ? SizedBox(
//                               width: 24,
//                               height: 24,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                                 strokeWidth: 2,
//                               ),
//                             )
//                           : AppSvg(
//                               name: "add_btn",
//                             )),
//                 ),
//               ));
//   }

//   void _allocateDoctor(BuildContext context, String doctorId) {
//     context
//         .read<SearchDoctorBloc>()
//         .add(AllocateDoctorEvent(doctorId: doctorId));
//   }
// }
