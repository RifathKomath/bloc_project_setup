// import 'dart:convert';

// import 'package:easyfy_care_patient/features/otp_screen/data/models/verify_otp_model.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../config.dart';
// import '../../features/register_screen/data/model/pateint_register_model.dart';
// import '../../features/splash_screen/data/model/qr_tracking_response.dart';

// class SharedPref {
//   SharedPreferences? sharedPref;

//   Future<SharedPreferences> get _instance async =>
//       sharedPref ??= await SharedPreferences.getInstance();

//   Future<SharedPreferences> init() async {
//     sharedPref = await _instance;
//     return sharedPref!;
//   }

//   Future<bool> save({required String key, required dynamic value}) async {
//     debugPrint("........saving");
//     if (sharedPref == null) await init();
//     switch (value.runtimeType) {
//       case const (String):
//         return await sharedPref!.setString(key, value);
//       case const (bool):
//         return await sharedPref!.setBool(key, value);
//       case const (int):
//         return await sharedPref!.setInt(key, value);
//       case const (double):
//         return await sharedPref!.setDouble(key, value);
//       default:
//         return await sharedPref!.setString(key, jsonEncode(value));
//     }
//   }

//   Future<PatientDetailsModel?> getUserData() async {
//     if (sharedPref == null) await init();
//     final String? patientDetailsJson = sharedPref?.getString("patientDetails");
//     if (patientDetailsJson != null) {
//       patientDetails =
//           PatientDetailsModel.fromJson(jsonDecode(patientDetailsJson));
//       return patientDetails;
//     }
//     patientDetails = null;
//     return null;
//   }

//     Future<PatientRegisterDataModel?> getUserDataByRegister() async {
//     if (sharedPref == null) await init();
//     final String? patientDetailsFromRegisterJson = sharedPref?.getString("patientDetailsFromRegister");
//     if (patientDetailsFromRegisterJson != null) {
//       patientDetailsFromRegister =
//           PatientRegisterDataModel.fromJson(jsonDecode(patientDetailsFromRegisterJson));
//       return patientDetailsFromRegister;
//     }
//     patientDetailsFromRegister = null;
//     return null;
//   }

//   Future<DoctorInfo?> getQrDoctorData() async {
//     if (sharedPref == null) await init();
//     final String? doctorDetailsJson = sharedPref?.getString("doctorDetails");
//     if (doctorDetailsJson != null) {
//       doctorDetails = DoctorInfo.fromJson(jsonDecode(doctorDetailsJson));
//       return doctorDetails;
//     }
//     doctorDetails = null;
//     return null;
//   }

//   void clearPatientData() {
//     patientDetails = null;
//   }

//   Future<void> clearLoginResponse() async {
//     if (sharedPref == null) await init();
//     await sharedPref!.remove("patientDetails");
//   }
// }
