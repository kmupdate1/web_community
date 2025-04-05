import 'package:go_router/go_router.dart';
import 'package:web_community/core/config/app_config.dart';
import 'package:web_community/presentation/screens/auth_screen.dart';

class Routes {
	static String basePath = AppConfig.basePath;
	static String initialLocation = "$basePath/authentication/signing/form";
	static GoRouter router = GoRouter(
		initialLocation: initialLocation,
		routes: [
			GoRoute(
				path: "$basePath/authentication/signup/form",
				builder: (context, state) => SignupScreen(),
			),
			GoRoute(
				path: initialLocation,
				builder: (context, state) => SigningScreen(),
			),
		],
	);
}
