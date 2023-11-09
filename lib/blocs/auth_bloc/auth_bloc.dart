import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mate/blocs/auth_bloc/auth_events.dart';
import 'package:home_mate/blocs/auth_bloc/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(const AuthState()){
    on<NumberEvent>(_numberEvent);
    on<OtpEvent>(_otpEvent);
    on<ReceivedIDEvent>(_receivedIDEvent);
    on<FlagEvent>(_flagEnvent);
  }

  void _numberEvent(NumberEvent event,Emitter<AuthState> emit){
    emit(state.copyWith(number: event.number));
  }

  void _otpEvent(OtpEvent event,Emitter<AuthState> emit){
    emit(state.copyWith(otp: event.otp));
  }

  void _receivedIDEvent(ReceivedIDEvent event,Emitter<AuthState> emit){
    emit(state.copyWith(receivedID: event.receivedID));
  }

  void _flagEnvent(FlagEvent event,Emitter<AuthState> emit){
    emit(state.copyWith(flag: event.flag));
  }
}