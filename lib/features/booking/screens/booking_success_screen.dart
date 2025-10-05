import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto/core/theme/app_colors.dart';
import 'package:moto/core/theme/app_text_styles.dart';
import 'package:moto/core/widgets/app_button.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Booking Successful!',
                  style: AppTextStyles.headline1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Your service has been booked successfully. Our professional will be at your door on the scheduled date and time.',
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.lightGrey),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(
                        'Booking ID',
                        '#BK12345',
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        'Date & Time',
                        'May 15, 2025 • 10:00 AM',
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        'Service',
                        'Standard Home Cleaning',
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        'Total Amount',
                        '\$120.00',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                AppButton(
                  text: 'View Booking Details',
                  onPressed: () {
                    // Navigate to booking details
                  },
                ),
                const SizedBox(height: 16),
                AppOutlinedButton(
                  text: 'Back to Home',
                  onPressed: () {
                    context.go('/');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body2.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.body1.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
