class VerifyOtpEntity {
    int? status;
    bool? success;
    String? message;
    VerifyDataEntity? data;

    VerifyOtpEntity({
        this.status,
         this.success,
         this.message,
         this.data,
    });

}

class VerifyDataEntity {
  PatientDetails? patientDetails;
  bool? registered;
  String? userType;

  VerifyDataEntity({
    this.patientDetails,
    this.registered,
    this.userType,
  });
}

class PatientDetails {
  int? id;
  String? fullName;
  String? email;
  String? gender;
  String? maritialStatus;
  String? place;
  String? bloodGroup;
  String? dob;
  String? mobile;
  String? aadhar;
  String? status;
  String? active;
  String? enteredDt;
  String? latitude;
  String? longitude;
  String? patientId;
  String? profilePicUrl;
 bool? termsAccepted;
 int? age;



  PatientDetails({
    this.id,
    this.fullName,
    this.email,
    this.gender,
    this.maritialStatus,
    this.bloodGroup,
    this.dob,
    this.mobile,
    this.place,
    this.aadhar,
    this.status,
    this.active,
    this.enteredDt,
    this.latitude,
    this.longitude,
    this.patientId,
    this.age,
    this.termsAccepted,
    this.profilePicUrl
  });
}