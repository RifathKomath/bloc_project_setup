class TreatmentCenterEntity {
  int? status;
  bool? success;
  String? message;
  List<CenterEntity>? data;

  TreatmentCenterEntity({
    this.status,
    this.success,
    this.message,
    this.data,
  });
}

class CenterEntity {
  int? id;
  String? hospitalName;
  int? hospitalTypeId;
  String? address;
  String? city;
  String? state;
  String? pincode;
  double? latitude;
  double? longitude;
  String? contactNumber;
  String? email;
  String? description;
  String? active;
  DateTime? createdAt;
  dynamic updatedAt;
  num? rating;
  num? patientsCount;
  String? hospitalTypeName;
    String? profilePicUrl;
  String? opStartTime;
  String? opEndTime;

  CenterEntity(
      {this.id,
      this.hospitalName,
      this.hospitalTypeId,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.latitude,
      this.longitude,
      this.contactNumber,
      this.email,
      this.description,
      this.active,
      this.hospitalTypeName,
      this.createdAt,
      this.updatedAt,
      this.patientsCount,
      this.opEndTime,
      this.opStartTime,
      this.profilePicUrl,
      this.rating});
}
