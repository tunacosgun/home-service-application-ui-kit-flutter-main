import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto/features/auth/screens/login_screen.dart';
import 'package:moto/features/auth/screens/register_screen.dart';
import 'package:moto/features/booking/screens/booking_screen.dart';
import 'package:moto/features/booking/screens/booking_success_screen.dart';
import 'package:moto/features/booking/screens/bookings_screen.dart';
import 'package:moto/features/home/screens/home_screen.dart';
import 'package:moto/features/home/screens/main_screen.dart';
import 'package:moto/features/notifications/screens/notifications_screen.dart';
import 'package:moto/features/profile/screens/profile_screen.dart';
import 'package:moto/features/service_category/screens/service_category_screen.dart';
import 'package:moto/features/service_details/screens/service_details_screen.dart';
import 'package:moto/features/settings/screens/settings_screen.dart';
import 'package:moto/features/service_reviews/screens/service_reviews_screen.dart';
import 'package:moto/features/service_provider/screens/service_provider_screen.dart';
import 'package:moto/features/address/screens/address_management_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      
      // Main shell route with bottom navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          // Home tab
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
          
          // Bookings tab
          GoRoute(
            path: '/bookings',
            name: 'bookings',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const BookingsScreen(),
            ),
          ),
          
          // Profile tab
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
      
      // Service category screen
      GoRoute(
        path: '/categories/:categoryId',
        name: 'serviceCategory',
        builder: (context, state) {
          final categoryId = state.pathParameters['categoryId'] as String;
          return ServiceCategoryScreen(categoryId: categoryId);
        },
      ),
      
      // Service detail screen
      GoRoute(
        path: '/services/:serviceId',
        name: 'serviceDetails',
        builder: (context, state) {
          final serviceId = state.pathParameters['serviceId'] as String;
          return ServiceDetailsScreen(serviceId: serviceId);
        },
      ),
      
      // Booking screens
      GoRoute(
        path: '/booking/:serviceId',
        name: 'booking',
        builder: (context, state) {
          final serviceId = state.pathParameters['serviceId'] as String;
          return BookingScreen(serviceId: serviceId);
        },
      ),
      GoRoute(
        path: '/booking-success',
        name: 'bookingSuccess',
        builder: (context, state) => const BookingSuccessScreen(),
      ),
      
      // Notifications screen
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      
      // Settings screen
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      
      // Service reviews screen
      GoRoute(
        path: '/services/:serviceId/reviews',
        name: 'serviceReviews',
        builder: (context, state) {
          final serviceId = state.pathParameters['serviceId'] as String;
          return ServiceReviewsScreen(serviceId: serviceId);
        },
      ),
      
      // Service provider screen
      GoRoute(
        path: '/providers/:providerId',
        name: 'serviceProvider',
        builder: (context, state) {
          final providerId = state.pathParameters['providerId'] as String;
          return ServiceProviderScreen(providerId: providerId);
        },
      ),
      
      // Address management screen
      GoRoute(
        path: '/addresses',
        name: 'addressManagement',
        builder: (context, state) => const AddressManagementScreen(),
      ),
    ],
  );
}
