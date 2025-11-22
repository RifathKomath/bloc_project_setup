// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/widgets/apptextfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../widgets/common_report_card.dart';
// import '../widgets/show_file_picker.dart';

// class ReportDetailsScreen extends StatelessWidget {
//   final String? heading;
//   const ReportDetailsScreen({super.key, this.heading});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> reports = [
//       {
//         "title": "Chaemotherapy test report",
//         "subtitle": "03/11/2025  -  73.01 kB",
//       },
//       {
//         "title": "Chaemotherapy test report",
//         "subtitle": "03/11/2025  -  73.01 kB",
//       },
//       {
//         "title": "Chaemotherapy test report",
//         "subtitle": "03/11/2025  -  73.01 kB",
//       },
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(heading ?? ""),
//       ),
//       floatingActionButton: GestureDetector(
//         onTap: () => showPicker(context,
//             documentType: "", userId: patientDetails?.id ?? 0),
//         child: Container(
//           width: 133,
//           decoration: BoxDecoration(
//             color: blueTextClr,
//             borderRadius: BorderRadius.circular(32),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset("assets/images/upload_icon.svg"),
//                 const SizedBox(width: 8),
//                 Text("Upload",
//                     style: AppTextStyles.textStyle_500_14
//                         .copyWith(color: Colors.white)),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           const Divider(thickness: 0.5),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: AppTextField(
//               prefixIcon: const Icon(Icons.search),
//               hint: "Search",
//               borderColor: textborderClr,
//             ),
//           ),
//           10.gapBox,
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ListView.separated(
//                 itemCount: reports.length,
//                 separatorBuilder: (_, __) => 15.gapBox,
//                 itemBuilder: (context, index) {
//                   final report = reports[index];
//                   return ReportCard(
//                     imagePath: 'assets/images/pdf.svg',
//                     title: report["title"]!,
//                     subtitle: report["subtitle"]!,
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
