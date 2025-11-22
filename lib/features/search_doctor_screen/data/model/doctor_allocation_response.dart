import '../../domain/entity/doctor_allocation_entity.dart';

class DoctorAllocationModel extends DoctorAllocationEntity {
  DoctorAllocationModel({
     int? status,
     bool? success,
     String? message,
  }) : super(
          status: status,
          success: success,
          message: message,
        );

  factory DoctorAllocationModel.fromJson(Map<String, dynamic> json) {
    return DoctorAllocationModel(
      status: json['status'],
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
    };
  }
}