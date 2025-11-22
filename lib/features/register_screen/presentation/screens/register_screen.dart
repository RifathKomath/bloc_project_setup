// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/screens/terms_and_condition_screen.dart';
// import 'package:easyfy_care_patient/features/report_screen/presentation/widgets/show_file_picker.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:easyfy_care_patient/widgets/common_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import '../../../../core/network/di.dart';
// import '../../../../core/utils/validator.dart';
// import '../../../../widgets/common_snack_bar.dart';
// import '../bloc/reg_bloc.dart';
// import '../bloc/reg_event.dart';
// import '../bloc/reg_state.dart';
// import '../widgets/chip_row.dart';

// class RegisterScreen extends StatelessWidget {
//   final TextEditingController _aadhaarController = TextEditingController();
//   final TextEditingController _fullNameController;
//   final TextEditingController placeController;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _dobController;

//   RegisterScreen({
//     super.key,
//     required this.phoneNumber,
//     this.doctorName,
//     this.profileImage,
//     required this.id,
//   })  : _fullNameController = TextEditingController(),
//         _dobController = TextEditingController(),
//         placeController = TextEditingController();

//   final String phoneNumber;
//   final int id;
//   final String? doctorName;
//   final String? profileImage;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//     return BlocProvider(
//       create: (context) {
//         final bloc = getIt<RegisterBloc>();
//         // Initialize the bloc with the phone number
//         bloc.add(MobileChanged(phoneNumber));
//         return bloc;
//       },
//       child: BlocBuilder<RegisterBloc, RegisterState>(
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               forceMaterialTransparency: true,
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: Text(!state.isManualEntry ? "" : "Enter Your Details"),
//               leading: Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: !state.isManualEntry
//                     ? null
//                     : IconButton(
//                         onPressed: () {
//                           context
//                               .read<RegisterBloc>()
//                               .add(BackToAadhaarPressedEvent());
//                         },
//                         icon: Icon(
//                           Icons.arrow_back_ios,
//                           size: 20,
//                         )),
//               ),
//             ),
//             body: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Divider(
//                   height: 1,
//                   thickness: 0.1,
//                   color: Colors.grey,
//                 ),
//                 Expanded(
//                   child: BlocConsumer<RegisterBloc, RegisterState>(
//                     listener: (context, state) {
//                       if (state.error.isNotEmpty) {
//                         showCustomSnackBar(
//                           context,
//                           state.error,
//                         );
//                         context.read<RegisterBloc>().add(ClearErrorEvent());
//                       }
//                       if (state.isSuccess) {
//                         openAsNewPage(
//                             context,
//                             TermsAndConditionScreen(
//                               userId: state.userData?.data?.id,
//                             ));
//                       }
//                     },
//                     builder: (context, state) {
//                       final bloc = context.read<RegisterBloc>();
//                       return SingleChildScrollView(
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: Form(
//                           key: _formKey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               16.gapBox,
//                               if (!state.isManualEntry) ...[
//                                 Container(
//                                   padding: const EdgeInsets.all(16),
//                                   margin: const EdgeInsets.only(bottom: 24),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     border:
//                                         Border.all(color: Colors.grey.shade300),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 28,
//                                         backgroundColor: Colors.grey.shade200,
//                                         backgroundImage: (doctorDetails
//                                                     ?.profilePicUrl !=
//                                                 null)
//                                             ? NetworkImage(
//                                                 doctorDetails!.profilePicUrl!)
//                                             : (profileImage != null &&
//                                                     profileImage!.isNotEmpty)
//                                                 ? NetworkImage(
//                                                     profileImage ?? "")
//                                                 : const AssetImage(
//                                                         'assets/images/profile.png')
//                                                     as ImageProvider,
//                                       ),
//                                       16.gapBox,
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             doctorDetails?.fullName ??
//                                                 doctorName ??
//                                                 "",
//                                             style:
//                                                 AppTextStyles.textStyle_600_20,
//                                           ),
//                                           4.gapBox,
//                                           Text('Your Primary Doctor',
//                                               style: AppTextStyles
//                                                   .textStyle_500_12
//                                                   .copyWith(color: greyColor)),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const Text(
//                                   'Register',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 24),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 const Text(
//                                   'Please enter your details to continue',
//                                   style: TextStyle(
//                                       color: Colors.grey, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 20.gapBox,
//                                 CommonTextField(
//                                   label: 'Verify with Aadhaar',
//                                   hint: 'Enter 12-digit Aadhaar Number',
//                                   keyboardType: TextInputType.number,
//                                   onChanged: (value) =>
//                                       bloc.add(AadhaarChanged(value)),
//                                   suffixIcon: Padding(
//                                     padding: const EdgeInsets.all(12.0),
//                                     child: GestureDetector(
//                                         onTap: () {},
//                                         child:
//                                             AppSvg(name: "aadhar_camera_icon")),
//                                   ),
//                                 ),
//                                 26.gapBox,
//                                 CommonButton(
//                                   label: 'Fetch Details',
//                                   color: whiteText,
//                                   textColor: blueTextClr,
//                                   borderClr: blueTextClr,
//                                   onTap: () {
//                                     bloc.add(FetchDetailsPressed());
//                                   },
//                                 ),
//                                 26.gapBox,
//                                 Row(
//                                   children: [
//                                     Expanded(child: Divider(thickness: 0.5)),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0),
//                                       child: Text("OR",
//                                           style: AppTextStyles
//                                               .textStyle_400_16_roboto),
//                                     ),
//                                     Expanded(child: Divider(thickness: 0.5)),
//                                   ],
//                                 ),
//                                 26.gapBox,
//                                 CommonButton(
//                                   label: 'Enter Manually',
//                                   color: whiteText,
//                                   textColor: blueTextClr,
//                                   borderClr: blueTextClr,
//                                   onTap: () {
//                                     bloc.add(EnterManuallyPressedEvent());
//                                   },
//                                 ),
//                               ] else ...[
//                                 CommonTextField(
//                                   label: 'Full Name',
//                                   hint: 'Enter your full name',
//                                   controller: _fullNameController,
//                                   validator: (value) =>
//                                       validateRequired('Full name', value),
//                                   onChanged: (val) =>
//                                       bloc.add(FullNameChanged(val)),
//                                 ),
//                                 16.gapBox,
//                                 CommonTextField(
//                                   label: 'Email',
//                                   hint: 'Enter your Email',
//                                   controller: _emailController,
//                                   validator: (value) => validateEmail(value),
//                                   onChanged: (val) =>
//                                       bloc.add(EmailChanged(val)),
//                                 ),
//                                 16.gapBox,
//                                 CommonTextField(
//                                   label: 'Place',
//                                   hint: 'Enter your place',
//                                   controller: placeController,
//                                   validator: (value) =>
//                                       validateRequired('Place', value),
//                                   onChanged: (val) =>
//                                       bloc.add(PlaceChanged(val)),
//                                 ),
//                                 16.gapBox,
//                                 CommonTextField(
//                                   label: 'Date of Birth',
//                                   hint: 'mm/dd/yyyy',
//                                   readOnly: true,
//                                   controller: _dobController,
//                                   validator: (value) =>
//                                       validateRequired('Date of birth', value),
//                                   onTap: () async {
//                                     DateTime? picked = await showDatePicker(
//                                       context: context,
//                                       initialDate: DateTime.now(),
//                                       firstDate: DateTime(1900),
//                                       lastDate: DateTime.now(),
//                                     );
//                                     if (picked != null) {
//                                       final formattedDate =
//                                           DateFormat('MM/dd/yyyy')
//                                               .format(picked);
//                                       _dobController.text = formattedDate;
//                                       bloc.add(DobChanged(picked));
//                                     }
//                                   },
//                                   suffixIcon:
//                                       const Icon(Icons.calendar_today_outlined),
//                                 ),
//                                 16.gapBox,
//                                 Text('Gender',
//                                     style: AppTextStyles.textStyle_500_14
//                                         .copyWith(color: blackTextClr)),
//                                 8.gapBox,
//                                 SizedBox(
//                                   width: w,
//                                   child: CustomChoiceChipRow(
//                                       options: ['Male', 'Female', 'Others'],
//                                       selectedValue: state.gender,
//                                       onSelected: (val) =>
//                                           bloc.add(GenderSelected(val)),
//                                       alignment: MainAxisAlignment.start,
//                                       isExpanded: true),
//                                 ),
//                                 16.gapBox,
//                                 Text('Marital Status',
//                                     style: AppTextStyles.textStyle_500_14
//                                         .copyWith(color: blackTextClr)),
//                                 8.gapBox,
//                                 SizedBox(
//                                   width: w,
//                                   child: CustomChoiceChipRow(
//                                     options: ['Single', 'Married', 'Divorced'],
//                                     selectedValue: state.maritalStatus,
//                                     onSelected: (val) =>
//                                         bloc.add(MaritalStatusSelected(val)),
//                                     alignment: MainAxisAlignment.start,
//                                     isExpanded: true,
//                                   ),
//                                 ),
//                                 16.gapBox,
//                                 Text('Blood Group',
//                                     style: AppTextStyles.textStyle_500_14
//                                         .copyWith(color: blackTextClr)),
//                                 8.gapBox,
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CustomChoiceChipRow(
//                                         options: ['A+', 'A-', 'B+', 'B-', 'O+'],
//                                         selectedValue: state.bloodGroup,
//                                         onSelected: (val) =>
//                                             bloc.add(BloodGroupSelected(val)),
//                                         alignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         isExpanded: true),
//                                     const SizedBox(height: 8),
//                                     CustomChoiceChipRow(
//                                       options: ['O-', 'AB+', 'AB-'],
//                                       selectedValue: state.bloodGroup,
//                                       onSelected: (val) =>
//                                           bloc.add(BloodGroupSelected(val)),
//                                       alignment: MainAxisAlignment.spaceBetween,
//                                       isExpanded: false,
//                                     ),
//                                   ],
//                                 ),
//                                 36.gapBox,
//                                 CommonButton(
//                                     label: state.isSubmitting
//                                         ? 'Submitting...'
//                                         : 'Continue',
//                                     onTap: () {
//                                       if (state.isSubmitting) {
//                                         return;
//                                       }

//                                       // Validate the form before submitting
//                                       if (_formKey.currentState!.validate()) {
//                                         // Check if gender is selected
//                                         if (state.gender == null ||
//                                             state.gender!.isEmpty) {
//                                           showCustomSnackBar(context,
//                                               'Please select your gender');
//                                           return;
//                                         }

//                                         // Check if marital status is selected
//                                         if (state.maritalStatus == null ||
//                                             state.maritalStatus!.isEmpty) {
//                                           showCustomSnackBar(context,
//                                               "Please select your marital status");
//                                           return;
//                                         }

//                                         // Check if blood group is selected
//                                         if (state.bloodGroup == null ||
//                                             state.bloodGroup!.isEmpty) {
//                                           showCustomSnackBar(context,
//                                               "Please select your blood group");
//                                           return;
//                                         }

//                                         bloc.add(FullNameChanged(
//                                             _fullNameController.text.trim()));
//                                         bloc.add(PlaceChanged(
//                                             placeController.text.trim()));
//                                         bloc.add(EmailChanged(
//                                             _emailController.text.trim()));
//                                         bloc.add(DobChanged(
//                                           _dobController.text.isNotEmpty
//                                               ? DateFormat('MM/dd/yyyy')
//                                                   .parse(_dobController.text)
//                                               : DateTime.now(),
//                                         ));

//                                         bloc.add(MobileChanged(phoneNumber));

//                                         // All validations passed, submit the form
//                                         bloc.add(SubmitPressed(doctorId: id));
//                                       }
//                                     }),
//                                 16.gapBox,
//                               ],
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
