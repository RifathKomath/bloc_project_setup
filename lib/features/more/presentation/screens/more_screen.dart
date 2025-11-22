// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/core/utils/shared_pref.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/book_appointment_screen.dart';
// import 'package:easyfy_care_patient/features/feedback/presentation/screens/feedback_screen.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/account_screen/presentation/screen/account_screen.dart';
// import 'package:easyfy_care_patient/features/otp_screen/presentation/screens/send_otp_screen.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/screens/report_screen.dart';
// import 'package:flutter/material.dart';

// import '../../../appsettings/presentation/screens/app_settings_screen.dart';
// import '../../../treatments/presentation/screens/past_treatment_screen.dart';
// import '../widgets/menu_option.dart';

// class MoreScreen extends StatelessWidget {
//   const MoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Main content area with grid options
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   children: [
//                     MenuOption(
//                       icon: "profile-circle",
//                       label: 'Profile',
//                       onTap: () {
//                         open(context, AccountScreen());
//                       },
//                     ),
//                     MenuOption(
//                       icon: "chemo",
//                       label: 'Chemo Nearby',
//                       onTap: () {
//                         open(context, BookAppointmentScreen(isleadingRequired: true,));
//                       },
//                     ),
//                     MenuOption(
//                       icon: "records",
//                       label: 'My Records',
//                       onTap: () {
//                         open(context, ReportScreen());
//                       },
//                     ),
//                     MenuOption(
//                       icon: "feedback",
//                       label: 'Feedbacks',
//                       onTap: () {
//                         open(context, FeedbackScreen());
//                       },
//                     ),
//                     MenuOption(
//                       icon: "Hospital Sign",
//                       label: 'Past Treatments',
//                       onTap: () {
//                open(context, PastTreatmentScreen());
//                       },
//                     ),
//                     MenuOption(
//                       icon: "app_settings",
//                       label: 'App Settings',
//                       onTap: () {
//                         open(context, AppSettingsScreen());
//                       },
//                     ),
//                     MenuOption(
//                       icon: "logout",
//                       label: 'Logout',
//                       onTap: () {
//                         SharedPref().clearLoginResponse();
//                         SharedPref().clearPatientData();
//                         openAsNewPage(context, SendOtpScreen());
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
