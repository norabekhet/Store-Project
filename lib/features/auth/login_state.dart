abstract class LoginState {}

class loginInitial extends LoginState {}

class loginLoading extends LoginState {}

class loginSuccess extends LoginState {}

class loginFailure extends LoginState {
  final String msg;
  loginFailure(this.msg);
}
