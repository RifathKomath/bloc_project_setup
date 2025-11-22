import '../../domain/entity/qr_entity.dart';

class QrTrackingResponse extends QrTrackingResponseEntity {
  int? status;
  bool? success;
  String? message;
  QrData? data;

  QrTrackingResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory QrTrackingResponse.fromJson(Map<String, dynamic> json) =>
      QrTrackingResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] != null ? QrData.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class QrData extends DataEntity{
  DoctorInfo? doctorInfo;
  Tracking? tracking;

  QrData({
    this.doctorInfo,
    this.tracking,
  });

  factory QrData.fromJson(Map<String, dynamic> json) => QrData(
        doctorInfo: json["doctorInfo"] != null
            ? DoctorInfo.fromJson(json["doctorInfo"])
            : null,
        tracking: json["tracking"] != null
            ? Tracking.fromJson(json["tracking"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "doctorInfo": doctorInfo?.toJson(),
        "tracking": tracking?.toJson(),
      };
}

class DoctorInfo extends DoctorInfoEntity {
  int? id;
  String? fullName;
  String? email;
  DateTime? dob;
  String? gender;
  String? uid;
  String? mobile;
  String? aadhar;
  String? status;
  String? active;
  DateTime? enteredDt;
  dynamic place;
  String? fcmToken;
  dynamic latitude;
  dynamic longitude;
  dynamic profilePicUrl;

  DoctorInfo({
    this.id,
    this.fullName,
    this.email,
    this.dob,
    this.gender,
    this.uid,
    this.mobile,
    this.aadhar,
    this.status,
    this.active,
    this.enteredDt,
    this.place,
    this.fcmToken,
    this.latitude,
    this.longitude,
    this.profilePicUrl,
  });

  factory DoctorInfo.fromJson(Map<String, dynamic> json) => DoctorInfo(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        dob: json["dob"] != null ? DateTime.tryParse(json["dob"]) : null,
        gender: json["gender"],
        uid: json["uid"],
        mobile: json["mobile"],
        aadhar: json["aadhar"],
        status: json["status"],
        active: json["active"],
        enteredDt: json["enteredDt"] != null
            ? DateTime.tryParse(json["enteredDt"])
            : null,
        place: json["place"],
        fcmToken: json["fcmToken"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        profilePicUrl: json["profilePicUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "dob": dob?.toIso8601String(),
        "gender": gender,
        "uid": uid,
        "mobile": mobile,
        "aadhar": aadhar,
        "status": status,
        "active": active,
        "enteredDt": enteredDt?.toIso8601String(),
        "place": place,
        "fcmToken": fcmToken,
        "latitude": latitude,
        "longitude": longitude,
        "profilePicUrl": profilePicUrl,
      };
}

class Tracking extends TrackingEntity {
  int? id;
  int? doctorId;
  String? deviceInfo;

  Tracking({
    this.id,
    this.doctorId,
    this.deviceInfo,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        id: json["id"],
        doctorId: json["doctorId"],
        deviceInfo: json["deviceInfo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorId": doctorId,
        "deviceInfo": deviceInfo,
      };
}
