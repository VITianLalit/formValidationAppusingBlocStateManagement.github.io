import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      try{
        final email = event.email;
        final password = event.password;

        if (password.length < 6) {
          return emit(
              AuthFailure(error: ("Paasowrd can't be less than 6 Character")));
        }
        await Future.delayed(Duration(seconds: 1), () {
          return emit(AuthSuccess('$email-$password'));
        });
      } catch(e){
        return emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
