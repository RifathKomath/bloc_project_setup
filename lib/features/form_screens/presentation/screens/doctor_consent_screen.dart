// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../../core/utils/screen_utils.dart';
// import '../../../../widgets/common_button.dart';
// import '../../../../widgets/common_textfield.dart';
// import '../../../register_screen/presentation/screens/register_screen.dart';
// import '../bloc/form_bloc.dart';
// import '../bloc/form_event.dart';
// import '../bloc/form_state.dart';

// class ConsentFormScreen extends StatelessWidget {
//   const ConsentFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController dobController = TextEditingController();
//     final TextEditingController dateController = TextEditingController();
//     return BlocProvider(
//       create: (_) => getIt<FormBloc>(),
//       child: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF0077B6), Color(0xFF60D394)],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   width: double.infinity,
//                   margin: const EdgeInsets.only(top: 100, left: 16, right: 16,bottom: 16),
//                   padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: BlocBuilder<FormBloc, ConsentFormState>(
//                     builder: (context, state) {
//                       final bloc = context.read<FormBloc>();
//                       return SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildSectionTitle("Doctor Information"),
//                             _buildTextField(
//                                 "Doctor's Name", "Enter doctor's name"),
//                             const SizedBox(height: 12),
//                             _buildTextField("Medical License Number",
//                                 "Enter license number"),
//                             const SizedBox(height: 24),
//                             _buildSectionTitle("Patient Information"),
//                             _buildTextField(
//                                 "Patient's Full Name", "Enter patient's name"),
//                             const SizedBox(height: 12),
//                             _buildDatePickerField(
//                               context: context,
//                               label: "Date of Birth",
//                               controller: dobController, 
//                               onDateSelected: (date) =>
//                                   bloc.add(UpdatePatientDob(date)),
//                             ),
//                             const SizedBox(height: 24),
//                             _buildSectionTitle("Consent Statement"),
//                             18.gapBox,
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: borderClr,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   "I hereby consent to the medical procedure and confirm that I have been informed of all potential risks and benefits. I understand that I have the right to withdraw my consent at any time.",
//                                   style: AppTextStyles.textStyle_400_14_roboto
//                                       .copyWith(color: grey6Clr),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Checkbox(value: false, onChanged: (val) {}),
//                                 Expanded(
//                                   child: Text(
//                                     'I have read and agree to the consent statement',
//                                     style: AppTextStyles.textStyle_400_14_roboto
//                                         .copyWith(color: grey6Clr),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 24),
//                             _buildSectionTitle("Signatures"),
//                             _buildSignatureBox("Patient's Signature*"),
//                             const SizedBox(height: 12),
//                             _buildSignatureBox("Doctor's Signature*"),
//                             const SizedBox(height: 12),
//                             _buildDatePickerField(
//                               context: context,
//                               label: "Date",
//                               controller: dateController,
//                               onDateSelected: (date) =>
//                                   bloc.add(UpdatePatientDob(date)),
//                             ),
//                             const SizedBox(height: 20),
//                             CommonButton(
//                               label: 'Submit Consent Form',
//                               onTap: () {
//                                 open(context, RegisterScreen());
//                               },
//                               color: consentBlueColor,
//                             ),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 50,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: SvgPicture.asset(
//                     "assets/images/app_logo.svg",
//                     width: 88,
//                     height: 88,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: AppTextStyles.textStyle_500_18.copyWith(color: blackText1Color),
//     );
//   }

//   Widget _buildTextField(String label, String hint) {
//     return CommonTextField(
//       label: label,
//       hint: hint,
//       hintStyle: AppTextStyles.textStyle_400_16.copyWith(color: grey7Clr),
//       labelStyle: AppTextStyles.textStyle_400_14.copyWith(color: grey6Clr),
//       radius: 8,
//     );
//   }

//   Widget _buildDatePickerField(
//       {required BuildContext context,
//       required String label,
//       required TextEditingController controller,
//       required Function(DateTime) onDateSelected}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CommonTextField(
//           label: label,
//           hint: 'mm / dd / yyyy',
//           readOnly: true,
//           controller: controller,
//           hintStyle: AppTextStyles.textStyle_400_16.copyWith(color: grey7Clr),
//           labelStyle: AppTextStyles.textStyle_400_14.copyWith(color: grey6Clr),
//           onTap: () async {
//             final picked = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime(2100),
//             );
//             if (picked != null) {
//               controller.text = "${picked.month}/${picked.day}/${picked.year}";
//               onDateSelected(picked);
//             }
//           },
//           suffixIcon: const Icon(Icons.calendar_today_outlined),
//         ),
//       ],
//     );
//   }

//   Widget _buildSignatureBox(String label) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style:
//               AppTextStyles.textStyle_400_14_roboto.copyWith(color: grey6Clr),
//         ),
//         const SizedBox(height: 6),
//         Container(
//           height: 120,
//           decoration: BoxDecoration(
//             border: Border.all(color: filterchipClr, width: 2),
//             borderRadius: BorderRadius.circular(8),
//             color: borderClr,
//           ),
//           alignment: Alignment.center,
//           child: Text("Tap to sign",
//               style: AppTextStyles.textStyle_400_16_roboto
//                   .copyWith(color: grey8Clr)),
//         ),
//       ],
//     );
//   }
// }
