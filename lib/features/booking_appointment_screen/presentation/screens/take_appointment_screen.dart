// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/bloc/appointment_bloc.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/bloc/appointment_state.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/widgets/service_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/constants/colors.dart';
// import '../../../../widgets/common_button.dart';
// import 'appointment_confirmation_screen.dart';

// class TakeAppointmentScreen extends StatelessWidget {
//   final String heading;
//   const TakeAppointmentScreen({super.key, this.heading = "Take Appointment"});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         final bloc = getIt<AppointmentBloc>();
//         if (heading != "Take Appointment") {
//           bloc.add(const SelectServiceEvent("General Checkup"));
//         }
//         return bloc;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text(
//             heading,
//             overflow: TextOverflow.ellipsis,
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(2),
//             child: Container(
//               width: double.infinity,
//               height: 1,
//               color: borderClr,
//             ),
//           ),
//           forceMaterialTransparency: true,
//           leading: BlocBuilder<AppointmentBloc, AppointmentState>(
//             builder: (context, state) {
//               return IconButton(
//                 onPressed: () {
//                   if (state.service != null) {
//                     context
//                         .read<AppointmentBloc>()
//                         .add(BackToServiceSelectionEvent());
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 },
//                 icon: const Icon(Icons.arrow_back_ios),
//               );
//             },
//           ),
//         ),
//         body: BlocBuilder<AppointmentBloc, AppointmentState>(
//           builder: (context, state) {
//             if (state.service != null) {
//               return _buildDateTimeSelection(context, state);
//             } else {
//               return _buildServiceSelection(context);
//             }
//           },
//         ),
//         bottomNavigationBar: BlocBuilder<AppointmentBloc, AppointmentState>(
//           builder: (context, state) {
//             if (state.service != null) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Divider(thickness: 0.5),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//                     child: CommonButton(
//                       label: "Confirm Appointment",
//                       onTap: () {
//                         open(context, AppointmentConfrimationScreen());
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }
//             return const SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildServiceSelection(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Select Services",
//             style: AppTextStyles.textStyle_700_28
//                 .copyWith(color: blackTextClr, fontSize: 20),
//           ),
//           8.hBox,
//           Text(
//             "Choose the services you wish to take",
//             style: AppTextStyles.textStyle_500_12.copyWith(color: lightBlackClr),
//           ),
//           36.hBox,
//           ServiceDataContainer(
//             isSelectBtn: true,
//             onTap: () {
//               context
//                   .read<AppointmentBloc>()
//                   .add(const SelectServiceEvent("General Checkup"));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // Changed here: now state is AppointmentState
//   Widget _buildDateTimeSelection(BuildContext context, AppointmentState state) {
//     final currentDate = DateTime.now();
//     final dates = List.generate(
//       5,
//       (index) => currentDate.add(Duration(days: index)),
//     );

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Select your visit date & Time",
//             style: AppTextStyles.textStyle_700_28
//                 .copyWith(color: blackTextClr, fontSize: 20),
//           ),
//           8.hBox,
//           Text(
//             "Choose the date and time that fits your schedule",
//             style: AppTextStyles.textStyle_500_12.copyWith(color: lightBlackClr),
//           ),
//           24.hBox,
//           _buildDateSelector(context, dates, state),
//           24.hBox,
//           _buildTimeSlotSection(context, "Morning Set",
//               ["09:00", "10:00", "11:00", "12:00"], state),
//           16.hBox,
//           _buildTimeSlotSection(
//               context, "Afternoon Set", ["14:00", "15:00", "16:00"], state),
//         ],
//       ),
//     );
//   }

//   Widget _buildDateSelector(
//       BuildContext context, List<DateTime> dates, AppointmentState state) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Choose Day: ${_getMonthName(dates.first.month)} ${dates.first.year}",
//           style: AppTextStyles.textStyle_700_28
//               .copyWith(color: blackTextClr, fontSize: 16),
//         ),
//         8.hBox,
//         SizedBox(
//           height: 90,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: dates.length,
//             itemBuilder: (context, index) {
//               final date = dates[index];
//               final isSelected = state.selectedDate != null &&
//                   date.day == state.selectedDate!.day &&
//                   date.month == state.selectedDate!.month &&
//                   date.year == state.selectedDate!.year;

//               const dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
//               final dayName = dayNames[(date.weekday - 1) % 7];

//               return Padding(
//                 padding: EdgeInsets.only(
//                   right: 8.0,
//                   left: index == 0 ? 4.0 : 0.0,
//                 ),
//                 child: GestureDetector(
//                   onTap: () {
//                     context.read<AppointmentBloc>().add(SelectDateEvent(date));
//                   },
//                   child: Container(
//                     width: 72,
//                     height: 76,
//                     decoration: BoxDecoration(
//                       color: isSelected ? blueTextClr : Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(
//                         color: isSelected ? blueTextClr : Colors.grey.shade300,
//                         width: 1,
//                       ),
//                     ),
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           date.day.toString(),
//                           style: AppTextStyles.textStyle_500_12.copyWith(
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                         4.hBox,
//                         Text(
//                           dayName,
//                           style: AppTextStyles.textStyle_700_28.copyWith(
//                               color: isSelected ? Colors.white : Colors.black,
//                               fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTimeSlotSection(BuildContext context, String title,
//       List<String> timeSlots, AppointmentState state) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: AppTextStyles.textStyle_700_28
//               .copyWith(color: blackTextClr, fontSize: 16),
//         ),
//         10.hBox,
//         SizedBox(
//           height: 40,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: timeSlots.length,
//             itemBuilder: (context, index) {
//               final slot = timeSlots[index];
//               final isSelected = state.selectedTimeSlot == slot;

//               return Padding(
//                 padding: EdgeInsets.only(
//                   right: 12.0,
//                   left: index == 0 ? 4.0 : 0.0,
//                 ),
//                 child: GestureDetector(
//                   onTap: () {
//                     context.read<AppointmentBloc>().add(SelectTimeSlotEvent(slot));
//                   },
//                   child: Container(
//                     width: 72,
//                     height: 28,
//                     decoration: BoxDecoration(
//                       color: isSelected ? blueTextClr : Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: isSelected ? blueTextClr : Colors.grey.shade300,
//                       ),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(slot,
//                         style: AppTextStyles.textStyle_500_12.copyWith(
//                           color: isSelected ? Colors.white : Colors.black,
//                         )),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   String _getMonthName(int month) {
//     const months = [
//       'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
//       'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
//     ];
//     return months[month - 1];
//   }

//   void open(BuildContext context, Widget page) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => page),
//     );
//   }
// }
