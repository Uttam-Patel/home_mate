class AuthState{
  final String number;
  final String otp;
  final String receivedID;
  final bool flag;
  const AuthState({this.number="",this.otp="",this.receivedID="",this.flag=false});

  AuthState copyWith({String? number,String? otp,String? receivedID,bool? flag}){
    return AuthState(
      number: number??this.number,
      otp: otp??this.otp,
      receivedID: receivedID??this.receivedID,
      flag: flag??this.flag
    );
  }
}