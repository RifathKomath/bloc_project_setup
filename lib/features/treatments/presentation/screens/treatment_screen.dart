// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/home_screen.dart';
// import 'package:easyfy_care_patient/features/payments/presentation/screens/payment_screen.dart';
// import 'package:easyfy_care_patient/features/treatments/presentation/bloc/treatment_bloc.dart';
// import 'package:easyfy_care_patient/features/treatments/presentation/screens/invoice_screen.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/style.dart';
// import '../../../payments/presentation/screens/payment_request_screen.dart';

// class TreatmentScreen extends StatelessWidget {
//   const TreatmentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TreatmentBloc(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text("Treatments"),
//         ),
//         body: BlocBuilder<TreatmentBloc, TreatmentState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Divider(thickness: 0.5),
//                 20.hBox,
//                 TreatmentCard().paddingSymmetricHorizontal(16),
//               !state.isUpcoming?  20.hBox :SizedBox.shrink(),
//              !state.isUpcoming?   Row(
//                   children: [
//                     Expanded(
//                       child: CommonButton(
//                         label: 'Upcoming',
//                         onTap: () {
//                           context
//                               .read<TreatmentBloc>()
//                               .add(const ToggleAppointmentType(true));
//                         },
//                         bgColor: state.isUpcoming ? buttonColor : null,
//                         color: !state.isUpcoming ? Colors.white : null,
//                         textColor:
//                             state.isUpcoming ? Colors.white : blueTextClr,
//                         borderClr: state.isUpcoming ? null : blueTextClr,
//                       ),
//                     ),
//                     23.wBox,
//                     Expanded(
//                       child: CommonButton(
//                         label: 'Completed',
//                         onTap: () {
//                           context
//                               .read<TreatmentBloc>()
//                               .add(const ToggleAppointmentType(false));
//                         },
//                         color: state.isUpcoming ? Colors.white : null,
//                         bgColor: !state.isUpcoming ? buttonColor : null,
//                         textColor:
//                             !state.isUpcoming ? Colors.white : blueTextClr,
//                         borderClr: !state.isUpcoming ? null : blueTextClr,
//                       ),
//                     ),
//                   ],
//                 ).paddingSymmetricHorizontal(16):SizedBox.shrink(),
//                 25.hBox,
//                 Flexible(
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
//                       itemBuilder: (context, index) {
//                         return TreatmentListItem(
//                           isUpcoming: state.isUpcoming,
//                         );
//                       },
//                       separatorBuilder: (context, index) => 12.hBox,
//                       itemCount: 5),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class TreatmentListItem extends StatelessWidget {
//   const TreatmentListItem({
//     super.key,
//     required this.isUpcoming,
//   });
//   final bool isUpcoming;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: borderClr,
//           ),
//           borderRadius: BorderRadius.circular(12)),
//       padding: EdgeInsets.all(17),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Cycle 3",
//                 style: AppTextStyles.textStyle_600_16
//                     .copyWith(color: !isUpcoming ? grey10Clr : Colors.black),
//               ),
//               CustomChip(
//                 textClr: Colors.white,
//                 bgClr: isUpcoming ? yellowClr : grey10Clr,
//                 text: isUpcoming ? "Upcoming" : "Completed",
//               )
//             ],
//           ),
//           12.hBox,
//           GestureDetector(
//             onTap: () {
//               open(context, InvoiceScreen());
//             },
//             child: Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: filterchipClr,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Date",
//                     style: AppTextStyles.textStyle_400_14
//                         .copyWith(color: grey6Clr),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "May 30, 2025",
//                         style: AppTextStyles.textStyle_500_16,
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         size: 14,
//                         color: grey8Clr,
//                       )
//                     ],
//                   ),
//                   5.hBox,
//                   Text(
//                     "City Cancer Center",
//                     style: AppTextStyles.textStyle_400_14,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           12.hBox,
//           isUpcoming
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     AppSvg(name: "capsule"),
//                     8.wBox,
//                     Text(
//                       "Drugs Dispatched",
//                       style: AppTextStyles.textStyle_600_14
//                           .copyWith(color: primaryColor),
//                     ),
//                   ],
//                 )
//               : 0.hBox,
//           12.hBox,
//           isUpcoming
//               ? CommonButton(label: "Make Payment", onTap: () {open(context, PaymentRequestScreen());})
//               : 0.hBox,
//         ],
//       ),
//     );
//   }
// }

// class TreatmentCard extends StatelessWidget {
//   const TreatmentCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 26, horizontal: 15),
//       decoration: BoxDecoration(
//           color: grey3Clr,
//           border: Border.all(color: grey9Clr),
//           borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Modified FOLFOX-6 ",
//             style: AppTextStyles.textStyle_500_16,
//           ),
//           9.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Cycle Progress',
//                 style: AppTextStyles.textStyle_400_14,
//               ),
//               Text(
//                 '3/6',
//                 style:
//                     AppTextStyles.textStyle_400_14.copyWith(color: blueTextClr),
//               ),
//             ],
//           ),
//           8.hBox,
//           LinearProgressIndicator(
//             value: .3,
//             minHeight: 8,
//             color: blueTextClr,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ],
//       ),
//     );
//   }
// }
