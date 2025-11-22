import '../../domain/entity/doctor_list_entity.dart';

class DoctorListModel extends DoctorListEntity {
  DoctorListModel({
    int? status,
    bool? success,
    String? message,
    List<DoctorModel>? data,
  }) : super(
          status: status,
          success: success,
          message: message,
          data: data,
        );

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data:
          (json['data'] as List?)?.map((e) => DoctorModel.fromJson(e)).toList(),
    );
  }
}

class DoctorModel extends DoctorEntity {
  DoctorModel(
      {int? id,
      String? fullName,
      String? email,
      DateTime? dob,
      String? gender,
      String? uid,
      String? mobile,
      String? aadhar,
      String? status,
      String? active,
      String? place,
      String? latitude,
      String? longitude,
      String? profilePicUrl,
      int? age})
      : super(
            id: id,
            fullName: fullName,
            email: email,
            dob: dob,
            gender: gender,
            uid: uid,
            mobile: mobile,
            aadhar: aadhar,
            status: status,
            active: active,
            place: place,
            latitude: latitude,
            longitude: longitude,
            profilePicUrl: profilePicUrl,
            age: age);

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      dob: json['dob'] != null ? DateTime.tryParse(json['dob']) : null,
      gender: json['gender'],
      uid: json['uid'],
      mobile: json['mobile'],
      aadhar: json['aadhar'],
      status: json['status'],
      active: json['active'],
      place: json['place'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      profilePicUrl: json['profilePicUrl'],
      age: json['age'],
    );
  }
}
