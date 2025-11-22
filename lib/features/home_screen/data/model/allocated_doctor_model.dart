// import 'package:easyfy_care_patient/features/home_screen/domain/entity/allocated_doctor_entity.dart';

// class AllocatedDoctorModel extends AllocatedDoctorResponseEntity {
//   AllocatedDoctorModel({
//     int? status,
//     bool? success,
//     String? message,
//     List<DoctorDetailModel>? data,
//   }) : super(
//           status: status,
//           success: success,
//           message: message,
//           data: data,
//         );

//   factory AllocatedDoctorModel.fromJson(Map<String, dynamic> json) {
//     return AllocatedDoctorModel(
//       status: json['status'],
//       success: json['success'],
//       message: json['message'],
//       data: (json['data'] as List<dynamic>?)
//           ?.map((e) => DoctorDetailModel.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'status': status,
//         'success': success,
//         'message': message,
//          'data': data?.map((e) => (e as DoctorDetailModel).toJson()).toList(),
//       };
// }

// class DoctorDetailModel extends DoctorDetailsEntity {
//   DoctorDetailModel({
//     String? doctorName,
//     DateTime? allocatedDate,
//     int? doctorId,
//     String? doctorEmail,
//     String? allocationStatus,
//   }) : super(
//           doctorName: doctorName,
//           allocatedDate: allocatedDate,
//           doctorId: doctorId,
//           doctorEmail: doctorEmail,
//           allocationStatus: allocationStatus,
//         );

//   factory DoctorDetailModel.fromJson(Map<String, dynamic> json) {
//     return DoctorDetailModel(
//       doctorName: json['doctorName'],
//       allocatedDate: json['allocatedDate'] != null
//           ? DateTime.tryParse(json['allocatedDate'])
//           : null,
//       doctorId: json['doctorId'],
//       doctorEmail: json['doctorEmail'],
//       allocationStatus: json['allocationStatus'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'doctorName': doctorName,
//         'allocatedDate': allocatedDate?.toIso8601String(),
//         'doctorId': doctorId,
//         'doctorEmail': doctorEmail,
//         'allocationStatus': allocationStatus,
//       };
// }