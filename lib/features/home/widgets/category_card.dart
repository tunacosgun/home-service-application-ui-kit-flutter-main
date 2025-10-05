import 'package:flutter/material.dart';
import 'package:moto/core/models/category.dart';
import 'package:moto/core/theme/app_colors.dart';
import 'package:moto/core/theme/app_icons.dart';
import 'package:moto/core/theme/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  _getIconForCategory(category.name),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: AppTextStyles.body2,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'cleaning':
        return MotoIcons.cleaning;
      case 'plumbing':
        return MotoIcons.plumbing;
      case 'electrical':
        return MotoIcons.electrical;
      case 'painting':
        return MotoIcons.painting;
      case 'appliance repair':
        return MotoIcons.applianceRepair;
      case 'gardening':
        return MotoIcons.gardening;
      case 'carpentry':
        return MotoIcons.carpentry;
      case 'moving':
        return MotoIcons.moving;
      default:
        return MotoIcons.service;
    }
  }
}
