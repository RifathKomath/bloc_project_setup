// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/home_screen.dart';
// import 'package:easyfy_care_patient/features/payments/presentation/bloc/payment_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/utils/screen_utils.dart';
// import '../../../../widgets/common_button.dart';

// class PaymentRequestScreen extends StatelessWidget {
//   const PaymentRequestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PaymentBloc(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text("Invoice"),
//             automaticallyImplyLeading: false,
//             leading: GestureDetector(
//             onTap: () {
//               close(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios_new,
//               size: 18.5,
//             )),
//         ),
//         body: BlocBuilder<PaymentBloc, PaymentState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Divider(thickness: 0.5),
//                 // 16.hBox,
//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //       child: CommonButton(
//                 //         label: 'Pending',
//                 //         onTap: () {
//                 //           context
//                 //               .read<PaymentBloc>()
//                 //               .add(const ToggleButtonType(true));
//                 //         },
//                 //         bgColor: state.isPending ? buttonColor : null,
//                 //         color: !state.isPending ? Colors.white : null,
//                 //         textColor: state.isPending ? Colors.white : blueTextClr,
//                 //         borderClr: state.isPending ? null : blueTextClr,
//                 //       ),
//                 //     ),
//                 //     23.wBox,
//                 //     Expanded(
//                 //       child: CommonButton(
//                 //         label: 'Past',
//                 //         onTap: () {
//                 //           context
//                 //               .read<PaymentBloc>()
//                 //               .add(const ToggleButtonType(false));
//                 //         },
//                 //         color: state.isPending ? Colors.white : null,
//                 //         bgColor: !state.isPending ? buttonColor : null,
//                 //         textColor:
//                 //             !state.isPending ? Colors.white : blueTextClr,
//                 //         borderClr: !state.isPending ? null : blueTextClr,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ).paddingSymmetricHorizontal(16),
//                 25.hBox,
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 14, vertical: 17),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: borderClr)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Chemotherapy Cycle 03",
//                         style: AppTextStyles.textStyle_600_16,
//                       ),
//                       Text(
//                         "March 15, 2024 • 10:00 AM",
//                         style: AppTextStyles.textStyle_400_14
//                             .copyWith(color: grey5Clr),
//                       ),
                      
//                       17.hBox,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Amount",
//                             style: AppTextStyles.textStyle_400_16
//                                 .copyWith(color: grey5Clr),
//                           ),
//                           Text('\$849.99',
//                               style: AppTextStyles.textStyle_600_16),
//                         ],
//                       ),
//                       12.hBox,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Due Date",
//                             style: AppTextStyles.textStyle_400_16
//                                 .copyWith(color: grey5Clr),
//                           ),
//                           Text(
//                             "Mar 25, 2025",
//                             style: AppTextStyles.textStyle_400_16
//                                 .copyWith(color: redClr),
//                           ),
//                         ],
//                       ),
//                        17.hBox,
//                      Text(
//                         "Invoice #",
//                         style: AppTextStyles.textStyle_400_14
//                             .copyWith(color: grey5Clr),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "INV-2025-089",
//                             style: AppTextStyles.textStyle_600_16,
//                           ),
//                           Text(
//                             "View Invoice",
//                             style: AppTextStyles.textStyle_500_14.copyWith(color: blueTextClr),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ).paddingSymmetricHorizontal(16)
//               ],
//             );
//           },
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(16),
//           child: CommonButton(label: "Pay Now", onTap: (){}),
//         ),
//       ),
//     );
//   }
// }
