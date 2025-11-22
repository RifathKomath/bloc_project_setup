// import 'dart:io';
// import 'package:easyfy_care_patient/features/register_screen/domain/repository/register_repository.dart';
// import '../../../home_screen/domain/entity/fcm_response_entity.dart';
// import '../../../otp_screen/domain/entities/verify_otp_entity.dart';
// import '../../data/model/patient_register_request_model.dart';
// import '../entity/file_upload_entity.dart';
// import '../entity/patient_register_entity.dart';
// import '../entity/terms_and_condition_entity.dart';

// class RegisterUseCase {
//   final RegisterRepository repository;

//   RegisterUseCase(this.repository);

//   Future<PatientRegisterResponse> registerUser(
//       {required UserRequest userRequest}) {
//     return repository.registerUser(userRequest: userRequest);
//   }

//   Future<CommonResponseEntity> getNotification({required String fcmToken,required num id}) {
//     return repository.getNotification(fcmToken: fcmToken,id: id);
//   }

//   Future<TermsAndConditionEntity> getTermsAndCondition() {
//     return repository.getTermsAndCondition();
//   }

//   Future<VerifyOtpEntity> termsStatusChange({required int? id}) {
//     return repository.termsStatusChange(id: id);
//   }

//   Future<FileUploadEntity> fileUpload({
//     required int? userId,
//     required String? documentType,
//     required num? fileSize,
//     required int? treatmentCycle,
//     required File? file,
//   }) {
//     return repository.fileUpload(
//         userId: userId,
//         documentType: documentType,
//         fileSize: fileSize,
//         treatmentCycle: treatmentCycle,
//         file: file);
//   }
// }
// //
