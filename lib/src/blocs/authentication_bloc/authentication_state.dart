part of 'authentication_bloc.dart';

enum AuthenticationMethod {
  STORED_TOKEN,
  LOGIN_SUBMISSION,
  IMPERSONATING,
}

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  impersonating
}

class AuthenticationState extends Equatable {
  const AuthenticationState({required this.status});

  const AuthenticationState._({required this.status});

  const AuthenticationState.unknown()
      : this._(status: AuthenticationStatus.unknown);

  //const AuthenticationState.authenticated({}) : this._()

  final AuthenticationStatus status;
  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[status];
}

class Permissions {
  static const List<String> roles = <String>[
    'doctor',
    'patient',
  ];

  // ignore: sort_constructors_first
  Permissions.fromRoles(List<String> roles) {
    // ignore: always_put_control_body_on_new_line
    if (roles == null) return;
    for (String role in roles) {
      switch (role) {
        case 'doctor':
          {}
          break;
        case 'patient':
          {}
          break;
      }
    }
  }
}
