// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/features/notification_screen/presentation/bloc/notification_bloc.dart';
// import 'package:easyfy_care_patient/features/notification_screen/presentation/bloc/notification_state.dart';
// import 'package:easyfy_care_patient/widgets/app_loader.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/style.dart';
// import '../../../../core/utils/screen_utils.dart';
// import '../../../../widgets/app_close_icon.dart';
// import '../../../../widgets/app_confirmation_popup.dart';
// import '../../../../widgets/common_snack_bar.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         final bloc = getIt<NotificationBloc>();
//         bloc.add(NotificationLisingEvent());
//         return bloc;
//       },
//       child: Scaffold(
//         backgroundColor: bgColor,
//         appBar: AppBar(
//           backgroundColor: bgColor,
//           leading: GestureDetector(
//             onTap: () => close(context),
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: Icon(Icons.arrow_back_ios, size: 18),
//             ),
//           ),
//           title: Text(
//             "Notifications",
//           ),
//         ),
//         body: BlocConsumer<NotificationBloc, NotificationState>(
//           listener: (context, state) {
//             if (state.error != null && state.error!.isNotEmpty) {
//               showCustomSnackBar(
//                 context,
//                 state.error.toString(),
//                 isError: true,
//               );
//             }
//           },
//           builder: (context, state) {
//             return Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: (state.notificationsList ?? []).isEmpty
//                         ? SizedBox()
//                         : Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: borderColor),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 8,
//                                 right: 8,
//                               ),
//                               child: Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Select All",
//                                     style: AppTextStyles.textStyle_400_16,
//                                   ),
//                                   Checkbox(
//                                     value: state.isSelectAll,
//                                     onChanged: (value) {
//                                       context.read<NotificationBloc>().add(
//                                             ToggleSelectAllEvent(
//                                                 value ?? false),
//                                           );
//                                     },
//                                   ),
//                                   Spacer(),
//                                   if (state.isSelectAll == true)
//                                     GestureDetector(
//                                       onTap: () {
//                                         appShowDialog(
//                                           context,
//                                           dialog:
//                                               "Are you want to clear the Notification!",
//                                           onTap: () {
//                                             context.read<NotificationBloc>().add(
//                                                 DeleteAllNotificationsEvent());
//                                           },
//                                         );
//                                       },
//                                       child: Icon(
//                                         Icons.delete,
//                                         color: darkRed,
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                   ),
//                   if (state.isLoading == true)
//                     const Expanded(
//                       child: Center(child: AppLoader()),
//                     )
//                   else if (state.notificationsList == null ||
//                       state.notificationsList!.isEmpty)
//                     const Expanded(
//                       child: Center(
//                         child: Text(
//                           "No Notifications found",
//                           style: AppTextStyles.textStyle_500_14,
//                         ),
//                       ),
//                     )
//                   else
//                     Expanded(
//                       child: ListView.separated(
//                         itemBuilder: (context, index) {
//                           final notificationInfo =
//                               state.notificationsList![index];
//                           return GestureDetector(
//                             onTap: () {
//                               // open(context, PatientRequestScreen(patient: ,));
//                             },
//                             child: Dismissible(
//                               key: Key(notificationInfo.id.toString()),
//                               direction: DismissDirection.endToStart,
//                               background: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 5,
//                                 ),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: darkRed,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   alignment: Alignment.centerRight,
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                   ),
//                                   child: const Icon(
//                                     Icons.delete,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               onDismissed: (_) {
//                                 context.read<NotificationBloc>().add(
//                                       TemporaryNotificationRemoveEvent(
//                                         notificationInfo.id!,
//                                       ),
//                                     );
//                                 context.read<NotificationBloc>().add(
//                                       NotificationReadEvent(
//                                         notificationInfo.id!.toInt(),
//                                       ),
//                                     );
//                               },
//                               child: GestureDetector(
//                                 onTap: () {
//                                 showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              Align(
//               alignment: Alignment.topRight,
//               child: TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child:AppCloseIcon(),
//               ),
//             ),
//             Text(
//             notificationInfo.subject??"Notification",
//             textAlign: TextAlign.center,
//               style: AppTextStyles.textStyle_500_18,
//             ).paddingSymmetricHorizontal(16),
//             const SizedBox(height: 10),
//             Text(
//               notificationInfo.notifyContent.toString(),
//               style: AppTextStyles.textStyle_500_14.copyWith(
//                 color: textGreyColor,
//               ),
//             ).paddingSymmetricHorizontal(16),
//             16.hBox
           
           
//           ],
//         ),
//       );
//     },
//   );
//                                 },
//                                 child: Card(
//                                   color: state.isSelectAll == false
//                                       ? whiteText
//                                       : const Color.fromARGB(
//                                           255,
//                                           225,
//                                           241,
//                                           235,
//                                         ),
//                                   elevation: 2,
//                                   child: Container(
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         10.wBox,
//                                         AppSvg(
//                                           name: "app_logo",
//                                           height: 40,
//                                           width: 30,
//                                         ),
//                                         3.wBox,
//                                         SizedBox(
//                                           height: 85,
//                                           child: VerticalDivider(),
//                                         ),
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             SizedBox(
//                                               width: 250,
//                                               child: Text(
//                                                 notificationInfo.subject
//                                                     .toString(),
//                                                 style: AppTextStyles
//                                                     .textStyle_500_16,
//                                               ),
//                                             ),
//                                             5.hBox,
//                                             Text(
//                                               formatDateTime(
//                                                 notificationInfo.notifyTime
//                                                     .toString(),
//                                               ),
//                                               style: AppTextStyles
//                                                   .textStyle_500_12
//                                                   .copyWith(
//                                                 color: textGreyColor,
//                                               ),
//                                             ),
//                                             Text(
//                                               notificationInfo.id.toString(),
//                                               style: AppTextStyles
//                                                   .textStyle_500_12
//                                                   .copyWith(
//                                                 color: textGreyColor,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) => 5.hBox,
//                         itemCount: state.notificationsList!.length,
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

