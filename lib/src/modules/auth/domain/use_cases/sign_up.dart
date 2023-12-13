import 'package:smatrackx/core.dart';

class SignUp extends FutureUseCaseWithParams<void, SignUpParams> {
  const SignUp(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(SignUpParams params) => _repo.signUp(
        email: params.email,
        password: params.password,
        fullName: params.username,
        companyId: params.companyId,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.username,
    required this.companyId,
  });

  const SignUpParams.empty()
      : this(email: '', password: '', username: '', companyId: '');

  final String email;
  final String password;
  final String username;
  final String companyId;

  @override
  List<String> get props => [email, password, username, companyId];
}
