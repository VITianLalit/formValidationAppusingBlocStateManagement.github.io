part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState{
  final String uid;

  AuthSuccess(this.uid);
}

final class AuthFailure extends AuthState{
  final String error;
  AuthFailure({required this.error});
}