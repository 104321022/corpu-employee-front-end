part of 'signup_cubit.dart';

enum SignUpStatus {
  signUpLoading,
  loaded,
}

class SignUpState extends Equatable {
  const SignUpState({
    this.status = SignUpStatus.loaded,
    this.authStatus = AuthStatus.none,
    this.authMessage = '',
    this.obscurePassword = true,
  });

  final SignUpStatus status;
  final AuthStatus authStatus;
  final String authMessage;
  final bool obscurePassword;

  SignUpState copyWith({
    SignUpStatus? status,
    AuthStatus? authStatus,
    String? authMessage,
    bool? obscurePassword,
  }) {
    return SignUpState(
      status: status ?? this.status,
      authStatus: authStatus ?? this.authStatus,
      authMessage: authMessage ?? this.authMessage,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  @override
  List<Object?> get props => [
        status,
        authStatus,
        authMessage,
        obscurePassword,
      ];
}
