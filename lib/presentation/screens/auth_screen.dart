import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:web_community/viewmodels/auth_viewmodel.dart';
import 'package:web_community/core/config/app_config.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _forKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupViewmodel = Provider.of<SignupViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("SIGNUP")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _forKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(hintText: "Username"),
                    validator: signupViewmodel.validateUsername,
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: signupViewmodel.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                    validator: signupViewmodel.validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20),
                  signupViewmodel.isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: () async {
                          if (_forKey.currentState!.validate()) {
                            bool isSuccess = await signupViewmodel.signup(
                              usernameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                            if (isSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(signupViewmodel.responseMsg),
                                ),
                              );
                            } else {
                              // 留まる
                            }
                          }
                        },
                        child: Text("Signup"),
                      ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "Already have an account? ",
                style: const TextStyle(fontSize: 15),
                children: [
                  TextSpan(
                    text: "Signing",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            context.go(
                              "${AppConfig.basePath}/authentication/signing/form",
                            );
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SigningScreen extends StatelessWidget {
  SigningScreen({super.key});

  final _forKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final singingViewmodel = Provider.of<SigningViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("SIGNING")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _forKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: singingViewmodel.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                    validator: singingViewmodel.validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20),
                  singingViewmodel.isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: () async {
                          if (_forKey.currentState!.validate()) {
                            bool isSuccess = await singingViewmodel.signing(
                              emailController.text,
                              passwordController.text,
                            );
                            if (isSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(singingViewmodel.responseMsg),
                                ),
                              );
                            }
                          }
                        },
                        child: Text("Signing"),
                      ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(fontSize: 15),
                children: [
                  TextSpan(
                    text: "Signup",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            context.go(
                              "${AppConfig.basePath}/authentication/signup/form",
                            );
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
