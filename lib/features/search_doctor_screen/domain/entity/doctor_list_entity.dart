class DoctorListEntity {
  final int? status;
  final bool? success;
  final String? message;
  final List<DoctorEntity>? data;

  DoctorListEntity({
    this.status,
    this.success,
    this.message,
    this.data,
  });
}

class DoctorEntity {
  final int? id;
  final String? fullName;
  final String? email;
  final DateTime? dob;
  final String? gender;
  final String? uid;
  final String? mobile;
  final String? aadhar;
  final String? status;
  final String? active;
  final String? place;
  final String? latitude;
  final String? longitude;
  final String? profilePicUrl;
  final int? age;

  DoctorEntity(
      {this.id,
      this.fullName,
      this.email,
      this.dob,
      this.gender,
      this.uid,
      this.mobile,
      this.aadhar,
      this.status,
      this.active,
      this.age,
      this.latitude,
      this.longitude,
      this.place,
      this.profilePicUrl});
}
