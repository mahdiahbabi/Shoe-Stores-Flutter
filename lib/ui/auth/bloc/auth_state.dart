part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState(this.isLoginMode);

  final bool isLoginMode;

  @override
  List<Object> get props => [isLoginMode];
}

class AuthInitial extends AuthState {
  const AuthInitial(bool isLoginMode) : super(isLoginMode);
}

class AuthError extends AuthState {
  final AppException exception;
  const AuthError(bool isLoginMode, this.exception) : super(isLoginMode);
}

class AuthLoading extends AuthState{
  const AuthLoading(bool isLoginMode) : super(isLoginMode);

}

class AuthSuccess extends AuthState {
  const AuthSuccess(bool isLoginMode) : super(isLoginMode);
}
