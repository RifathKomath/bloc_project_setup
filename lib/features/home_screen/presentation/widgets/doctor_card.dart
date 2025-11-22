// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/home_screen/domain/entity/allocated_doctor_entity.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/widgets/dashboard_card.dart';
// import 'package:flutter/material.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/style.dart';
// import '../../../booking_appointment_screen/presentation/screens/take_appointment_screen.dart';
// import '../../../chat_screen/presentation/screens/chat_screen.dart';

// class DoctorCard extends StatelessWidget {
//   const DoctorCard({
//     super.key,
//     required this.doctorDetails,
//   });

//   final DoctorDetailsEntity doctorDetails;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 19, horizontal: 16),
//       decoration: BoxDecoration(
//           border: Border.all(color: borderClr, width: 1),
//           borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const CircleAvatar(
//                 radius: 28,
//                 backgroundImage: AssetImage('assets/images/drprofile.png'),
//               ),
//               16.gapBox,
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     doctorDetails.doctorName ?? "",
//                     style: AppTextStyles.textStyle_600_20,
//                   ),
//                   4.gapBox,
//                   Text('Your Primary Doctor',
//                       style: AppTextStyles.textStyle_500_12
//                           .copyWith(color: greyColor)),
//                 ],
//               ),
//             ],
//           ),
//           16.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               DashboardActionCard(
//                 title: "Chat",
//                 iconPath: "chat_icon",
//                 onTap: () {
//                   open(context, BaseScreen(currentIndex: 3));
//                 },
//               ),
//               8.wBox,
//               DashboardActionCard(
//                 title: "Online\nConsultation",
//                 onTap: () {
//                   open(context,
//                       TakeAppointmentScreen(heading: "Online Consultation"));
//                 },
//                 iconPath: "video_cam",
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
