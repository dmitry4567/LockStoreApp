part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterAuth extends RegisterEvent {
  final String email;
  final String password;

  const RegisterAuth(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
