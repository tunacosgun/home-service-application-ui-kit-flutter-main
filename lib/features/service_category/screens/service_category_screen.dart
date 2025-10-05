import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto/core/models/category.dart';
import 'package:moto/core/models/service.dart';
import 'package:moto/core/theme/app_colors.dart';
import 'package:moto/core/theme/app_text_styles.dart';
import 'package:moto/core/widgets/app_text_field.dart';
import 'package:moto/features/home/widgets/popular_service_card.dart';

class ServiceCategoryScreen extends StatefulWidget {
  final String categoryId;

  const ServiceCategoryScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<ServiceCategoryScreen> createState() => _ServiceCategoryScreenState();
}

class _ServiceCategoryScreenState extends State<ServiceCategoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _sortBy = 'popularity';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // In a real app, you'd fetch these from an API
    final category = demoCategories.firstWhere((c) => c.id == widget.categoryId);
    final services = demoServices.where((s) => s.categoryId == widget.categoryId).toList();
    
    // Sort services
    if (_sortBy == 'price_low') {
      services.sort((a, b) => a.price.compareTo(b.price));
    } else if (_sortBy == 'price_high') {
      services.sort((a, b) => b.price.compareTo(a.price));
    } else if (_sortBy == 'rating') {
      services.sort((a, b) => b.rating.compareTo(a.rating));
    } else {
      services.sort((a, b) => b.bookingCount.compareTo(a.bookingCount));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: AppSearchField(
              controller: _searchController,
              hint: 'Search ${category.name} services...',
              onChanged: (value) {
                // Handle search
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Sort options
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.white,
            child: Row(
              children: [
                Text(
                  'Sort By:',
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 12),
                _buildSortChip('popularity', 'Popular'),
                const SizedBox(width: 8),
                _buildSortChip('rating', 'Top Rated'),
                const SizedBox(width: 8),
                _buildSortChip('price_low', 'Price: Low to High'),
                const SizedBox(width: 8),
                _buildSortChip('price_high', 'Price: High to Low'),
              ],
            ),
          ),
          
          // Service list
          Expanded(
            child: services.isEmpty
                ? const Center(
                    child: Text('No services available'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return PopularServiceCard(
                        service: service,
                        onTap: () {
                          context.push('/services/${service.id}');
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortChip(String value, String label) {
    final isSelected = _sortBy == value;
    
    return InkWell(
      onTap: () {
        setState(() {
          _sortBy = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: AppTextStyles.chip.copyWith(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
