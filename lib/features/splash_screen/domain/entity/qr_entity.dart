class QrTrackingResponseEntity {
  final int? status;
  final bool? success;
  final String? message;
  final DataEntity? data;

  QrTrackingResponseEntity({
    this.status,
    this.success,
    this.message,
    this.data,
  });
}

class DataEntity {
  final DoctorInfoEntity? doctorInfo;
  final TrackingEntity? tracking;

  DataEntity({
    this.doctorInfo,
    this.tracking,
  });
}

class DoctorInfoEntity {
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
  final DateTime? enteredDt;
  final dynamic place;
  final String? fcmToken;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic profilePicUrl;

  DoctorInfoEntity({
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
}

class TrackingEntity {
  final int? id;
  final int? doctorId;
  final String? deviceInfo;

  TrackingEntity({
    this.id,
    this.doctorId,
    this.deviceInfo,
  });
}
