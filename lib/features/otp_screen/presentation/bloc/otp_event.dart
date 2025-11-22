abstract class OtpEvent {}
class OtpChanged extends OtpEvent {
  final String otp;
  OtpChanged(this.otp);
}



class StartTimer extends OtpEvent {}

class Tick extends OtpEvent {
  final int secondsRemaining;
  Tick(this.secondsRemaining);
}

class ResendOtpPressed extends OtpEvent {
  final String phoneNumber;

  ResendOtpPressed({required this.phoneNumber});
}

class SendOtp extends OtpEvent {
  final String phoneNumber;
  SendOtp(this.phoneNumber);
}

class VerifyOtp extends OtpEvent {
  final String phoneNumber;
  final String otp;
  VerifyOtp({required this.phoneNumber, required this.otp});
}
class EnableResendOtp extends OtpEvent {}
class TimerStartedHandled extends OtpEvent {}
class OtpAutoFilled extends OtpEvent {
  final String otp;
  OtpAutoFilled(this.otp);
}