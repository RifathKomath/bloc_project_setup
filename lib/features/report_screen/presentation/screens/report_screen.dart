// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/chat_screen/presentation/bloc/chat_bloc.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/bloc/report_bloc.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/bloc/report_event.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/bloc/report_state.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/screens/report_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/utils/screen_utils.dart';
// import '../../../chat_screen/presentation/screens/chat_screen.dart';
// import '../widgets/common_report_card.dart';

// class ReportScreen extends StatelessWidget {
//   const ReportScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> report = [
//       {
//         "image": "assets/images/report1.svg",
//         "title": "Discharge Summaries",
//       },
//       {
//         "image": "assets/images/report1.svg",
//         "title": "Medial Prescriptions",
//       },
//       {
//         "image": "assets/images/report1.svg",
//         "title": "Chemo Chart",
//       },
//     ];

//     final List<Map<String, String>> reports = [
//       {
//         "image": "assets/images/report1.svg",
//         "title": "Lab Reports",
//         "subtitle": "Upload test results and scans",
//       },
//       {
//         "image": "assets/images/report1.svg",
//         "title": "Imaging Reports",
//         "subtitle": "Upload test results and scans",
//       },
//       {
//         "image": "assets/images/report2.svg",
//         "title": "Pharmacy Reports",
//         "subtitle": "Medication history and prescriptions",
//       },
//       {
//         "image": "assets/images/report3.svg",
//         "title": "Operative Reports",
//         "subtitle": "Surgery and procedure details",
//       },
//       {
//         "image": "assets/images/report4.svg",
//         "title": "Insurance",
//         "subtitle": "Medical procedure agreements",
//       },
//       {
//         "image": "assets/images/report4.svg",
//         "title": "Other Documents",
//         "subtitle": "Additional medical records",
//       },
//     ];

//     return WillPopScope(
//       onWillPop: () async {
//         open(context, BaseScreen(currentIndex: 4));
//         return false; // Prevent default pop
//       },
//       child: BlocProvider(
//         create: (context) => ReportBloc()..add(SelectMedicalRecordTabEvent()),
//         child: Scaffold(
//           backgroundColor: Colors.white,
//             appBar: AppBar(
//             title: Text("My Records"),
//             automaticallyImplyLeading: false,
//             leading: GestureDetector(
//               onTap: () {
//                 close(context);
//               },
//               child: Icon(Icons.arrow_back_ios_new,size: 18.5,)),
//           ),
//           body: Column(
//             children: [
//               const Divider(thickness: 0.5),
//               5.hBox,
//               BlocBuilder<ReportBloc, ReportState>(
//                 builder: (context, state) {
//                   final isMedicalRecordSelected =
//                       state is MedicalRecordSelectedState;
//                   final isReportScreenSelected =
//                       state is TestReportSelectedState;
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomTabButton(
//                         label: "Medical Records",
//                         isSelected: isMedicalRecordSelected,
//                         onTap: () {
//                           context
//                               .read<ReportBloc>()
//                               .add(SelectMedicalRecordTabEvent());
//                         },
//                       ),
//                       CustomTabButton(
//                         label: "Test Reports",
//                         isSelected: isReportScreenSelected,
//                         onTap: () {
//                           context
//                               .read<ReportBloc>()
//                               .add(SelectTestReportTabEvent());
//                         },
//                       ),
//                     ],
//                   ).paddingSymmetricHorizontal(15);
//                 },
//               ),
//               Expanded(
//                 child: BlocBuilder<ReportBloc, ReportState>(
//                   builder: (context, state) {
//                     if (state is MedicalRecordSelectedState) {
//                       return Column(
//                         children: [
//                           5.hBox,
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20.0, vertical: 10),
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "View or upload your medical records",
//                                 style: AppTextStyles.textStyle_500_12,
//                               ),
//                             ),
//                           ),
//                           5.hBox,
//                           Expanded(
//                             child: ListView.separated(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 20),
//                               itemCount: report.length,
//                               separatorBuilder: (_, __) => 15.gapBox,
//                               itemBuilder: (context, index) {
//                                 final info = report[index];
//                                 return ReportCard(
//                                   height: 73,
//                                   imagePath: info["image"]!,
//                                   title: info["title"]!,
//                                   onArrowTap: () {
//                                     open(
//                                         context,
//                                         ReportDetailsScreen(
//                                             heading: info["title"]!));
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     } else if (state is TestReportSelectedState) {
//                       return Column(
//                         children: [
//                           5.hBox,
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20.0, vertical: 10),
//                             child: Text(
//                               "Please upload all your test results, secure scan, blood test reports",
//                               style: AppTextStyles.textStyle_500_12,
//                             ),
//                           ),
//                           5.hBox,
//                           Expanded(
//                             child: ListView.separated(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 20),
//                               itemCount: reports.length,
//                               separatorBuilder: (_, __) => 15.gapBox,
//                               itemBuilder: (context, index) {
//                                 final report = reports[index];
//                                 return ReportCard(
//                                   imagePath: report["image"]!,
//                                   title: report["title"]!,
//                                   subtitle: report["subtitle"]!,
//                                   onArrowTap: () {
//                                     open(
//                                         context,
//                                         ReportDetailsScreen(
//                                             heading: report["title"]!));
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     }
//                     return SizedBox();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
