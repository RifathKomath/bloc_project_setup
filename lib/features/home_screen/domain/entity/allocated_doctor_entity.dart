class AllocatedDoctorResponseEntity {
  int? status;
  bool? success;
  String? message;
  List<DoctorDetailsEntity>? data;

  AllocatedDoctorResponseEntity({
    this.status,
    this.success,
    this.message,
    this.data,
  });
}

class DoctorDetailsEntity {
  String? doctorName;
  DateTime? allocatedDate;
  int? doctorId;
  String? doctorEmail;
  String? allocationStatus;

  DoctorDetailsEntity({
    this.doctorName,
    this.allocatedDate,
    this.doctorId,
    this.doctorEmail,
    this.allocationStatus,
  });
}