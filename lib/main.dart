import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:web_community/services/factory_service.dart';
import 'package:web_community/presentation/routes.dart';

void main() {
  final GoRouter router = Routes.router;
  final signupViewModel = SignupViewModelFactory.getInstance();
  final signingViewModel = SigningViewModelFactory.getInstance();
  final verifyViewModel = VerifyViewModelFactory.getInstance();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => signupViewModel),
        ChangeNotifierProvider(create: (_) => signingViewModel),
        ChangeNotifierProvider(create: (_) => verifyViewModel),
      ],
      child: App(router: router),
    ),
  );
}

class App extends StatelessWidget {
  final GoRouter router;

  const App({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "Flutter with GoRouter",
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
