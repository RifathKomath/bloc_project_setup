// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/bloc/appointment_bloc.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/area_selection_screen.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/hospital_detail_screen.dart';
// import 'package:easyfy_care_patient/widgets/app_loader.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/apptextfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/constants/colors.dart';

// import '../bloc/appointment_state.dart';

// class BookAppointmentScreen extends StatelessWidget {
//   final bool isleadingRequired;
//   const BookAppointmentScreen({super.key, this.isleadingRequired = false});

//   @override
//   Widget build(BuildContext context) {
//     // final filterButtons = ["Available Today", "Gender", "Price"];
//     return BlocProvider(
//       create: (context) {
//         final bloc = getIt<AppointmentBloc>();
//         bloc.add(CenterLisingEvent());
//         return bloc;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text("Chemo nearby"),
//           automaticallyImplyLeading: false,
//           leading: isleadingRequired
//               ? GestureDetector(
//                   onTap: () {
//                     close(context);
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios_new,
//                     size: 18.5,
//                   ))
//               : null,
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Divider(thickness: 0.2),
//             18.hBox,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Kochi, Kalamassery 682021",
//                     style: AppTextStyles.textStyle_500_16
//                         .copyWith(fontSize: 18, color: blackTextClr),
//                   ),
//                   AppSvg(name: "current location",ontap: () {
//                     open(context, AreaSelectionScreen());
//                   },)
//                 ],
//               ),
//             ),
//             18.hBox,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   width: 302,
//                   child: AppTextField(
//                     prefixIcon: Icon(Icons.search),
//                     hint: "Search by name",
//                     borderColor: textborderClr,
//                   ).paddingSymmetricHorizontal(16),
//                 ),
//                 AppSvg(name: "filter").paddingSymmetricHorizontal(16)
//               ],
//             ),


//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             //   child: Row(
//             //     mainAxisSize: MainAxisSize.min,
//             //     mainAxisAlignment: MainAxisAlignment.start,
//             //     children: [
//             //       Expanded(
//             //         child: AppTextField(
//             //           prefixIcon: Icon(Icons.search),
//             //           hint: "Search",
//             //           borderColor: textborderClr,
//             //         ),
//             //       ),
//             //       8.wBox,
//             //       AppSvg(name: "filter")
//             //     ],
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: 40,
//             //   child: ListView.builder(
//             //     scrollDirection: Axis.horizontal,
//             //     padding: EdgeInsets.symmetric(horizontal: 16),
//             //     itemCount: filterButtons.length,
//             //     itemBuilder: (context, index) {
//             //       return Padding(
//             //         padding: EdgeInsets.only(right: 8),
//             //         child: FilterContainer(
//             //           filter: filterButtons[index],
//             //         ),
//             //       );
//             //     },
//             //   ),
//             // ),


//             22.hBox,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 "Choose Your Treatment Center",
//                 style: AppTextStyles.textStyle_500_16
//                     .copyWith(fontSize: 18, color: blackTextClr),
//               ),
//             ),
//             5
//             .hBox,
//             Expanded(
//               child: BlocBuilder<AppointmentBloc, AppointmentState>(
//                 builder: (context, state) {
//                   if (state.isLoading) {
//                     return Center(child: AppLoader());
//                   }

//                   if (state.isError) {
//                     return Center(child: Text("Error: ${state.error}"));
//                   }

//                   if (state.treatmentCenterList == null ||
//                       state.treatmentCenterList!.isEmpty) {
//                     return Center(
//                         child: Text("No nearby treatment centers found"));
//                   }

//                   return ListView.separated(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     itemCount: state.treatmentCenterList!.length,
//                     separatorBuilder: (context, index) => SizedBox(height: 16),
//                     itemBuilder: (context, index) {
//                       final center = state.treatmentCenterList![index];
//                       return GestureDetector(
//                         onTap: () {
//                           open(
//                               context,
//                               HospitalDetailScreen(
//                                   address: center.address ?? "",
//                                   hospitalImage: center.profilePicUrl ?? "",
//                                   latitude: center.latitude ?? 0.0,
//                                   longitude: center.longitude ?? 0.0,
//                                   pinCode: center.pincode ?? "",
//                                   state: center.state ?? "",
//                                   city: center.city ?? "",
//                                   hospital: center.hospitalName ?? ""));
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: grey3Clr,
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 leading: CircleAvatar(
//                                   radius: 21,
//                                   backgroundImage:
//                                       NetworkImage(center.profilePicUrl ?? ""),
//                                 ),
//                                 title: Text(
//                                   center.hospitalName ?? "Unknown Hospital",
//                                   style:
//                                       AppTextStyles.textStyle_600_14.copyWith(
//                                     fontSize: 16,
//                                     color: lightBlackClr,
//                                   ),
//                                 ),
//                                 subtitle: Text(
//                                   "${center.hospitalTypeName} | ${center.patientsCount}+ Patients",
//                                   style: AppTextStyles.textStyle_400_14
//                                       .copyWith(color: grey4Clr),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(center.rating.toString()),
//                                   5.wBox,
//                                   AppSvg(name: "rating_icon"),
//                                   17.5.wBox,
//                                   AppSvg(name: "clock_icon"),
//                                   7.wBox,
//                                   Text(
//                                     center.opStartTime ?? "--",
//                                     style: AppTextStyles.textStyle_400_14,
//                                   ),
//                                   5.wBox,
//                                   Text(
//                                     center.opEndTime ?? "--",
//                                     style: AppTextStyles.textStyle_400_14,
//                                   ),
//                                   Spacer(),
//                                   AppSvg(name: "location_icon"),
//                                   4.wBox,
//                                   Text(
//                                     "6.7 km",
//                                     style: AppTextStyles.textStyle_400_14
//                                         .copyWith(fontSize: 12),
//                                   ),
//                                 ],
//                               ).paddingSymmetricHorizontal(17),
//                               16.hBox
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HospitalTile extends StatelessWidget {
//   const HospitalTile({
//     super.key,
//     required this.hospital,
//   });

//   final String hospital;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: grey3Clr, borderRadius: BorderRadius.circular(16)),
//       child: Column(
//         children: [
//           ListTile(
//             leading: CircleAvatar(
//               radius: 21,
//               backgroundImage: AssetImage("assets/images/doctor.png"),
//             ),
//             title: Text(
//               hospital,
//               style: AppTextStyles.textStyle_600_14
//                   .copyWith(fontSize: 16, color: lightBlackClr),
//             ),
//             subtitle: Text(
//               "Super speciality | 200+ Patients",
//               style: AppTextStyles.textStyle_400_14.copyWith(color: grey4Clr),
//             ),
//           ),
//           Row(
//             children: [],
//           ),
//           AppSvg(name: "footer"),
//           16.hBox
//         ],
//       ),
//     );
//   }
// }

// class FilterContainer extends StatelessWidget {
//   const FilterContainer({super.key, required this.filter});

//   final String filter;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: filterchipClr,
//           border: Border.all(width: 1, color: blue1Clr)),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             filter,
//             style: AppTextStyles.textStyle_700_28
//                 .copyWith(color: blackTextColor, fontSize: 12),
//           ),
//           12.wBox,
//           Icon(
//             Icons.arrow_drop_down,
//             color: blackTextColor,
//           )
//         ],
//       ),
//     );
//   }
// }
