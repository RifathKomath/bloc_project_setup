import '../../domain/entity/patient_register_entity.dart';

class PatientRegisterResponseModel extends PatientRegisterResponse {
  PatientRegisterResponseModel({
    int? status,
    bool? success,
    String? message,
    PatientRegisterData? data,
  }) : super(
          status: status,
          success: success,
          message: message,
          data: data,
        );

  factory PatientRegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return PatientRegisterResponseModel(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? PatientRegisterDataModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
      'data': data != null ? (data as PatientRegisterDataModel).toJson() : null,
    };
  }
}

class PatientRegisterDataModel extends PatientRegisterData {
  PatientRegisterDataModel(
      {int? id,
      String? fullName,
      String? email,
      String? gender,
      String? maritialStatus,
      String? place,
      String? bloodGroup,
      DateTime? dob,
      String? active,
      DateTime? enteredDt,
      String? fcmToken,
      String? latitude,
      String? longitude,
      int? age,
      String? patientId,
      
      String? profilePicUrl,
     String? status,
      bool? termsAccepted,
      bool? isQrRegistered})
      : super(
            id: id,
            fullName: fullName,
            email: email,
            gender: gender,
            maritialStatus: maritialStatus,
            bloodGroup: bloodGroup,
            dob: dob,
            place: place,
            active: active,
            enteredDt: enteredDt,
            fcmToken: fcmToken,
            latitude: latitude,
            longitude: longitude,
            age: age,
            patientId: patientId,
            profilePicUrl: profilePicUrl,
            termsAccepted: termsAccepted,
            status: status,
            isQrRegistered: isQrRegistered);

  factory PatientRegisterDataModel.fromJson(Map<String, dynamic> json) {
    return PatientRegisterDataModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      gender: json['gender'],
      maritialStatus: json['maritialStatus'],
      bloodGroup: json['bloodGroup'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      active: json['active'],
      place: json['place'],
      enteredDt:
          json['enteredDt'] != null ? DateTime.parse(json['enteredDt']) : null,
      fcmToken: json['fcmToken'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      age: json['age'],
      patientId: json['patientId'],
      profilePicUrl: json['profilePicUrl'],
      termsAccepted: json['termsAccepted'],
      isQrRegistered: json['isQrRegistered'],
      status: json['status']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'gender': gender,
      'place': place,
      'maritialStatus': maritialStatus,
      'bloodGroup': bloodGroup,
      'dob': dob?.toIso8601String(),
      'active': active,
      'enteredDt': enteredDt?.toIso8601String(),
      'fcmToken': fcmToken,
      'latitude': latitude,
      'longitude': longitude,
      'age': age,
      'patientId': patientId,
      'profilePicUrl': profilePicUrl,
      'termsAccepted': termsAccepted,
      'isQrRegistered': isQrRegistered,
      'status':status
    };
  }
}
