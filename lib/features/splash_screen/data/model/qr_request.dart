class QrRequest {
  final String doctorId;
  final String deviceInfo;

  QrRequest({required this.deviceInfo, required this.doctorId});
  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'deviceInfo': deviceInfo,
    };
  }
}
