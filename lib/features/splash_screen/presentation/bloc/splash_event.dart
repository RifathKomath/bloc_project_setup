abstract class SplashEvent {}

class StartSplashTimer extends SplashEvent {}
class GetUser extends SplashEvent {}

class StartQRCodeScan extends SplashEvent {
  final String qrData;
  final String deviceId;

  StartQRCodeScan(this.qrData,this.deviceId);
}

class QrSubmit extends SplashEvent {
  final String doctorId;

  QrSubmit({required this.doctorId});
}

