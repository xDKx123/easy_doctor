import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnknown()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
      if (event is LoginSubmitted) {
        _onLoginSubmitted(event, emit);
      }
    });
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<AuthenticationState> emit) async {
    final Logger _logger = CustomLogger().getLogger();

    _logger.e("pride v tapravi event");

    emit(AuthenticationAuthenticated());
  }
}
