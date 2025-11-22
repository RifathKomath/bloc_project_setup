// import 'dart:io';

// import 'package:easyfy_care_patient/features/register_screen/data/datasource/register_remote_datasource.dart';
// import 'package:easyfy_care_patient/features/register_screen/data/model/patient_register_request_model.dart';
// import 'package:easyfy_care_patient/features/register_screen/domain/repository/register_repository.dart';

// import '../../../../core/utils/shared_pref.dart';
// import '../../../home_screen/data/model/notification_fcm_response.dart';
// import '../../../home_screen/domain/entity/fcm_response_entity.dart';
// import '../../../otp_screen/data/models/verify_otp_model.dart';
// import '../../domain/entity/patient_register_entity.dart';
// import '../model/file_upload_response.dart';
// import '../model/pateint_register_model.dart';
// import '../model/terms_and_condition_response.dart';

// class RegisterRepositoryImpl implements RegisterRepository {
//   final RegisterRemoteDatasource datasource;

//   RegisterRepositoryImpl({required this.datasource});
//   @override
//   Future<PatientRegisterResponse> registerUser(
//       {required UserRequest userRequest}) async {
//     final response = await datasource.registerUser(userRequest: userRequest);
//     final registerResponse = PatientRegisterResponseModel.fromJson(response);
//     final userdata = registerResponse.data;
//     final SharedPref sharedPref = SharedPref();
//     await sharedPref.save(key: "patientDetailsFromRegister", value: userdata);
//     await sharedPref.getUserDataByRegister();
//     return registerResponse;
//   }

//   @override
//   Future<CommonResponseEntity> getNotification(
//       {required dynamic fcmToken,required num id}) async {
//     final response = await datasource.getNotification(fcmToken: fcmToken,id: id);
//     final enableNotificationResponse = CommonResponse.fromJson(
//       response,
//     );
//     return enableNotificationResponse;
//   }

//   @override
//   Future<GetTermsAndConditionResponse> getTermsAndCondition() async {
//     final response = await datasource.getTermsAndCondition();
//     final termsResponse = GetTermsAndConditionResponse.fromJson(response);
//     return termsResponse;
//   }

//   @override
//   Future<VerifyOtpModel> termsStatusChange({required int? id}) async {
//     final response = await datasource.termsStatusChange(id: id);
//     final termsStatusResponse = VerifyOtpModel.fromJson(response);
//     return termsStatusResponse;
//   }

//   @override
// Future<FileUploadResponse> fileUpload({
//   required int? userId,
//   required String? documentType,
//   required num? fileSize,
//   required int? treatmentCycle,
//   required File? file,
// }) async {
//   final response = await datasource.fileUpload(
//     userId: userId,
//     documentType: documentType,
//     fileSize: fileSize,
//     treatmentCycle: treatmentCycle,
//     file: file,
//   );

//   final uploadResponse = FileUploadResponse.fromJson(response);
//   return uploadResponse;
// }

// }
