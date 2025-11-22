class PatientRegisterResponse {
  int? status;
  bool? success;
  String? message;
  PatientRegisterData? data;

  PatientRegisterResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });
}

class PatientRegisterData {
  int? id;
  String? fullName;
  String? email;
  String? gender;
  String? place;
  String? maritialStatus;
  String? bloodGroup;
  DateTime? dob;
  String? active;
  DateTime? enteredDt;
  String? fcmToken;
  String? latitude;
  String? longitude;
  String? status;
  int? age;
  String? patientId;
  String? profilePicUrl;
  bool? termsAccepted;
  bool? isQrRegistered;

  PatientRegisterData({
    this.id,
    this.fullName,
    this.email,
    this.gender,
    this.maritialStatus,
    this.place,
    this.bloodGroup,
    this.dob,
    this.active,
    this.enteredDt,
    this. fcmToken,
     this. latitude,
      this.longitude,
       this. age,
       this. patientId,
      this. profilePicUrl,
       this. termsAccepted,
       this.isQrRegistered,
       this.status
  });
}
