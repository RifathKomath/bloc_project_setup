// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/home_screen.dart';
// import 'package:easyfy_care_patient/features/payments/presentation/bloc/payment_bloc.dart';
// import 'package:easyfy_care_patient/features/payments/presentation/screens/payment_choosing_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../widgets/common_button.dart';

// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PaymentBloc(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text("Payment & Invoices"),
//         ),
//         body: BlocBuilder<PaymentBloc, PaymentState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Divider(thickness: 0.5),
//                 16.hBox,
//                 Row(
//                   children: [
//                     Expanded(
//                       child: CommonButton(
//                         label: 'Pending',
//                         onTap: () {
//                           context
//                               .read<PaymentBloc>()
//                               .add(const ToggleButtonType(true));
//                         },
//                         bgColor: state.isPending ? buttonColor : null,
//                         color: !state.isPending ? Colors.white : null,
//                         textColor: state.isPending ? Colors.white : blueTextClr,
//                         borderClr: state.isPending ? null : blueTextClr,
//                       ),
//                     ),
//                     23.wBox,
//                     Expanded(
//                       child: CommonButton(
//                         label: 'Past',
//                         onTap: () {
//                           context
//                               .read<PaymentBloc>()
//                               .add(const ToggleButtonType(false));
//                         },
//                         color: state.isPending ? Colors.white : null,
//                         bgColor: !state.isPending ? buttonColor : null,
//                         textColor:
//                             !state.isPending ? Colors.white : blueTextClr,
//                         borderClr: !state.isPending ? null : blueTextClr,
//                       ),
//                     ),
//                   ],
//                 ).paddingSymmetricHorizontal(16),
//                 25.hBox,
//                 Expanded(
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return state.isPending
//                             ? PaymentContainer()
//                             : PaymentPaidContainer();
//                       },
//                       separatorBuilder: (context, index) {
//                         return 20.hBox;
//                       },
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

// class PaymentContainer extends StatelessWidget {
//   const PaymentContainer({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 14, vertical: 17),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: borderClr)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Chemotherapy Cycle 03",
//                 style: AppTextStyles.textStyle_600_16,
//               ),
//               CustomChip(
//                 textClr: redClr,
//                 text: "Pending",
//                 bgClr: lightredClr,
//               )
//             ],
//           ),
//           Text(
//             "March 15, 2024 • 10:00 AM",
//             style: AppTextStyles.textStyle_400_14.copyWith(color: grey5Clr),
//           ),
//           17.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Amount",
//                 style: AppTextStyles.textStyle_400_16.copyWith(color: grey5Clr),
//               ),
//               Text('\$849.99', style: AppTextStyles.textStyle_600_16),
//             ],
//           ),
//           12.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Due Date",
//                 style: AppTextStyles.textStyle_400_16.copyWith(color: grey5Clr),
//               ),
//               Text(
//                 "Mar 25, 2025",
//                 style: AppTextStyles.textStyle_400_16.copyWith(color: redClr),
//               ),
//             ],
//           ),
//           17.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Invoice #",
//                 style: AppTextStyles.textStyle_400_14.copyWith(color: grey5Clr),
//               ),
//               Text(
//                 "View Invoice",
//                 style:
//                     AppTextStyles.textStyle_500_14.copyWith(color: blueTextClr),
//               ),
//             ],
//           ),
//           Text(
//             "INV-2025-089",
//             style: AppTextStyles.textStyle_600_16,
//           ),
//           17.hBox,
//           CommonButton(
//             label: "Pay Now",
//             onTap: () {
//               open(context, PaymentChoosingScreen());
//             },
//           )
//         ],
//       ),
//     ).paddingSymmetricHorizontal(16);
//   }
// }

// class PaymentPaidContainer extends StatelessWidget {
//   const PaymentPaidContainer({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 14, vertical: 17),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: borderClr)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Chemotherapy Cycle 03",
//                 style: AppTextStyles.textStyle_600_16,
//               ),
//               CustomChip(
//                 textClr: greenColor,
//                 text: "Paid",
//                 bgClr: const Color.fromARGB(255, 232, 244, 238),
//               )
//             ],
//           ),
//           Text(
//             "March 15, 2024 • 10:00 AM",
//             style: AppTextStyles.textStyle_400_14.copyWith(color: grey5Clr),
//           ),
//           17.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Amount",
//                 style: AppTextStyles.textStyle_400_16.copyWith(color: grey5Clr),
//               ),
//               Text('\$849.99', style: AppTextStyles.textStyle_600_16),
//             ],
//           ),
//           12.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Due Date",
//                 style: AppTextStyles.textStyle_400_16.copyWith(color: grey5Clr),
//               ),
//               Text(
//                 "Mar 25, 2025",
//                 style: AppTextStyles.textStyle_400_16.copyWith(color: redClr),
//               ),
//             ],
//           ),
//           17.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Invoice #",
//                 style: AppTextStyles.textStyle_400_14.copyWith(color: grey5Clr),
//               ),
//               Text(
//                 "View Invoice",
//                 style:
//                     AppTextStyles.textStyle_500_14.copyWith(color: blueTextClr),
//               ),
//             ],
//           ),
//           Text(
//             "INV-2025-089",
//             style: AppTextStyles.textStyle_600_16,
//           ),
//         ],
//       ),
//     ).paddingSymmetricHorizontal(16);
//   }
// }
