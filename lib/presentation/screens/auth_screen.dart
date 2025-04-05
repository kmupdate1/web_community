import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:web_community/viewmodels/auth_viewmodel.dart';
import 'package:web_community/core/config/app_config.dart';

class SignupScreen extends StatelessWidget {
  final _forKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);

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
                    validator: signupViewModel.validateUsername,
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: signupViewModel.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                    validator: signupViewModel.validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20),
                  signupViewModel.isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: () async {
                          if (_forKey.currentState!.validate()) {
                            bool isSuccess = await signupViewModel.signup(
                              usernameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                            if (isSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(signupViewModel.responseMsg),
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

  SignupScreen({super.key});
}

class SigningScreen extends StatelessWidget {
  final _forKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final singingViewModel = Provider.of<SigningViewModel>(context);
    final verifyViewModel = Provider.of<VerifyViewModel>(context);

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
                    validator: singingViewModel.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                    validator: singingViewModel.validatePassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20),
                  singingViewModel.isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: () async {
                          if (_forKey.currentState!.validate()) {
                            bool isSuccess = await singingViewModel.signing(
                              emailController.text,
                              passwordController.text,
                            );
                            if (isSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(singingViewModel.responseMsg),
                                ),
                              );
                              bool isVerify =
                                  await verifyViewModel.verifyIdToken();
                              if (isVerify) {
                                context.go("${AppConfig.basePath}/talkroom/home");
                              }
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

  SigningScreen({super.key});
}

class SignoutScreen extends StatelessWidget {
  final _forKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample Signout")),
      body: Padding(padding: EdgeInsets.all(16.0), child: Column(children: [
          ],
        )),
    );
  }
}
