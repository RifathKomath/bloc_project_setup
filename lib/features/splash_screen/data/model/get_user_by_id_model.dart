// import 'package:easyfy_care_patient/features/otp_screen/data/models/verify_otp_model.dart';

// import '../../domain/entity/getuserbyId_entity.dart';

// class GetUserByIdModel extends GetUserByIdEntity {
//   GetUserByIdModel({
//     int? status,
//     bool? success,
//     String? message,
//     PatientDetailsModel? data,
//   }) : super(
//           status: status,
//           success: success,
//           message: message,
//           data: data,
//         );

//   factory GetUserByIdModel.fromJson(Map<String, dynamic> json) {
//     return GetUserByIdModel(
//       status: json['status'],
//       success: json['success'],
//       message: json['message'],
//       data: json['data'] != null ? PatientDetailsModel.fromJson(json['data']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'success': success,
//       'message': message,
//       'data': data is PatientDetailsModel ? (data as PatientDetailsModel).toJson() : null,
//     };
//   }
// }
