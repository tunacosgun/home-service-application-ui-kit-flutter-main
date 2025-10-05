import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto/core/theme/app_icons.dart';

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateIndexBasedOnLocation();
  }
  
  void _updateIndexBasedOnLocation() {
    final location = GoRouterState.of(context).matchedLocation;
    if (location == '/') {
      _currentIndex = 0;
    } else if (location == '/bookings') {
      _currentIndex = 1;
    } else if (location == '/profile') {
      _currentIndex = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          
          if (index == 0) {
            context.go('/');
          } else if (index == 1) {
            context.go('/bookings');
          } else if (index == 2) {
            context.go('/profile');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(MotoIcons.homeOutline),
            selectedIcon: Icon(MotoIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(MotoIcons.bookingOutline),
            selectedIcon: Icon(MotoIcons.booking),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(MotoIcons.profileOutline),
            selectedIcon: Icon(MotoIcons.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
