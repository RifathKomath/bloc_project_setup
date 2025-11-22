// import 'package:easyfy_care_patient/features/otp_screen/data/datasources/otp_remote_data_source.dart';
// import 'package:easyfy_care_patient/features/otp_screen/data/models/otp_response_model.dart';
// import 'package:easyfy_care_patient/features/otp_screen/domain/entities/otp_entity.dart';
// import 'package:easyfy_care_patient/features/otp_screen/domain/repositories/otp_repository.dart';

// import '../../../../config.dart';
// import '../../../../core/utils/shared_pref.dart';
// import '../models/verify_otp_model.dart';

// class OtpRepositoryImpl implements OtpRepository {
//   final OtpRemoteDataSource datasource;

//   // Now only pass the datasource to the constructor
//   OtpRepositoryImpl({required this.datasource});

//   @override
//   Future<OtpResponseEntity> sentOtp({required String phoneNo}) async {
//     final response = await datasource.sentOtp(phoneNumber: phoneNo);
//     final sentOtpResponse = OtpResponseModel.fromJson(response);
//     return sentOtpResponse;
//   }

//   @override
//   Future<VerifyOtpModel> verifyOtp(
//       {required String phoneNo, required String otp}) async {
//     final response = await datasource.verifyOtp(phoneNumber: phoneNo, otp: otp);
//     final sentOtpResponse = VerifyOtpModel.fromJson(response);
//     if (sentOtpResponse.data?.patientDetails != null) {
//       final loginResponse = sentOtpResponse.data?.patientDetails;
//       final SharedPref sharedPref = SharedPref();

//       await sharedPref.save(key: "patientDetails", value: loginResponse);
//       await sharedPref.getUserData();
//       print("..............$loginResponse");

//       print("..............$patientDetails");
//     }

//     return sentOtpResponse;
//   }

//   @override
//   Future<OtpResponseEntity> resentOtp({required String phoneNo}) async {
//     final response = await datasource.resentOtp(phoneNumber: phoneNo);
//     final sentOtpResponse = OtpResponseModel.fromJson(response);
//     return sentOtpResponse;
//   }
// }
