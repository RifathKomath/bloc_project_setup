import '../../domain/entities/verify_otp_entity.dart';

class VerifyOtpModel extends VerifyOtpEntity {
  VerifyOtpModel({
    int? status,
    bool? success,
    String? message,
    VerifyData? data,
  }) : super(
          status: status,
          success: success,
          message: message,
          data: data,
        );

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? VerifyData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
      'data': data is VerifyData ? (data as VerifyData).toJson() : null,
    };
  }
}

class VerifyData extends VerifyDataEntity {
  VerifyData({
    PatientDetailsModel? patientDetails,
    bool? registered,
    String? userType,
  }) : super(
          patientDetails: patientDetails,
          registered: registered,
          userType: userType,
        );

  factory VerifyData.fromJson(Map<String, dynamic> json) {
    return VerifyData(
      patientDetails: json['patientDetails'] != null
          ? PatientDetailsModel.fromJson(json['patientDetails'])
          : null,
      registered: json['registered'],
      userType: json['userType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientDetails': patientDetails is PatientDetailsModel
          ? (patientDetails as PatientDetailsModel).toJson()
          : null,
      'registered': registered,
      'userType': userType,
    };
  }
}

class PatientDetailsModel extends PatientDetails {
  PatientDetailsModel(
      {int? id,
      String? fullName,
      String? email,
      String? gender,
      String? maritialStatus,
      String? bloodGroup,
      String? place,
      String? dob,
      String? mobile,
      String? aadhar,
      String? status,
      String? active,
      String? enteredDt,
      String? latitude,
      String? longitude,
      String? patientId,
      bool? termsAccepted,
      int? age,
      String? profilePicUrl})
      : super(
            id: id,
            fullName: fullName,
            email: email,
            gender: gender,
            maritialStatus: maritialStatus,
            bloodGroup: bloodGroup,
            dob: dob,
            mobile: mobile,
            place: place,
            aadhar: aadhar,
            status: status,
            active: active,
            age: age,
            termsAccepted: termsAccepted,
            enteredDt: enteredDt,
            latitude: latitude,
            longitude: longitude,
            patientId: patientId,
            profilePicUrl: profilePicUrl);

  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) {
    return PatientDetailsModel(
        id: json['id'],
        fullName: json['fullName'],
        email: json['email'],
        gender: json['gender'],
        maritialStatus: json['maritialStatus'],
        bloodGroup: json['bloodGroup'],
        dob: json['dob'],
        mobile: json['mobile'],
        place: json['place'],
        aadhar: json['aadhar'],
        status: json['status'],
        active: json['active'],
        enteredDt: json['enteredDt'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        age: json['age'],
        patientId: json['patientId'],
        profilePicUrl: json['profilePicUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'gender': gender,
      'maritialStatus': maritialStatus,
      'bloodGroup': bloodGroup,
      'dob': dob,
      'age':age,
      'place': place,
      'mobile': mobile,
      'aadhar': aadhar,
      'status': status,
      'active': active,
      'enteredDt': enteredDt,
      'latitude': latitude,
      'longitude': longitude,
      'patientId': patientId,
      'profilePicUrl': profilePicUrl,
      'termsAccepted': termsAccepted
    };
  }
}
