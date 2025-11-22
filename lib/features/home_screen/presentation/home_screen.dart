// import 'dart:typed_data';

// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/core/utils/string_utils.dart';
// import 'package:easyfy_care_patient/features/account_screen/presentation/bloc/account_bloc.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/bloc/home_bloc_bloc.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/widgets/doctor_card.dart';
// import 'package:easyfy_care_patient/features/notification_screen/presentation/screens/notification_screen.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/screens/report_screen.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../account_screen/presentation/bloc/account_state.dart';
// import '../../booking_appointment_screen/presentation/screens/book_appointment_screen.dart';
// import '../../payments/presentation/screens/payment_request_screen.dart';
// import '../../search_doctor_screen/presentation/search_doctor_screen.dart';
// import 'bloc/home_bloc_state.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final homeBloc = context.read<HomeBloc>();
//     // final accountBloc = context.read<AccountBloc>();
//     // final hospital = [
//     //   "Nano Hospital",
//     //   "MIMS Hospital",
//     //   "MVR Hospital",
//     //   "Malabar Hospital"
//     // ];
//     return BlocConsumer<AccountBloc, AccountState>(
//       listener: (context, state) {
//         // TODO: implement listener
//         if (state.imageBytes != null) {
//           print("Image bytes length: ${state.imageBytes!.length}");

//         }
//       },
//       builder: (context, state) {
//         print("Image bytes length: ${state.imageBytes?.length}");
//         print(patientDetailsFromRegister?.id);
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             children: [
//               Stack(children: [
//                 Container(
//                   height: 226,
//                   decoration: BoxDecoration(color: appbarClr),
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 50),
//                     child: Row(children: [
//                       15.wBox,
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundColor: Colors.grey.shade200,
//                         backgroundImage: state.imageBytes != null &&
//                                 state.imageBytes!.isNotEmpty
//                             ? MemoryImage(state.imageBytes!)
//                             : const AssetImage('assets/images/profile.png')
//                                 as ImageProvider,
//                       ),
//                       10.wBox,
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome Back",
//                             style: AppTextStyles.textStyle_400_14
//                                 .copyWith(fontSize: 12, color: whiteText),
//                           ),
//                           Text(
//                             (patientDetails?.fullName ?? patientDetailsFromRegister?.fullName ?? "").upperFirst,
//                             style: AppTextStyles.textStyle_600_14
//                                 .copyWith(color: whiteText),
//                           ),
//                           Text((patientDetails?.place ?? patientDetailsFromRegister?.place ?? "").upperFirst,
//                               style: AppTextStyles.textStyle_400_14
//                                   .copyWith(fontSize: 12, color: whiteText)),
//                         ],
//                       ),
//                       Spacer(),
//                       GestureDetector(
//                               onTap: () {
//                                 open(context, NotificationScreen());
//                               },
//                               child: AppSvg(name: "notification"))
//                           .paddingSymmetricHorizontal(15),
//                     ]),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
//                   child: TreatmentDetailsContainer(),
//                 ),
//               ]),
//               Expanded(
//                 child: BlocBuilder<HomeBloc, HomeState>(
//                   builder: (context, state) {
//                     return SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Column(
//                           children: [
//                             12.hBox,

//                             // // state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
//                             // state.isDoctorAllocated == true
//                             //     ? Text("Upcoming Treatment",
//                             //         style: AppTextStyles.textStyle_500_18)
//                             //     : 0.hBox,
//                             // state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
//                             // state.isDoctorAllocated == true
//                             //     ? TreatmentDetailsContainer()
//                             //     : 0.hBox,
//                             // state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
//                             // state.isDoctorAllocated == true
//                             //     ? Text("Upcoming Appointment",
//                             //         style: AppTextStyles.textStyle_500_18)
//                             //     : 0.hBox,
//                             // state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
//                             // state.isDoctorAllocated == true
//                             //     ? AppointmentContainer()
//                             //     : 0.hBox,
//                             // 20.hBox,

//                             ZoomScrollCards(),
//                             20.hBox,
//                             state.isDoctorAllocated == true
//                                 ? DoctorCard(
//                                     doctorDetails: state.doctorDetails!,
//                                   )
//                                 : SearchDoctorContainer(),
//                             20.hBox,
//                             // PendingActionContainer(),
//                             // 46.hBox,
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text("Your Treatment Center",
//                                   style: AppTextStyles.textStyle_600_20),
//                             ),
//                             23.hBox,
//                             HospitalTile(hospital: "Nano Hospital"),
//                             20.hBox
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// // extendBody: true,
// // appBar: AppBar(
// //   centerTitle: false,
// //   backgroundColor: appbarClr,
// //   elevation: 0,
// //   shadowColor: Colors.white,
// //   leading: BlocConsumer<AccountBloc, AccountState>(
// //     listener: (context, state) {
// //       // TODO: implement listener
// //     },
// //     builder: (context, state) {
// //       return Padding(
// //         padding: const EdgeInsets.only(left: 16.0),
// //         child: CircleAvatar(
// //           radius: 70,
// //           backgroundColor: Colors.white,
// //           backgroundImage:
// //               (state.imageBytes != null && state.imageBytes!.isNotEmpty)
// //                   ? MemoryImage(state.imageBytes!)
// //                   : const AssetImage('assets/images/profile.png')
// //                       as ImageProvider,
// //         ),
// //       );
// //     },
// //   ),
// //   title: Column(
// //     mainAxisSize: MainAxisSize.min,
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: [
// //       10.hBox,
// //       Text(
// //         "Welcome Back",
// //         style: AppTextStyles.textStyle_400_14
// //             .copyWith(fontSize: 12, color: whiteText),
// //       ),
// //       Text(
// //         (patientDetails?.fullName ?? "").upperFirst,
// //         style: AppTextStyles.textStyle_600_14.copyWith(color: whiteText),
// //       ),
// //       Text((patientDetails?.place ?? "").upperFirst,
// //           style: AppTextStyles.textStyle_400_14
// //               .copyWith(fontSize: 12, color: whiteText)),
// //     ],
// //   ),
// //   actions: [
// //     GestureDetector(
// //         onTap: () {
// //           open(context, NotificationScreen());
// //         },
// //         child: AppSvg(name: "notification")),
// //     16.wBox
// //   ],
// //   bottom: PreferredSize(
// //     preferredSize: Size.fromHeight(80),
// //     child: SizedBox(
// //       height: 12,
// //     ),
// //   ),
// // ),
// // body: BlocBuilder<HomeBloc, HomeState>(
// //   builder: (context, state) {
// //     return ListView(
// //       padding: EdgeInsets.symmetric(horizontal: 16),
// //       shrinkWrap: true,
// //       children: [
// //         12.hBox,

// //         // // state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
// //         // state.isDoctorAllocated == true
// //         //     ? Text("Upcoming Treatment",
// //         //         style: AppTextStyles.textStyle_500_18)
// //         //     : 0.hBox,
// //         state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
// //         state.isDoctorAllocated == true
// //             ? TreatmentDetailsContainer()
// //             : 0.hBox,
// //         state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
// //         state.isDoctorAllocated == true
// //             ? Text("Upcoming Appointment",
// //                 style: AppTextStyles.textStyle_500_18)
// //             : 0.hBox,
// //         state.isDoctorAllocated == true ? 16.gapBox : 0.hBox,
// //         state.isDoctorAllocated == true ? AppointmentContainer() : 0.hBox,
// //         20.hBox,
// //         ZoomScrollCards(),
// //         20.hBox,
// //         state.isDoctorAllocated == true
// //             ? DoctorCard(
// //                 doctorDetails: state.doctorDetails!,
// //               )
// //             : SearchDoctorContainer(),
// //         20.hBox,
// //         // PendingActionContainer(),
// //         // 46.hBox,
// //         Text(
// //           "Your Treatment Center",
// //           style: AppTextStyles.textStyle_500_16
// //               .copyWith(color: blackTextClr, fontSize: 18),
// //         ),

// //         16.hBox,
// //         ListView.separated(
// //             shrinkWrap: true,
// //             physics: NeverScrollableScrollPhysics(),
// //             itemBuilder: (context, index) {
// //               return HospitalTile(
// //                 hospital: hospital[index],
// //               );
// //             },
// //             separatorBuilder: (context, index) => 16.hBox,
// //             itemCount: 1),
// //             20.hBox
// //       ],
// //     );
// //   },
// // ),

// // class PendingActionContainer extends StatelessWidget {
// //   const PendingActionContainer({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
// //       decoration: BoxDecoration(
// //           border: Border.all(color: borderClr),
// //           borderRadius: BorderRadius.circular(8)),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             "Pending Actions",
// //             style: AppTextStyles.textStyle_500_16
// //                 .copyWith(color: blackTextClr, fontSize: 18),
// //           ),
// //           16.hBox,
// //           ListView.separated(
// //               shrinkWrap: true,
// //               physics: NeverScrollableScrollPhysics(),
// //               itemBuilder: (context, index) {
// //                 return Row(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Icon(
// //                       Icons.description,
// //                       color: blue2Clr,
// //                     ),
// //                     8.wBox,
// //                     Text(
// //                       "Upload Chemo Chart",
// //                       style: AppTextStyles.textStyle_400_14
// //                           .copyWith(color: blue2Clr),
// //                     ),
// //                     Spacer(),
// //                     Icon(
// //                       Icons.arrow_forward_ios,
// //                       color: grey8Clr,
// //                       size: 14,
// //                     ),
// //                   ],
// //                 );
// //               },
// //               separatorBuilder: (context, index) => 16.hBox,
// //               itemCount: 3),
// //           16.hBox
// //         ],
// //       ),
// //     );
// //   }
// // }

// class TreatmentDetailsContainer extends StatelessWidget {
//   const TreatmentDetailsContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(14),
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.8),
//               blurRadius: 25,
//               offset: Offset(0, 11),
//             ),
//           ],
//           color: grey3Clr,
//           border: Border.all(color: grey9Clr),
//           borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Next Chemo Sessions",
//             style: AppTextStyles.textStyle_500_12,
//           ),
//           6.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Modified FOLFOX-6 ",
//                 style: AppTextStyles.textStyle_500_16,
//               ),
//               CustomChip(
//                 bgClr: blue1Clr,
//                 textClr: Colors.white,
//                 text: "Cycle 1",
//               )
//             ],
//           ),
//           13.hBox,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.calendar_today,
//                 color: blueTextClr,
//               ),
//               .5.wBox,
//               Text(
//                 "24 May, 11 AM | City Cancer Center",
//                 style: AppTextStyles.textStyle_400_14,
//               )
//             ],
//           ),
//           21.hBox,
//           BlocBuilder<HomeBloc, HomeState>(
//             builder: (context, state) {
//               final bool allocated = state.isDoctorAllocated == true;
//               return CommonButton(
//                 label: allocated ? "Make Payment" : "Waiting for Invoice...",
//                 onTap: allocated
//                     ? () {
//                         open(context, PaymentRequestScreen());
//                       }
//                     : () {},
//                 textColor: allocated ? whiteText : veryLightGreyTextClr,
//                 color: allocated ? null : veryLightGreyClr,
//                 bgColor: allocated ? buttonColor : null,
//               );
//             },
//           )
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     Text(
//           //       'Cycle Progress',
//           //       style: AppTextStyles.textStyle_400_14,
//           //     ),
//           //     Text(
//           //       '3/6',
//           //       style:
//           //           AppTextStyles.textStyle_400_14.copyWith(color: blueTextClr),
//           //     ),
//           //   ],
//           // ),
//           // 8.hBox,
//           // LinearProgressIndicator(
//           //   value: .5,
//           //   minHeight: 8,
//           //   color: blueTextClr,
//           //   borderRadius: BorderRadius.circular(8),
//           // ),
//           // 16.hBox,
//           // Row(
//           //   mainAxisSize: MainAxisSize.min,
//           //   children: [
//           //     Expanded(
//           //       child: CommonButton(
//           //         label: "Call",
//           //         isIconBtn: true,
//           //         icon: Icon(
//           //           Icons.call,
//           //           color: blueTextClr,
//           //         ),
//           //         onTap: () {},
//           //         color: Colors.white,
//           //         textColor: Colors.black,
//           //       ),
//           //     ),
//           //     12.wBox,
//           //     Expanded(
//           //       child: CommonButton(
//           //         label: "Directions",
//           //         onTap: () {},
//           //         icon: Icon(
//           //           Icons.location_on,
//           //           color: blueTextClr,
//           //         ),
//           //         isIconBtn: true,
//           //         color: Colors.white,
//           //         textColor: Colors.black,
//           //       ),
//           //     )
//           //   ],
//           // )
//         ],
//       ),
//     );
//   }
// }

// class CustomChip extends StatelessWidget {
//   const CustomChip({
//     super.key,
//     required this.textClr,
//     this.bgClr,
//     required this.text,
//     this.isBorder,
//   });
//   final Color textClr;
//   final Color? bgClr;
//   final String text;
//   final bool? isBorder;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//           color: isBorder == true ? Colors.white : bgClr,
//           borderRadius: BorderRadius.circular(50),
//           border: Border.all(
//               color: isBorder == true ? textClr : Colors.transparent)),
//       child: Text(text,
//           style: AppTextStyles.textStyle_500_12.copyWith(color: textClr)),
//     );
//   }
// }

// class AppointmentContainer extends StatelessWidget {
//   const AppointmentContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: blueTextClr,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/drimage.png"),
//                 12.gapBox,
//                 Container(
//                   width: 200,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Dr. Narayanan",
//                         style: AppTextStyles.textStyle_700_16
//                             .copyWith(color: Colors.white),
//                       ),
//                       Text("Oncologist",
//                           style: AppTextStyles.textStyle_500_12
//                               .copyWith(color: Colors.white))
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 32,
//                   height: 32,
//                   decoration: BoxDecoration(
//                       color: Colors.white, shape: BoxShape.circle),
//                   child: Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: AppSvg(name: "contact_icon"),
//                   ),
//                 )
//               ],
//             ),
//             20.gapBox,
//             Container(
//               decoration: BoxDecoration(
//                   color: darkBlueColor, borderRadius: BorderRadius.circular(8)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: blueTextClr,
//                         ),
//                         width: 28,
//                         height: 28,
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: AppSvg(name: "calendar"),
//                         )),
//                     4.gapBox,
//                     Text(
//                       "Wed, 10 Jan, 2024",
//                       style: AppTextStyles.textStyle_500_12
//                           .copyWith(color: Colors.white),
//                     ),
//                     6.gapBox,
//                     Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: blueTextClr,
//                         ),
//                         width: 28,
//                         height: 28,
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: AppSvg(name: "time"),
//                         )),
//                     4.gapBox,
//                     Text(
//                       "Morning set: 11:00",
//                       style: AppTextStyles.textStyle_500_12
//                           .copyWith(color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchDoctorContainer extends StatelessWidget {
//   const SearchDoctorContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 19, horizontal: 16),
//       decoration: BoxDecoration(
//           border: Border.all(color: borderClr, width: 1),
//           borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         children: [
//           Text(
//             "You are not associated with any doctor yet",
//             style: AppTextStyles.textStyle_600_14.copyWith(fontSize: 20),
//           ),
//           20.hBox,
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: blueTextClr, width: 1),
//                 borderRadius: BorderRadius.circular(12)),
//             child: TextField(
//               // controller: controller,
//               // onChanged: onChanged,
//               // onTap: onTap,
//               readOnly: true,
//               onTap: () {
//                 open(context, SearchDoctorScreen());
//               },
//               textAlign: TextAlign.center,
//               decoration: InputDecoration(
//                 hintText: "Search Doctor",
//                 hintStyle: const TextStyle(
//                   color: blueTextClr,
//                   fontSize: 16,
//                 ),
//                 suffixIcon: const Icon(
//                   Icons.search,
//                   color: blueTextClr,
//                 ),
//                 border: InputBorder.none,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 14),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedCardList extends StatefulWidget {
//   @override
//   _AnimatedCardListState createState() => _AnimatedCardListState();
// }

// class _AnimatedCardListState extends State<AnimatedCardList> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 5, // Example number of items
//         itemBuilder: (context, index) {
//           return AnimatedContainer(
//             duration: Duration(milliseconds: 300),
//             margin: EdgeInsets.symmetric(horizontal: 8.0),
//             height: 200,
//             width: 150,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Center(
//               child: Text(
//                 'Item $index',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ZoomScrollCards extends StatefulWidget {
//   @override
//   _ZoomScrollCardsState createState() => _ZoomScrollCardsState();
// }

// class _ZoomScrollCardsState extends State<ZoomScrollCards> {
//   final ScrollController _scrollController = ScrollController();
//   int focusedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       double itemWidth = 180;
//       double offset = _scrollController.offset;
//       int currentIndex = (offset + itemWidth / 2) ~/ itemWidth;

//       if (currentIndex != focusedIndex &&
//           currentIndex >= 0 &&
//           currentIndex < _items.length) {
//         setState(() {
//           focusedIndex = currentIndex;
//         });
//       }
//     });
//   }

//   final List<Map<String, dynamic>> _items = [
//     {
//       "title": "View Treatment Cycle",
//       "subtitle": "Find a Nearby\nTreatment point",
//       "icon": "appointment_card",
//       "onTap": () => BaseScreen(
//             currentIndex: 1,
//           ),
//     },
//     {
//       "title": "Records & Reports",
//       "subtitle": "View or upload your\nrecords",
//       "icon": "report_card",
//       "onTap": () => ReportScreen(),
//     },
//     {
//       "title": "Prescriptions",
//       "subtitle": "Access your medications",
//       "icon": "report_card"
//     },
//   ];

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         controller: _scrollController,
//         itemCount: _items.length,
//         itemBuilder: (context, index) {
//           bool isFocused = index == focusedIndex;
//           double width = 164;
//           double height = isFocused ? 160 : 142;

//           return GestureDetector(
//             onTap: () {
//               final screenBuilder = _items[index]["onTap"];
//               if (screenBuilder != null && screenBuilder is Function) {
//                 open(context, screenBuilder());
//               }
//             },
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: width,
//               height: height,
//               margin: EdgeInsets.symmetric(
//                   horizontal: isFocused ? 0 : 15,
//                   vertical: isFocused ? 10 : 20),
//               decoration: BoxDecoration(
//                 color: isFocused ? lightPeachClr : lightGreenColor,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AppSvg(
//                       name: _items[index]["icon"],
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       _items[index]["title"],
//                       style: AppTextStyles.textStyle_700_28
//                           .copyWith(fontSize: 16, color: blackTextClr),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       _items[index]["subtitle"],
//                       style:
//                           TextStyle(fontSize: 12, color: Colors.grey.shade600),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
