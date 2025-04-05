import 'package:http/http.dart';
import 'package:web_community/domain/repositories/auth_repo.dart';
import 'package:web_community/domain/values/auth_values.dart';
import 'package:web_community/domain/values/token.dart';

class SignupUsecase {
  final AuthRepo _repo;

  Future<Response?> execute(
    String rawUsername,
    String rawEmail,
    String rawPassword,
  ) async {
    try {
      return await _repo.signup(
        Username(rawUsername),
        Email(rawEmail),
        Password(rawPassword),
      );
    } catch (e) {
      return null;
    }
  }

  SignupUsecase(AuthRepo repo) : _repo = repo;
}

class SigningUsecase {
  final AuthRepo _repo;

  Future<Response?> execute(String rawEmail, String rawPassword) async {
    try {
      return await _repo.signing(Email(rawEmail), Password(rawPassword));
    } catch (e) {
      return null;
    }
  }

  SigningUsecase(AuthRepo repo) : _repo = repo;
}

class VerifyUsecase {
  final AuthRepo _repo;

  Future<Response?> execute(String rawToken) async {
    try {
      return await _repo.verify(IdToken(rawToken));
    } catch (e) {
      return null;
    }
  }

  VerifyUsecase(AuthRepo repo) : _repo = repo;
}
