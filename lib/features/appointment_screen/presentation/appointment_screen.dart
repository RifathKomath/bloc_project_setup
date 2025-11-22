// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../core/constants/colors.dart';
// import '../../../widgets/common_button.dart';
// import 'bloc/appointment_screen_bloc.dart';

// class AppointmentScreen extends StatelessWidget {
//   const AppointmentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
// List<Map<String, dynamic>> appointmentList = [
//   {
//     'name': 'Nano Hospital',
//     'date': 'Fri, 05 Jan, 2024, Morning set: 09:00',
//     'image': 'assets/images/hospital.png', 
//   },
//   {
//     'name': 'Dr. Narayanan',
//     'date': 'Thu, 10 Jan, 2024, evening set: 03:00',
//     'image': 'assets/images/dr_name.jpg',
//   },
//   {
//     'name': 'Dr. Alex Johnson',
//     'date': 'Sat, 12 Jan, 2024, Morning set: 10:00',
//     'image': 'assets/images/doctor.png',
//   },
// ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("My Appointments"),
//       ),
//       body: BlocProvider(
//         create: (context) => AppointmentScreenBloc(),
//         child: BlocBuilder<AppointmentScreenBloc, AppointmentScreenState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Divider(thickness: 0.5),
//                 20.hBox,
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: CommonButton(
//                           label: 'Upcoming',
//                           onTap: () {
//                             context
//                                 .read<AppointmentScreenBloc>()
//                                 .add(const ToggleAppointmentType(true));
//                           },
//                           bgColor: state.isUpcoming ? buttonColor : null,
//                           color: !state.isUpcoming ? Colors.white : null,
//                           textColor:
//                               state.isUpcoming ? Colors.white : blueTextClr,
//                           borderClr: state.isUpcoming ? null : blueTextClr,
//                         ),
//                       ),
//                       23.wBox,
//                       Expanded(
//                         child: CommonButton(
//                           label: 'Past',
//                           onTap: () {
//                             context
//                                 .read<AppointmentScreenBloc>()
//                                 .add(const ToggleAppointmentType(false));
//                           },
//                           color: state.isUpcoming ? Colors.white : null,
//                           bgColor: !state.isUpcoming ? buttonColor : null,
//                           textColor:
//                               !state.isUpcoming ? Colors.white : blueTextClr,
//                           borderClr: !state.isUpcoming ? null : blueTextClr,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 26.hBox,
//                 Flexible(
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
//                       itemBuilder: (context, index) {
//                       //  if(index==0){
//                         return AppointmentContainer(isUpcoming: state.isUpcoming,ishospital: true,appointmentList: appointmentList,index: index);


//                       //   }
//                       //   return AppointmentContainer(isUpcoming: state.isUpcoming,appointmentList: appointmentList,index: index);

//                        },
//                       separatorBuilder: (context, index) => 12.hBox,
//                       itemCount: appointmentList.length),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class AppointmentContainer extends StatelessWidget {
//   const AppointmentContainer({
//     super.key, required this.isUpcoming,this.ishospital=false, required this.appointmentList,required this.index
//   });

//   final bool isUpcoming;
//   final bool ishospital;
//   final List<Map<String, dynamic>>  appointmentList;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     final item = appointmentList[index];
//     return Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             border: Border.all(width: 1, color: borderClr),
//             borderRadius: BorderRadius.circular(12)),
//         child: ListTile(
//           contentPadding: EdgeInsets.symmetric(horizontal: 0),
//           leading: Container(
//             height: 83,
//             width: 72,
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
//             child: Image.asset(
//            item['image'] ,
//               fit: BoxFit.fitHeight,
//             ),
//           ),
          
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             spacing: 4,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                   item['name'],
//                     style:
//                         AppTextStyles.textStyle_500_12.copyWith(fontSize: 14),
//                   ),
//                  !ishospital? AppSvg(name: "video"):0.hBox
//                 ],
//               ),
//               Text(
//                 item['date'],
//                 style: AppTextStyles.textStyle_500_12
//                     .copyWith(fontSize: 10, color: grey2Clr),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//               isUpcoming?    SelectionChip(
//                     text:"Cancel Appointment",
//                     textClr: lightRedClr,
//                   ) : Expanded(
//                     child: SelectionChip(
//                       text: "Book Again",
//                       textClr:blueTextClr,
//                     ),
//                   ) ,
//                   6.wBox,
//                   Expanded(
//                     child: SelectionChip(
//                       text:isUpcoming? "Reschedule":"Recorded video",
//                                          textClr:isUpcoming? lightRedClr:blueTextClr,

//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }

// class SelectionChip extends StatelessWidget {
//   const SelectionChip({
//     super.key,
//     required this.text,
//     required this.textClr,
//   });

//   final String text;
//   final Color textClr;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 4),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4),
//           color: textClr.withOpacity(.1)),
//       child: Text(
//         text,
//         style: AppTextStyles.textStyle_500_12
//             .copyWith(fontSize: 10, color: textClr),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }
