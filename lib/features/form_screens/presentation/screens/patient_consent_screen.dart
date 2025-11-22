// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/shared_pref.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/screens/register_screen.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/domain/entity/doctor_list_entity.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/presentation/bloc/search_doctor_bloc.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/presentation/bloc/search_doctor_state.dart';
// import 'package:easyfy_care_patient/widgets/app_loader.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:intl/intl.dart';
// import 'package:signature/signature.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/margin_extensions.dart';
// import '../../../../core/constants/style.dart';
// import '../../../../core/utils/screen_utils.dart';
// import '../../../../widgets/common_snack_bar.dart';
// import '../../../../widgets/common_textfield.dart';
// import '../../../../widgets/common_button.dart';
// import '../bloc/form_bloc.dart';
// import '../bloc/form_event.dart';
// import '../bloc/form_state.dart';

// class PatientConsentForm extends StatelessWidget {
//   const PatientConsentForm({super.key, required this.phoneNumber});
//   final String phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<SearchDoctorBloc>(
//           create: (context) {
//             final bloc = getIt<SearchDoctorBloc>();
//             bloc.add(FetchDoctorsEvent());
//             return bloc;
//           },
//         ),
//         BlocProvider<FormBloc>(
//           create: (_) => FormBloc(),
//         ),
//       ],
//       child: _PatientConsentFormBody(
//         phoneNumber: phoneNumber,
//       ),
//     );
//   }
// }

// class _PatientConsentFormBody extends StatefulWidget {
//   const _PatientConsentFormBody({required this.phoneNumber});
//   final String phoneNumber;

//   @override
//   State<_PatientConsentFormBody> createState() =>
//       _PatientConsentFormBodyState();
// }

// class _PatientConsentFormBodyState extends State<_PatientConsentFormBody> {
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _dateController = TextEditingController(
//     text: DateFormat('MM/dd/yyyy').format(DateTime.now()),
//   );
//   final TextEditingController _specializationController =
//       TextEditingController();

//   final SignatureController signatureController = SignatureController(
//     penStrokeWidth: 3,
//     penColor: Colors.black,
//     exportBackgroundColor: Colors.white,
//   );
//   @override
//   void initState() {
//     super.initState();

//     final currentDate = DateTime.now();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<FormBloc>().add(UpdateDate(currentDate));
//       context.read<SearchDoctorBloc>().add(FetchDoctorsEvent());
//     });

//     _loadQrDoctorDetails();
//   }

//   void _loadQrDoctorDetails() async {
//     final SharedPref pref = SharedPref();
//     final fetchedDoctor = await pref.getQrDoctorData();

//     debugPrint("Loaded from SharedPref: ${fetchedDoctor?.toJson()}");

//     if (fetchedDoctor != null) {
//       doctorDetails = fetchedDoctor;

//       context.read<FormBloc>()
//         ..add(UpdateDoctorName(fetchedDoctor.fullName ?? ''))
//         ..add(UpdateDoctorId(int.tryParse(fetchedDoctor.id.toString()) ?? 0));

//       if (mounted) setState(() {});
//     } else {
//       debugPrint("doctorDetails is null after loading");
//     }
//   }

//   @override
//   void dispose() {
//     _dobController.dispose();
//     _dateController.dispose();
//     _specializationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<FormBloc>();
//     var w = MediaQuery.of(context).size.width;

//     return BlocBuilder<FormBloc, ConsentFormState>(
//       builder: (context, state) {
//         if (_specializationController.text != state.specialization) {
//           _specializationController.text = state.specialization ?? '';
//         }
//         return Scaffold(
//           backgroundColor: borderClr,
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   16.gapBox,
//                   _buildHeader(context),
//                   24.gapBox,
//                   _buildSectionCard(
//                     title: 'Doctor Information',
//                     children: [
//                       doctorDetails != null
//                           ? Container(
//                               padding: const EdgeInsets.all(16),
//                               margin: const EdgeInsets.only(bottom: 24),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(color: Colors.grey.shade300),
//                               ),
//                               child: Row(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 28,
//                                     backgroundColor: Colors.grey.shade200,
//                                     backgroundImage:
//                                         doctorDetails?.profilePicUrl != null
//                                             ? NetworkImage(
//                                                 doctorDetails?.profilePicUrl)
//                                             : const AssetImage(
//                                                     'assets/images/profile.png')
//                                                 as ImageProvider,
//                                   ),
//                                   16.gapBox,
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         doctorDetails?.fullName ?? "--",
//                                         style: AppTextStyles.textStyle_600_20,
//                                       ),
//                                       4.gapBox,
//                                       Text('Your Primary Doctor',
//                                           style: AppTextStyles.textStyle_500_12
//                                               .copyWith(color: greyColor)),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )
//                           : 0.hBox,
//                       doctorDetails == null
//                           ? Text(
//                               "Doctor Name",
//                               style: AppTextStyles.textStyle_400_14
//                                   .copyWith(color: grey6Clr),
//                             )
//                           : 0.hBox,
//                       7.gapBox,
//                       doctorDetails == null
//                           ? BlocBuilder<SearchDoctorBloc, SearchDoctorState>(
//                               builder: (context, state) {
//                                 if (state.isLoading) {
//                                   return const Center(child: AppLoader());
//                                 } else if (state.isSuccess) {
//                                   final doctor = state.doctorList;
//                                   return _buildDoctorSelection();
//                                 } else if (state.isError) {
//                                   return Text("Failed to load doctors");
//                                 }
//                                 return const SizedBox();
//                               },
//                             )
//                           : 0.hBox,
//                       doctorDetails == null ? 12.gapBox : 0.hBox,
//                       doctorDetails == null
//                           ? _buildInputField(
//                               label: "Specialization",
//                               onChanged: (val) =>
//                                   bloc.add(UpdateSpecialization(val)),
//                               hint: 'specialization',
//                             )
//                           : 0.hBox,
//                     ],
//                   ),
//                   20.gapBox,
//                   _buildSectionCard(
//                     title: 'Patient Information',
//                     children: [
//                       _buildInputField(
//                         label: "Full Name",
//                         onChanged: (val) =>
//                             bloc.add(UpdatePatientFullName(val)),
//                         hint: "Enter patient's name",
//                       ),
//                       12.gapBox,
//                       _buildDatePickerField(
//                         label: "Date of Birth",
//                         controller: _dobController,
//                         onDateSelected: (date) =>
//                             bloc.add(UpdatePatientDob(date)),
//                       ),
//                       12.gapBox,
//                       _buildInputField(
//                         label: "Contact Number",
//                         onChanged: (val) => bloc.add(UpdatePatientContact(val)),
//                         hint: 'contact number',
//                       ),
//                     ],
//                   ),
//                   20.gapBox,
//                   _buildSectionCard(
//                     title: 'Consent Statement',
//                     children: [
//                       Text(
//                         "I hereby consent to the medical procedure and confirm that I have been informed of all potential risks and benefits. I understand that I have the right to withdraw my consent at any time.",
//                         style: AppTextStyles.textStyle_400_14
//                             .copyWith(color: grey6Clr),
//                       ),
//                     ],
//                   ),
//                   20.gapBox,
//                   _buildSectionCard(
//                     title: 'Signature',
//                     children: [
//                       _buildSignatureSection(signatureController),
//                       _buildDatePickerField(
//                         label: "Date",
//                         controller: _dateController,
//                         onDateSelected: (date) => bloc.add(UpdateDate(date)),
//                       ),
//                       _buildInputField(
//                         label: "Enter location",
//                         onChanged: (val) => bloc.add(UpdateLocation(val)),
//                         hint: 'location',
//                       ),
//                     ],
//                   ),
//                   24.gapBox,
//                 ],
//               ),
//             ),
//           ),
//           bottomNavigationBar: Container(
//             width: w,
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: CommonButton(
//                 label: 'Submit Consent Form',
//                 onTap: () {
//                   final isFormValid = 
//                   // state.doctorName?.isNotEmpty == true &&
//                   //     state.specialization?.isNotEmpty == true &&
//                       state.patientFullName?.isNotEmpty == true &&
//                       state.dob != null &&
//                       state.contact?.isNotEmpty == true &&
//                       state.contact?.length == 10 &&
//                       state.date != null &&
//                       state.showSignature == true;

//                   if (isFormValid) {
//                     open(
//                         context,
//                         RegisterScreen(
//                           phoneNumber: widget.phoneNumber,
//                           patientDob: state.dob != null
//                               ? DateFormat('dd-MM-yyyy').format(state.dob!)
//                               : '',
//                           patientName: state.patientFullName.toString(),
//                           patientPlace: state.location.toString(),
//                           id: state.doctorId ?? 0,
//                           doctorName: state.doctorName ?? "",
//                         ));
//                   } else {
//                     showCustomSnackBar(
//                         context, 'Please fill all required fields',
//                         bgColor: Colors.red);
//                   }
//                 },
//                 color: (state.doctorName?.isNotEmpty == true &&
//                         state.specialization?.isNotEmpty == true &&
//                         state.patientFullName?.isNotEmpty == true &&
//                         state.dob != null &&
//                         state.contact?.isNotEmpty == true &&
//                         state.contact?.length == 10 &&
//                         state.date != null &&
//                         state.location?.isNotEmpty == true &&
//                         state.showSignature == true)
//                     ? consentBlueColor
//                     : Colors.grey.shade400,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildDoctorSelection() {
//     final bloc = context.read<FormBloc>();
//     return BlocBuilder<SearchDoctorBloc, SearchDoctorState>(
//       builder: (context, state) {
//         if (state.isLoading) {
//           return const Center(child: AppLoader());
//         } else if (state.isSuccess) {
//           final doctors = state.doctorList ?? [];

//           return GestureDetector(
//             onTap: () {
//               _showDoctorBottomSheet(context, doctors, bloc);
//             },
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: grey7Clr),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 bloc.state.doctorName ?? "Select a doctor",
//                 style: AppTextStyles.textStyle_400_16.copyWith(
//                   color:
//                       bloc.state.doctorName != null ? blackTextColor : grey7Clr,
//                 ),
//               ),
//             ),
//           );
//         } else if (state.isError) {
//           return Text(
//             "Failed to load doctors",
//             style: AppTextStyles.textStyle_400_14.copyWith(color: Colors.red),
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }

//   void _showDoctorBottomSheet(
//       BuildContext context, List<DoctorEntity> doctors, FormBloc bloc) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Select Doctor',
//                 style: AppTextStyles.textStyle_700_14
//                     .copyWith(color: blackTextColor),
//               ),
//               16.gapBox,
//               Flexible(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: doctors.length,
//                   itemBuilder: (context, index) {
//                     final doctor = doctors[index];
//                     return ListTile(
//                       title: Text(
//                         doctor.fullName ?? "",
//                         style: AppTextStyles.textStyle_400_16,
//                       ),
//                       onTap: () {
//                         // bloc.add(UpdateDoctorName(doctor.fullName ?? ""));
//                         // bloc.add(UpdateDoctorId(doctor.id ?? 0));
//                         // Navigator.pop(context);
//                         bloc.add(UpdateDoctorName(doctor.fullName ?? ""));
//                         bloc.add(UpdateDoctorId(doctor.id ?? 0));
//                         bloc.add(UpdateSpecialization(
//                             "Oncology"));
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'Patient Consent Form',
//           style: AppTextStyles.textStyle_700_24.copyWith(color: blackTextColor),
//         ),
//         // GestureDetector(
//         //   onTap: () => Navigator.pop(context),
//         //   child: SvgPicture.asset("assets/images/close_img.svg"),
//         // ),
//       ],
//     );
//   }

