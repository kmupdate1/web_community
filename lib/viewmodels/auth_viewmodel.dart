import 'dart:convert';
import 'package:flutter/material.dart';
import '../core/validators.dart';
import 'package:web_community/domain/usecase/auth_usecase.dart';
import 'package:web_community/domain/usecase/cache_token_usecase.dart';

abstract class AuthViewModel extends ChangeNotifier {
  // Gloval properties
  bool isLoading = false;
  String responseMsg = "";

  // Global methods
  String? validateUsername(String? value) => Validators.validateUsername(value);
  String? validateEmail(String? value) => Validators.validateEmail(value);
  String? validatePassword(String? value) => Validators.validatePassword(value);
}

class SignupViewModel extends AuthViewModel {
  final SignupUsecase _signupUsecase;

  Future<bool> signup(String username, String email, String password) async {
    isLoading = true;
    notifyListeners();

    final response = await _signupUsecase.execute(username, email, password);
    isLoading = false;

    if (response != null) {
      responseMsg = jsonDecode(response.body)["message"];
      notifyListeners();
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  SignupViewModel(SignupUsecase signupUsecase) : _signupUsecase = signupUsecase;
}

class SigningViewModel extends AuthViewModel {
  final SigningUsecase _signingUsecase;
  final SaveIdTokenUsecase _saveIdTokenUsecase;

  Future<bool> signing(String email, String password) async {
    isLoading = true;
    notifyListeners();

    final response = await _signingUsecase.execute(email, password);
    isLoading = false;

    if (response != null) {
      responseMsg = jsonDecode(response.body)["message"];
      notifyListeners();
      if (response.statusCode == 200) {
        final isSaved = await _saveIdTokenUsecase.execute(
          response.headers["Authorization"]!,
        );
        if (isSaved) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  SigningViewModel({
    required SigningUsecase signingUsecase,
    required SaveIdTokenUsecase saveIdTokenUsecase,
  }) : _saveIdTokenUsecase = saveIdTokenUsecase,
       _signingUsecase = signingUsecase;
}

class VerifyViewModel extends ChangeNotifier {
  final VerifyUsecase _verifyUsecase;

  bool isLoading = false;
  String responseMsg = "";

  Future<bool> verifyIdToken(String token) async {
    isLoading = true;
    notifyListeners();

    final response = await _verifyUsecase.execute(token);
    isLoading = false;

    if (response != null) {
      responseMsg = jsonDecode(response.body)["message"];
      notifyListeners();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  VerifyViewModel(VerifyUsecase verifyViewmodel)
    : _verifyUsecase = verifyViewmodel;
}
