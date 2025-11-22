// import 'package:easyfy_care_patient/features/otp_screen/domain/entities/otp_entity.dart';
// import 'package:easyfy_care_patient/features/otp_screen/domain/entities/verify_otp_entity.dart';
// import 'package:easyfy_care_patient/features/otp_screen/domain/repositories/otp_repository.dart';

// class OtpUseCase {
//   final OtpRepository repository;

//   OtpUseCase(this.repository);

//   Future<OtpResponseEntity> sentOtp({required String phoneNo}) {
//     return repository.sentOtp(phoneNo: phoneNo);
//   }

//    Future<OtpResponseEntity> resentOtp({required String phoneNo}) {
//     return repository.resentOtp(phoneNo: phoneNo);
//   }

//    Future<VerifyOtpEntity> verifyOtp({required String phoneNo,required String otp}) {
//     return repository.verifyOtp(phoneNo: phoneNo,otp: otp);
//   }
// }