import '../../domain/entity/qr_entity.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class NavigateToOnboarding extends SplashState {}

class NavigateToBase extends SplashState{}

class QRCodeScanSuccess extends SplashState {
  final String data;

  QRCodeScanSuccess(this.data);
}

class QRCodeScanFailed extends SplashState {
  final String error;

  QRCodeScanFailed(this.error);
}

class SplashLoaded extends SplashState {
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;
  final QrTrackingResponseEntity? qrData;

  SplashLoaded({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.qrData,
  });

  SplashLoaded copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
    QrTrackingResponseEntity? qrData,
  }) {
    return SplashLoaded(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      qrData: qrData ?? this.qrData,
    );
  }
}
