import 'dart:io';
import '../../../home_screen/domain/entity/fcm_response_entity.dart';
import '../../../otp_screen/domain/entities/verify_otp_entity.dart';
import '../../data/model/patient_register_request_model.dart';
import '../entity/file_upload_entity.dart';
import '../entity/patient_register_entity.dart';
import '../entity/terms_and_condition_entity.dart';

abstract class RegisterRepository {
  Future<PatientRegisterResponse> registerUser(
      {required UserRequest userRequest});
  Future<CommonResponseEntity> getNotification({required dynamic fcmToken,required num id});
  Future<TermsAndConditionEntity> getTermsAndCondition();
  Future<VerifyOtpEntity> termsStatusChange({required int? id});
  Future<FileUploadEntity> fileUpload({
  required int? userId,
  required String? documentType,
  required num? fileSize,
  required int? treatmentCycle,
  required File? file,
});

}
