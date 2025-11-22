class UserRequest {
  final String fullName;
  final String email;
  final String gender;
  final String maritialStatus;
  final String bloodGroup;
  final String dob;
  final String mobile;
  final String place;
  final int doctorId;
  final bool isQrRegistered;

  UserRequest({
    required this.fullName,
    required this.email,
    required this.gender,
    required this.maritialStatus,
    required this.place,
    required this.bloodGroup,
    required this.dob,
    required this.mobile,
    required this.doctorId,
    required this.isQrRegistered
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'gender': gender,
      'place': place,
      'maritialStatus': maritialStatus,
      'bloodGroup': bloodGroup,
      'dob': dob,
      "mobile": mobile,
      'doctorId': doctorId,
      'isQrRegistered': isQrRegistered
    };
  }
}
