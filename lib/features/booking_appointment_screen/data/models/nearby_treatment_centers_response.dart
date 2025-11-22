import '../../domain/entity/center_listing_enitity.dart';

class GetTreatmentCentersResponse extends TreatmentCenterEntity {
  final int? status;
  final bool? success;
  final String? message;
  final List<TreatmentCenterDatum>? data;

  GetTreatmentCentersResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory GetTreatmentCentersResponse.fromJson(Map<String, dynamic> json) {
    return GetTreatmentCentersResponse(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? List<TreatmentCenterDatum>.from(
              json['data'].map((x) => TreatmentCenterDatum.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'message': message,
        'data': data?.map((x) => x.toJson()).toList(),
      };
}

class TreatmentCenterDatum extends CenterEntity {
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

  TreatmentCenterDatum(
      {this.id,
      this.hospitalName,
      this.hospitalTypeId,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.latitude,
      this.hospitalTypeName,
      this.longitude,
      this.contactNumber,
      this.email,
      this.description,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.opEndTime,
      this.opStartTime,
      this.profilePicUrl,
      this.patientsCount,
      this.rating});

  factory TreatmentCenterDatum.fromJson(Map<String, dynamic> json) {
    return TreatmentCenterDatum(
        id: json['id'],
        hospitalName: json['hospitalName'],
        hospitalTypeId: json['hospitalTypeId'],
        address: json['address'],
        city: json['city'],
        state: json['state'],
        pincode: json['pincode'],
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        contactNumber: json['contactNumber'],
        email: json['email'],
        description: json['description'],
        active: json['active'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'],
        patientsCount: json['patientsCount'],
        hospitalTypeName: json['hospitalTypeName'],
        profilePicUrl: json['profilePicUrl'],
        opEndTime: json['opEndTime'],
        opStartTime: json['opStartTime'],
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'hospitalName': hospitalName,
        'hospitalTypeId': hospitalTypeId,
        'address': address,
        'city': city,
        'state': state,
        'pincode': pincode,
        'latitude': latitude,
        'longitude': longitude,
        'contactNumber': contactNumber,
        'email': email,
        'description': description,
        'hospitalTypeName': hospitalTypeName,
        'profilePicUrl':profilePicUrl,
        'opEndTime':opEndTime,
        'opStartTime':opStartTime,
        'active': active,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt,
        'patientsCount': patientsCount,
        'rating': rating
      };
}
