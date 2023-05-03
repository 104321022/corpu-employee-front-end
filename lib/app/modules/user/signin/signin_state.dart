part of 'signin_cubit.dart';

enum SignInStatus {
  signInLoading,
  loaded,
}

class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.loaded,
    this.authStatus = AuthStatus.none,
    this.authMessage = '',
  });

  final SignInStatus status;
  final AuthStatus authStatus;
  final String authMessage;

  SignInState copyWith({
    SignInStatus? status,
    AuthStatus? authStatus,
    String? authMessage,
  }) {
    return SignInState(
      status: status ?? this.status,
      authStatus: authStatus ?? this.authStatus,
      authMessage: authMessage ?? this.authMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        authStatus,
        authMessage,
      ];
}