//   Widget _buildInputField(
//       {required String label,
//       required String hint,
//       required Function(String) onChanged}) {
//     final bloc = context.read<FormBloc>();
//     return CommonTextField(
//       label: label,
//       hint: "Enter $hint",
//       hintStyle: AppTextStyles.textStyle_400_16.copyWith(color: grey7Clr),
//       labelStyle: AppTextStyles.textStyle_400_14.copyWith(color: grey6Clr),
//       radius: 8,
//       isborder: true,
//       maxLength: (label == "Contact Number") ? 10 : null,
//       inputFormatters: (label == "Contact Number")
//           ? [
//               FilteringTextInputFormatter.digitsOnly,
//               LengthLimitingTextInputFormatter(10),
//             ]
//           : null,
//       keyboardType: (label == "Contact Number")
//           ? TextInputType.phone
//           : TextInputType.text,
//       controller: label == "Specialization" ? _specializationController : null,
//       readOnly: label == "Specialization",
//       onChanged: (value) {
//         if (label != "Specialization") {
//           onChanged(value);
//         }
//       },
//       // onChanged: (value) {
//       //   bloc.add(UpdateSpecialization(value));
//       //   onChanged(value);
//       // },
//     );
//   }

//   Widget _buildDatePickerField(
//       {required String label,
//       required TextEditingController controller,
//       required Function(DateTime) onDateSelected}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CommonTextField(
//           isborder: true,
//           label: label,
//           hint: 'mm/dd/yyyy',
//           readOnly: true,
//           controller: controller,
//           hintStyle: AppTextStyles.textStyle_400_16,
//           labelStyle: AppTextStyles.textStyle_400_14.copyWith(color: grey6Clr),
//           onTap: () async {
//             final picked = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime(2100),
//             );
//             if (picked != null) {
//               final formattedDate = DateFormat('MM/dd/yyyy').format(picked);
//               controller.text = formattedDate;
//               onDateSelected(picked);
//             }
//           },
//           suffixIcon: const Icon(Icons.calendar_today_outlined),
//         ),
//       ],
//     );
//   }

//   Widget _buildSectionCard(
//       {required String title, required List<Widget> children}) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (title.isNotEmpty)
//             Text(title,
//                 style:
//                     AppTextStyles.textStyle_400_14.copyWith(color: grey5Clr)),
//           12.gapBox,
//           ...children,
//         ],
//       ),
//     );
//   }

//   Widget _buildSignatureSection(SignatureController _signatureController) {
//     return BlocBuilder<FormBloc, ConsentFormState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 if (!state.showSignature) {
//                   context.read<FormBloc>().add(ShowSignature());
//                 }
//               },
//               child: DottedBorder(
//                 borderType: BorderType.RRect,
//                 radius: const Radius.circular(12),
//                 dashPattern: [4, 4],
//                 color: borderClr,
//                 strokeWidth: 2,
//                 child: SizedBox(
//                   height: 150,
//                   width: double.infinity,
//                   child: state.showSignature
//                       ? Signature(
//                           controller: _signatureController,
//                           backgroundColor: Colors.white,
//                         )
//                       : Center(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               SvgPicture.asset("assets/images/edit_icon.svg"),
//                               const SizedBox(height: 8),
//                               Text(
//                                 "Tap to sign here",
//                                 style: AppTextStyles.textStyle_400_14
//                                     .copyWith(color: grey5Clr),
//                               ),
//                             ],
//                           ),
//                         ),
//                 ),
//               ),
//             ),
//             if (state.showSignature)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       _signatureController.clear();
//                       context.read<FormBloc>().add(ClearSignature());
//                     },
//                     child: const Text("Clear Signature"),
//                   ),
//                 ],
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
