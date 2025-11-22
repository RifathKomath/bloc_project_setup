// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:easyfy_care_patient/features/no_data_screen/presentation/screens/no_data_screen.dart';
// import 'package:easyfy_care_patient/features/otp_screen/presentation/bloc/otp_bloc.dart';
// import 'package:easyfy_care_patient/features/otp_screen/presentation/bloc/otp_event.dart';
// import 'package:easyfy_care_patient/features/otp_screen/presentation/bloc/otp_state.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/screens/register_screen.dart';
// import 'package:easyfy_care_patient/features/search_doctor_screen/presentation/search_doctor_screen.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import '../../../../core/utils/shared_pref.dart';
// import '../../../../widgets/common_snack_bar.dart';
// import '../../../form_screens/presentation/screens/patient_consent_screen.dart';

// class OtpScreen extends StatefulWidget {
//   final String phoneNumber;
//   // final String otp;

//   const OtpScreen({
//     super.key,
//     required this.phoneNumber,
//   });

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> with CodeAutoFill {
//   late TextEditingController otpController;
//   String? _code;

//   @override
//   void initState() {
//     // TODO: implement initState

//     // context.read<OtpBloc>().add(StartTimer());
//     otpController = TextEditingController();
//     // Initialize SMS autofill
//     _initSmsListener();
//     loadQrDoctorDetails();
//     super.initState();
//   }

//   void _initSmsListener() async {
//     // Get app signature for SmsAutoFill
//     await SmsAutoFill().getAppSignature;

//     // Start listening for SMS
//     SmsAutoFill().listenForCode();

//     // Listen for autofill code
//     listenForCode();
//   }

//     void loadQrDoctorDetails() async {
//     final SharedPref pref = SharedPref();
//     final fetchedDoctor = await pref.getQrDoctorData();

//     debugPrint("Loaded from SharedPref: ${fetchedDoctor?.toJson()}");

//     if (fetchedDoctor != null) {
//       doctorDetails = fetchedDoctor;

//       // context.read<FormBloc>()
//       //   ..add(UpdateDoctorName(fetchedDoctor.fullName ?? ''))
//       //   ..add(UpdateDoctorId(int.tryParse(fetchedDoctor.id.toString()) ?? 0));

//       if (mounted) setState(() {});
//     } else {
//       debugPrint("doctorDetails is null after loading");
//     }
//   }


//   @override
//   void codeUpdated() {
//     setState(() {
//       _code = code;
//       if (_code != null && _code!.isNotEmpty) {
//         otpController.text = _code!;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

//     return BlocProvider(
//       create: (_) => getIt<OtpBloc>()..add(StartTimer()),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             if (!isKeyboardVisible) //
//               Image.asset(
//                 'assets/images/doc4.png',
//                 width: w,
//                 height: h * 0.55,
//                 fit: BoxFit.fill,
//               ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: w,
//                 height: isKeyboardVisible ? h : null,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(32),
//                     topRight: Radius.circular(32),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10,
//                       offset: Offset(0, -2),
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(20),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(height: isKeyboardVisible ? 70 : 10),
//                       const Text(
//                         "Verify your phone number?",
//                         style: AppTextStyles.textStyle_700_32,
//                         textAlign: TextAlign.start,
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         "We’ve sent you a time verification code to",
//                         style: AppTextStyles.textStyle_400_16
//                             .copyWith(color: textColor),
//                         textAlign: TextAlign.start,
//                       ),
//                       const SizedBox(height: 6),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           5.gapBox,
//                           Text(
//                             widget.phoneNumber,
//                             style: AppTextStyles.textStyle_400_16
//                                 .copyWith(color: textColor),
//                           ),
//                           6.gapBox,
//                           const Icon(Icons.edit, size: 18),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//                       BlocBuilder<OtpBloc, OtpState>(
//                         builder: (context, state) {
//                           // if (state.extractedOtp != null &&
//                           //     state.extractedOtp != otpController.text) {
//                           //   otpController.text = state.extractedOtp!;
//                           // }
//                           return PinCodeTextField(
//                             appContext: context,
//                             length: 5,
//                             onCompleted: (value) {},
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'OTP cannot be empty';
//                               }
//                               return null;
//                             },
//                             controller: otpController,
//                             onChanged: (value) {
//                               if (value.length == 5) {
//                                 context.read<OtpBloc>().add(OtpChanged(value));
//                               }
//                             },
//                             enablePinAutofill: true,
//                             keyboardType: TextInputType.number,
//                             autoFocus: true,
//                             textStyle: AppTextStyles.textStyle_400_24,
//                             pinTheme: PinTheme(
//                               shape: PinCodeFieldShape.box,
//                               borderRadius: BorderRadius.circular(10),
//                               fieldHeight: 62,
//                               fieldWidth: 58,
//                               activeColor: greenColor,
//                               selectedColor: greenColor,
//                               inactiveColor: Colors.grey,
//                             ),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 24),
//                       BlocConsumer<OtpBloc, OtpState>(
//                         listener: (context, state) {
//                           if (state.verifyOtpResponse?.success == true &&
//                               state.otpStatus == OtpStatus.verified) {
//                             if (state.verifyOtpResponse?.data?.registered ==
//                                 true) {
//                               if (patientDetails?.status == "A") {
//                                 openAsNewPage(
//                                     context, BaseScreen(currentIndex: 0));
//                               } else {
//                                 openAsNewPage(context, NoDataScreen());
//                               }
//                             } else {
//                               openAsNewPage(
//                                   context,
//                                 doctorDetails == null ?  SearchDoctorScreen(
//                                     mobileNumber: widget.phoneNumber,
//                                   ) : RegisterScreen(phoneNumber: widget.phoneNumber, id: doctorDetails?.id ?? 0));
//                             }
//                           } else if (state.verifyOtpError != null) {
//                             showCustomSnackBar(
//                               context,
//                               'Otp Verification failed',
//                             );
//                           }
//                         },
//                         builder: (context, state) {
//                           return CommonButton(
//                             label:
//                                 state.isVerifyingOtp ? 'Verifying..' : 'Verify',
//                              bgColor: otpController.text.length == 5 ? buttonColor : enabledbuttonColor,
//                              textColor: otpController.text.length == 5 ? whiteText : textGreyColor,
//                             onTap: () {
//                               state.isVerifyingOtp
//                                   ? null
//                                   : context.read<OtpBloc>().add(
//                                         VerifyOtp( 
//                                             phoneNumber: widget.phoneNumber,
//                                             otp: otpController.text),
//                                       );
//                             },
                            
//                           );
//                         },
//                       ),
//                      SizedBox(height: 20),
//                       BlocBuilder<OtpBloc, OtpState>(
//                         buildWhen: (previous, current) =>
//                             previous.otpTimer != current.otpTimer ||
//                             previous.canResendOtp != current.canResendOtp,
//                         builder: (context, state) {
//                           return Center(
//                             child: state.canResendOtp
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       context.read<OtpBloc>().add(
//                                           ResendOtpPressed(
//                                               phoneNumber: widget.phoneNumber));
//                                     },
//                                     child: const Text(
//                                       "Resend OTP",
//                                       style: TextStyle(
//                                         color: Colors.green,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   )
//                                 : Text(
//                                     "Resend OTP in 0:${state.otpTimer.toString().padLeft(2, '0')} sec",
//                                     style: const TextStyle(color: Colors.red),
//                                   ),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
