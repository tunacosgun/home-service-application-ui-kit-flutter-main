import 'package:flutter/material.dart';
import 'package:moto/core/theme/app_colors.dart';
import 'package:moto/core/theme/app_text_styles.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        backgroundColor: AppColors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today,
              size: 64,
              color: AppColors.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No bookings yet',
              style: AppTextStyles.headline3,
            ),
            const SizedBox(height: 8),
            Text(
              'Your bookings will appear here',
              style: AppTextStyles.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
