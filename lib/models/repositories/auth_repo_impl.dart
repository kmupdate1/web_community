import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_community/core/config/app_config.dart';
import 'package:web_community/domain/repositories/auth_repo.dart';
import 'package:web_community/domain/values/token.dart';
import 'package:web_community/domain/values/auth_values.dart';

String basePath = AppConfig.basePath;

class SignupRepoImpl implements SignupRepo {
  @override
  Future<http.Response> signup(
    Username username,
    Email email,
    Password password,
  ) async {
    try {
      final url = Uri.parse("$basePath/authentication/signup");
      return await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "X-Firebase-AppCheck": "",
        },
        body: jsonEncode({
          "username": username.toString(),
          "email": email.toString(),
          "password": password.toString(),
        }),
      );
    } catch (e) {
      rethrow;
    }
  }
}

class SigningRepoImpl implements SigningRepo {
  @override
  Future<http.Response> signing(Email email, Password password) async {
    try {
      final url = Uri.parse("$basePath/authentication/signing");
      return await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "X-Firebase-AppCheck": "",
        },
        body: jsonEncode({
          "email": email.toString(),
          "password": password.toString(),
        }),
      );
    } catch (e) {
      rethrow;
    }
  }
}

class VerifyRepoImpl implements VerifyRepo {
  @override
  Future<http.Response> verify(IdToken token) async {
    try {
      final url = Uri.parse("$basePath/authentication/verify");
      return await http.get(
        url,
        headers: {
          "Authorization": token.toString(),
          "X-Firebase-AppCheck": ""
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
