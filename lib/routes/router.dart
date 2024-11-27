import 'package:go_router/go_router.dart';
import 'package:wellnes/screens/Auth/login_screen.dart';
import 'package:wellnes/screens/Auth/welcomeScreen.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
  initialLocation: '/welcome',
    routes: [
       GoRoute(
        path: '/welcome',
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
    ],
  );
}
