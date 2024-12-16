import 'package:go_router/go_router.dart';
import 'package:wellnes/src/features/auth/views/forgot_pass.dart';
import 'package:wellnes/src/features/auth/views/login_screen.dart';
import 'package:wellnes/src/features/auth/views/otp_screen.dart';
import 'package:wellnes/src/features/auth/views/signup_screen.dart';
import 'package:wellnes/src/features/auth/welcomeScreen.dart';
import 'package:wellnes/src/features/screens/homePage.dart';
import 'package:wellnes/src/features/screens/nearbyClinic/nearbyClinicScreen.dart';
import 'package:wellnes/src/features/screens/pharmacy/pharmacyScreen.dart';

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
      GoRoute(
        path: '/signup',
        builder: (context, state) => CreateAccountPage(),
      ),
      GoRoute(
        path: '/forgotPass',
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) => OTPVerificationPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/clinic',
        builder: (context, state) => NearbyClinicScreen(),
      ),
      GoRoute(
        path: '/pharmacy',
        builder: (context, state) => PharmacyScreen(),
      ),
    ],
  );
}
