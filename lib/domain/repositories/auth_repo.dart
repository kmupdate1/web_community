import 'package:http/http.dart' as http;
import 'package:web_community/domain/values/token.dart';
import 'package:web_community/domain/values/auth_values.dart';

abstract class SignupRepo {
  Future<http.Response> signup(Username username, Email email, Password password);
}

abstract class SigningRepo {
  Future<http.Response> signing(Email email, Password password);
}

abstract class VerifyRepo {
  Future<http.Response> verify(IdToken token);
}
