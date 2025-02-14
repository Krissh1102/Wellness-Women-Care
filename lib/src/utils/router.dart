import 'package:go_router/go_router.dart';
import 'package:wellnes/src/features/auth/views/forgot_pass.dart';
import 'package:wellnes/src/features/auth/views/login_screen.dart';
import 'package:wellnes/src/features/auth/views/otp_screen.dart';
import 'package:wellnes/src/features/auth/views/signup_screen.dart';
import 'package:wellnes/src/features/auth/welcomeScreen.dart';
import 'package:wellnes/src/features/screens/articleScreen.dart';
import 'package:wellnes/src/features/screens/homePage.dart';
import 'package:wellnes/src/features/screens/nearbyClinic/appointmentScreen.dart';
import 'package:wellnes/src/features/screens/nearbyClinic/clinicDetailScreen.dart';
import 'package:wellnes/src/features/screens/nearbyClinic/nearbyClinicScreen.dart';
import 'package:wellnes/src/features/screens/pharmacy/cartScreen.dart';
import 'package:wellnes/src/features/screens/pharmacy/pharmacyScreen.dart';
import 'package:wellnes/src/features/screens/profile/cancelAppointment.dart';
import 'package:wellnes/src/features/screens/profile/faqScreen.dart';
import 'package:wellnes/src/features/screens/profile/pastAppointment.dart';
import 'package:wellnes/src/features/screens/profile/payment/payment_method_screen.dart';
import 'package:wellnes/src/features/screens/profile/saved.dart';
import 'package:wellnes/src/features/screens/teleconsultation/doctor_details.dart';
import 'package:wellnes/src/features/screens/teleconsultation/teleconsultationScreen.dart';

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
      GoRoute(
        path: '/cart',
        builder: (context, state) => CartScreen(),
      ),
      GoRoute(
        path: '/article',
        builder: (context, state) => TopArticlesScreen(),
      ),
      GoRoute(
        path: '/clinic-details',
        builder: (context, state) => const ClinicDetailScreen(),
      ),
      GoRoute(
        path: '/appointment',
        builder: (context, state) => AppointmentScreen(),
      ),
      GoRoute(
        path: '/allappointment',
        builder: (context, state) => AllAppointmentsScreen(),
      ),
      GoRoute(
        path: '/cancelappointment',
        builder: (context, state) => CancelAppointmentScreen(),
      ),
      GoRoute(
        path: '/teleconsultation',
        builder: (context, state) => Teleconsultationscreen(),
      ),
      GoRoute(
        path: '/doctor-details',
        builder: (context, state) => DoctorDetailsScreen(),
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => PaymentMethodScreen(),
      ),
      GoRoute(
        path: '/saved',
        builder: (context, state) => MySavedScreen(),
      ),
      GoRoute(
        path: '/faq',
        builder: (context, state) => HelpCenterScreen(),
      ),
    ],
  );
}
