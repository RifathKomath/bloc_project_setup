// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_bloc.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_event.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/network/di.dart';
// import '../../../../core/utils/screen_utils.dart';
// import '../../../../widgets/app_loader.dart';
// import '../../../../widgets/common_button.dart';
// import '../widgets/success_screen.dart';

// class TermsAndConditionScreen extends StatelessWidget {
//   final int? userId;
//   TermsAndConditionScreen({super.key, required this.userId});
//   final ScrollController scrollController = ScrollController();
//   final ValueNotifier<bool> isAtBottom = ValueNotifier(false);

//   void handleScroll() {
//     if (scrollController.offset >= scrollController.position.maxScrollExtent &&
//         !scrollController.position.outOfRange) {
//       isAtBottom.value = true;
//     } else {
//       isAtBottom.value = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     scrollController.addListener(handleScroll);
//     return BlocProvider(
//       create: (context) =>
//           getIt<RegisterBloc>()..add(TermsAndConditionGetEvent()),
//       child: Scaffold(
//         backgroundColor: whiteText,
//         appBar: AppBar(
//             title: Text("Terms & Condition"),
//             automaticallyImplyLeading: false,
//             forceMaterialTransparency: true),
//         body: Column(
//           children: [
//             Divider(
//               thickness: 0.5,
//             ),
//             Expanded(
//               child: BlocBuilder<RegisterBloc, RegisterState>(
//                 builder: (context, state) {
//                   if (state.isLoading) {
//                     return Center(child: AppLoader());
//                   }

//                   if (state.termsAndConditionList == null ||
//                       state.termsAndConditionList!.isEmpty) {
//                     return Center(child: Text("Terms&Conditions not found"));
//                   }

//                   return ListView.separated(
//                     controller: scrollController,
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                     itemCount: state.termsAndConditionList!.length,
//                     separatorBuilder: (context, index) => 10.hBox,
//                     itemBuilder: (context, index) {
//                       final termsInfo = state.termsAndConditionList![index];
//                       return ListTile(
//                         title: index == 0
//                             ? null
//                             : Text(
//                                 termsInfo.title ?? "",
//                                 style: AppTextStyles.textStyle_600_14.copyWith(
//                                   fontSize: 16,
//                                   color: lightBlackClr,
//                                 ),
//                               ),
//                         subtitle: Text(
//                           termsInfo.content ?? "",
//                           style: AppTextStyles.textStyle_400_14.copyWith(
//                             color: grey4Clr,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//         bottomNavigationBar: Padding(
//           padding:
//               const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 12),
//           child: ValueListenableBuilder<bool>(
//             valueListenable: isAtBottom,
//             builder: (context, atBottom, _) {
//               return BlocBuilder<RegisterBloc, RegisterState>(
//                 builder: (context, state) {
//                   return CommonButton(
//                     label: "Accept & Continue",
//                     onTap: atBottom
//                         ? () {
//                           print("User tapped Accept button. ID: $userId");
//                             context.read<RegisterBloc>().add(
//                                 TermsStatusChangeEvent(userId:userId));
//                                 print("User tapped Accept button. ID: $userId");
//                           }
//                         : null,
//                     bgColor: atBottom
//                         ? buttonColor
//                         : LinearGradient(colors: [
//                             Colors.grey.shade400,
//                             Colors.grey.shade400
//                           ]),
//                     textColor: atBottom ? whiteText : grey3Clr,
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
