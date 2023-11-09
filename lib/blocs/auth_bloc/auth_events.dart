abstract class AuthEvent{
  AuthEvent();
}

class NumberEvent extends AuthEvent{
  final String number;
  NumberEvent(this.number);
}

class OtpEvent extends AuthEvent{
  final String otp;
  OtpEvent(this.otp);
}

class ReceivedIDEvent extends AuthEvent{
  final String receivedID;
  ReceivedIDEvent(this.receivedID);
}

class FlagEvent extends AuthEvent{
  final bool flag;
  FlagEvent(this.flag);
}