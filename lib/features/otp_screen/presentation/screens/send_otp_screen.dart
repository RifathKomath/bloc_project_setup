// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/context_extension.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/otp_screen/presentation/bloc/otp_state.dart';
// import 'package:easyfy_care_patient/features/otp_screen/presentation/screens/otp_screen.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import '../../../../core/network/di.dart';
// import '../../../../widgets/common_snack_bar.dart';
// import '../../../../widgets/common_textfield.dart';
// import '../bloc/otp_bloc.dart';
// import '../bloc/otp_event.dart';

// class SendOtpScreen extends StatefulWidget {
//   SendOtpScreen({super.key});

//   @override
//   State<SendOtpScreen> createState() => _SendOtpScreenState();
// }

// class _SendOtpScreenState extends State<SendOtpScreen> {
//   final TextEditingController _phoneController = TextEditingController();

//   bool _hasRequestedPhone = false;
//   final FocusNode _phoneFocusNode = FocusNode();

//   final _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
//     // Initialize SmsAutoFill to get app signature
//     _getAppSignature();
//   }

//   Future<void> _getAppSignature() async {
//     final appSignature = await SmsAutoFill().getAppSignature;
//     print("App Signature: $appSignature");
//   }

//   Future<void> requestPhoneNumber() async {
//     try {
//       final String? phoneNumber = await SmsAutoFill().hint;
//       if (phoneNumber != null) {
//         _phoneController.text = phoneNumber.replaceAll("+91", "").trim();
//       }
//     } catch (e) {
//       print("Error in fetching phone number");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<OtpBloc>(),
//       child: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Scaffold(
//           // bottomNavigationBar: Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//           //   child: BlocConsumer<OtpBloc, OtpState>(
//           //     listener: (context, state) {
//           //       if (state.otpStatus == OtpStatus.sent &&
//           //           state.otpResponse?.success == true) {
//           //         open(
//           //             context,
//           //             OtpScreen(
//           //               phoneNumber: _phoneController.text,
//           //               otp: state.extractedOtp ?? "",
//           //             ));
//           //       } else if (state.sendOtpError != null) {
//           //         showCustomSnackBar(
//           //           context,
//           //           state.sendOtpError ?? 'Failed to send OTP',
//           //           bgColor: Colors.red,
//           //         );
//           //       }
//           //     },
//           //     builder: (context, state) {
//           //       return CommonButton(
//           //         label: state.isSendingOtp ? 'Sending...' : 'Send OTP',
//           //         onTap: () {
//           //           if (_formKey.currentState!.validate()) {
//           //             context.read<OtpBloc>().add(
//           //                   SendOtp(_phoneController.text),
//           //                 );
//           //           } else {
//           //             showCustomSnackBar(
//           //                 context, 'Please enter a valid phone number',
//           //                 bgColor: Colors.red);
//           //           }
//           //         },
//           //       );
//           //     },
//           //   ),
//           // ),
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                     height: context.deviceSize.height * .52,
//                     width: double.infinity,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30),
//                       ),
//                       child: Image.asset('assets/images/doc3.png',
//                           fit: BoxFit.cover),
//                     )),
//                 24.hBox,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "What’s your phone number?",
//                         style: AppTextStyles.textStyle_500_24,
//                       ),
//                       16.hBox,
//                       Text(
//                         "We need to make sure you’re you. Please let us\nknow what number to send a code to",
//                         style: AppTextStyles.textStyle_400_14,
//                       ),
//                       24.hBox,
//                       GestureDetector(
//                         onTap: () async {
//                           if (!_hasRequestedPhone) {
//                             _hasRequestedPhone = true;

//                             FocusScope.of(context).unfocus();
//                             await requestPhoneNumber();

//                             FocusScope.of(context)
//                                 .requestFocus(_phoneFocusNode);
//                           } else {
//                             FocusScope.of(context)
//                                 .requestFocus(_phoneFocusNode);
//                           }
//                         },
//                         child: AbsorbPointer(
//                           absorbing: !_hasRequestedPhone,
//                           child: Form(
//                             key: _formKey,
//                             child: CommonTextField(
//                               controller: _phoneController,
//                               onTap: () async {
//                                 if (!_hasRequestedPhone) {
//                                   _hasRequestedPhone = true;
//                                   await requestPhoneNumber();
//                                   FocusScope.of(context)
//                                       .requestFocus(_phoneFocusNode);
//                                 }
//                               },
//                               label: 'Phone Number',
//                               hint: 'Phone Number',
//                               maxLength: 10,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly,
//                                 LengthLimitingTextInputFormatter(10),
//                               ],
//                               keyboardType: TextInputType.phone,
//                               hintStyle: const TextStyle(color: Colors.grey),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your phone number';
//                                 } else if (!RegExp(r'^[6-9]\d{9}$')
//                                     .hasMatch(value)) {
//                                   return 'Enter a valid 10-digit phone number starting with 6-9';
//                                 } else if (value.length != 10) {
//                                   return 'Phone number should be exactly 10 digits';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//                   child: Column(
//                     children: [
//                       BlocConsumer<OtpBloc, OtpState>(
//                         listener: (context, state) {
//                           if (state.otpStatus == OtpStatus.sent &&
//                               state.otpResponse?.success == true) {
//                             open(
//                                 context,
//                                 OtpScreen(
//                                   phoneNumber: _phoneController.text,
//                                   // otp: state.extractedOtp ?? "",
//                                 ));
//                           } else if (state.sendOtpError != null) {
//                             showCustomSnackBar(
//                               context,
//                               state.sendOtpError ?? 'Failed to send OTP',
//                               bgColor: Colors.red,
//                             );
//                           }
//                         },
//                         builder: (context, state) {
//                           return CommonButton(
//                             label:
//                                 state.isSendingOtp ? 'Sending...' : 'Send OTP',
//                             onTap: () {
//                               if (_formKey.currentState!.validate()) {
//                                 context.read<OtpBloc>().add(
//                                       SendOtp(_phoneController.text),
//                                     );
//                               }
//                             },
//                           );
//                         },
//                       ),
//                       10.gapBox,
//                       GestureDetector(
//                         onTap: () {
//                           openAsNewPage(context, BaseScreen(currentIndex: 0));
//                         },
//                         child: const Text.rich(
//                           TextSpan(
//                             text: 'Are you an existing customer? ',
//                             style: TextStyle(color: Colors.black54),
//                             children: [
//                               TextSpan(
//                                 text: 'Login',
//                                 style: TextStyle(
//                                   color: Color(0xFF0077B6),
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
