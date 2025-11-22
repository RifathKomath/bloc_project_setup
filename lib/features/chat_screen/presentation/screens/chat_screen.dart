// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/chat_screen/presentation/bloc/chat_bloc.dart';
// import 'package:easyfy_care_patient/features/chat_screen/presentation/screens/chat_detail_screen.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/domain/entity/doctor_list_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../../widgets/apptextfield.dart';
// import '../../../search_doctor_screen/presentation/search_doctor_screen.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List content = [
//       "How do I reset my password?",
//       "How can I update my payment method?",
//       "What are the subscription plans?",
//       "How do I contact customer support?"
//     ];

//     return BlocProvider(
//       create: (_) => ChatBloc()..add(SelectChatTabEvent()),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text("Chat & Help"),
//           automaticallyImplyLeading: false,
//         ),
//         body: Column(
//           children: [
//             Divider(thickness: 0.5),
//             5.hBox,
//             BlocBuilder<ChatBloc, ChatState>(
//               builder: (context, state) {
//                 final isChatSelected = state is ChatTabSelectedState;
//                  final isFaqSelected = state is FaqTabSelectedState;
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomTabButton(
//                       label: "Chat",
//                       isSelected: isChatSelected,
//                       onTap: () {
//                         context.read<ChatBloc>().add(SelectChatTabEvent());
//                       },
//                     ),
//                     CustomTabButton(
//                       label: "FAQ",
//                       isSelected: isFaqSelected,
//                       onTap: () {
//                         context.read<ChatBloc>().add(SelectFaqTabEvent());
//                       },
//                     ),
//                   ],
//                 ).paddingSymmetricHorizontal(15);
//               },
//             ),
//             Expanded(
//               child: BlocBuilder<ChatBloc, ChatState>(
//                 builder: (context, state) {
//                   if (state is ChatTabSelectedState) {
//                     return ListView.separated(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(top: 15, bottom: 15),
//                               child: AppTextField(
//                                 prefixIcon: Icon(Icons.search),
//                                 hint: "Search",
//                                 borderColor: textborderClr,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 open(context,
//                                     ChatDetailPage(name: "Dr. Narayanan"));
//                               },
//                               child: DoctorTile(
//                                 ischat: true,
//                                 doctor: DoctorEntity(),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                       separatorBuilder: (context, index) =>
//                           Divider(thickness: 0.5),
//                       itemCount: 1,
//                     );
//                   } else if (state is FaqTabSelectedState) {
//                     return Column(
//                       children: [
//                         20.hBox,
//                         Expanded(
//                           child: ListView.separated(
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color:
//                                       const Color.fromARGB(255, 237, 239, 244),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             content[index],
//                                             style:
//                                                 AppTextStyles.textStyle_500_16,
//                                           ),
//                                         ),
//                                         Icon(
//                                           Icons.keyboard_arrow_down,
//                                           color: grey4Clr,
//                                         ).paddingSymmetricHorizontal(5)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ).paddingSymmetricHorizontal(15);
//                             },
//                             separatorBuilder: (context, index) => 20.hBox,
//                             itemCount: content.length,
//                           ),
//                         )
//                       ],
//                     );
//                   }
//                   return SizedBox();
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Divider(thickness: 0.5),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomTabButton extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const CustomTabButton({
//     super.key,
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 48,
//         width: 154,
//         decoration: BoxDecoration(
//           gradient: isSelected ? buttonColor : null,
//           color: isSelected ? null : Colors.white,
//           border: Border.all(
//             color: isSelected ? Colors.transparent : blueTextClr,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Center(
//           child: Text(
//             label,
//             style: AppTextStyles.textStyle_500_16.copyWith(
//               color: isSelected ? whiteText : blueTextClr,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
