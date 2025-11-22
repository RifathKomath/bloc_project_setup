// import 'dart:convert';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/shared_pref.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/book_appointment_screen.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/take_appointment_screen.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/widgets/rating_widget.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import '../../../../config.dart';
// import '../../../../core/utils/screen_utils.dart';
// import '../../../base_screen/presentation/base_screen.dart';
// import '../../../no_data_screen/presentation/screens/no_data_screen.dart';
// import '../widgets/service_container.dart';
// import '../widgets/treatment_center_location_widget.dart';

// class HospitalDetailScreen extends StatefulWidget {
//   const HospitalDetailScreen({
//     super.key,
//     required this.hospital,
//     required this.address,
//     required this.city,
//     required this.hospitalImage,
//     required this.latitude,
//     required this.longitude,
//     required this.pinCode,
//     required this.state,
//   });

//   final String hospital;
//   final String hospitalImage;
//   final String address;
//   final String city;
//   final String state;
//   final String pinCode;
//   final double latitude;
//   final double longitude;

//   @override
//   State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
// }

// class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await SharedPref().getUserDataByRegister();
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           widget.hospital,
//           overflow: TextOverflow.ellipsis,
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(2),
//           child: Container(
//             width: double.infinity,
//             height: 1,
//             color: borderClr,
//           ),
//         ),
//         forceMaterialTransparency: true,
//         leading: GestureDetector(
//           onTap: () {
//             close(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new,
//             size: 18.5,
//           ),
//         ),
//       ),
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Divider(thickness: 0.5),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//             child: CommonButton(
//               label: "Request Appointment",
//               onTap: () {
//                 if (patientDetails != null &&
//                     patientDetails?.status == "A") {
//                   openAsNewPage(context, BaseScreen(currentIndex: 0));
//                 } else {
//                   openAsNewPage(context, const NoDataScreen());
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         padding: const EdgeInsets.all(16),
//         children: [
//           Container(
//             height: 130,
//             decoration: BoxDecoration(
//               border: Border.all(color: borderClr),
//               borderRadius: BorderRadius.circular(12),
//               image: DecorationImage(
//                 image: NetworkImage(widget.hospitalImage),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           18.hBox,
//           Text(
//             "Services",
//             style: AppTextStyles.textStyle_500_12
//                 .copyWith(color: blackTextClr, fontSize: 18),
//           ),
//           18.hBox,
//           GestureDetector(onTap: () {}, child: const ServiceDataContainer()),
//           18.hBox,
//           TreatmentCenterLocationWidget(
//             address:
//                 "${widget.address}, ${widget.city}, ${widget.state}, ${widget.pinCode}",
//             latitude: widget.latitude,
//             longitude: widget.longitude,
//           ),
//           18.hBox,
//           const RatingWidget(),
//         ],
//       ),
//     );
//   }
// }

