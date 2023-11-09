import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mate/blocs/welcome_bloc/welcome_events.dart';
import 'package:home_mate/blocs/welcome_bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
  on<WelcomeEvent>((event,emit)=>emit(WelcomeState(index: state.index)));
  }
}