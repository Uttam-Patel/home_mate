import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mate/blocs/register_bloc/regester_events.dart';
import 'package:home_mate/blocs/register_bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  RegisterBloc():super(const RegisterState()){
    on<FNameEvent>(_fNameEvent);
    on<LNameEvent>(_lNameEvent);
    on<EmailEvent>(_emailEvent);
    on<FlagUserEvent>(_flagUserEvent);
    on<FlagProviderEvent>(_flagProviderEvent);
    on<ProviderTaglineEvent>(_providerTaglineEvent);
    on<ProviderDescriptionEvent>(_providerDescriptionEvent);
  }

  void _fNameEvent(FNameEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(fName: event.fName));
  }

  void _lNameEvent(LNameEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(lName: event.lName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(email: event.email));
  }

  void _flagUserEvent(FlagUserEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(flagUser: event.flagUser));
  }

  void _flagProviderEvent(FlagProviderEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(flagProvider: event.flagProvider));
  }

  void _providerTaglineEvent(ProviderTaglineEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(providerTagline: event.providerTagline));
  }

  void _providerDescriptionEvent(ProviderDescriptionEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(providerDescription: event.providerDescription));
  }
}