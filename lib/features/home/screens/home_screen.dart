import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto/core/models/category.dart';
import 'package:moto/core/models/service.dart';
import 'package:moto/core/theme/app_colors.dart';
import 'package:moto/core/theme/app_icons.dart';
import 'package:moto/core/theme/app_text_styles.dart';
import 'package:moto/core/widgets/app_text_field.dart';
import 'package:moto/features/home/widgets/category_card.dart';
import 'package:moto/features/home/widgets/featured_service_card.dart';
import 'package:moto/features/home/widgets/popular_service_card.dart';
import 'package:moto/features/home/widgets/promo_card.dart';
import 'package:moto/features/home/widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: true,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    radius: 20,
                    child: const Icon(
                      MotoIcons.location,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Location',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const Text(
                          'Tehran, Iran',
                          style: AppTextStyles.body2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Badge(
                    child: Icon(MotoIcons.notificationsOutline),
                  ),
                  onPressed: () {
                    context.push('/notifications');
                  },
                ),
              ],
            ),
            
            // Main content
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome message
                    const Text(
                      'Hello, Mohammad',
                      style: AppTextStyles.headline2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Find the services you need',
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Search bar
                    AppSearchField(
                      controller: _searchController,
                      hint: 'Search for services...',
                      onChanged: (value) {
                        // Handle search
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Promotions
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      PromoCard(
                        title: 'Special Offer',
                        subtitle: '25% Off First Booking',
                        icon: MotoIcons.favoriteOutline,
                        onTap: () {},
                        backgroundColor: AppColors.primary,
                      ),
                      PromoCard(
                        title: 'Quick Service',
                        subtitle: 'Book a service within 2 hours',
                        icon: MotoIcons.timeOutline,
                        backgroundColor: Colors.indigo,
                        onTap: () {},
                      ),
                      PromoCard(
                        title: 'Membership',
                        subtitle: 'Get exclusive benefits',
                        icon: MotoIcons.walletOutline,
                        backgroundColor: Colors.amber.shade800,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Categories
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Categories',
                  onSeeAll: () {
                    // Navigate to all categories
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: demoCategories.length,
                  itemBuilder: (context, index) {
                    final category = demoCategories[index];
                    return CategoryCard(
                      category: category,
                      onTap: () {
                        context.push('/categories/${category.id}');
                      },
                    );
                  },
                ),
              ),
            ),

            // Featured Services
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Featured Services',
                  onSeeAll: () {
                    // Navigate to all featured services
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: demoServices.where((s) => s.isFeatured).length,
                  itemBuilder: (context, index) {
                    final service = demoServices
                        .where((s) => s.isFeatured)
                        .toList()[index];
                    return FeaturedServiceCard(
                      service: service,
                      onTap: () {
                        context.push('/services/${service.id}');
                      },
                    );
                  },
                ),
              ),
            ),

            // Popular Services
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Popular Services',
                  onSeeAll: () {
                    // Navigate to all popular services
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final service = demoServices
                        .where((s) => s.isPopular)
                        .toList()[index];
                    return PopularServiceCard(
                      service: service,
                      onTap: () {
                        context.push('/services/${service.id}');
                      },
                    );
                  },
                  childCount: demoServices.where((s) => s.isPopular).length,
                ),
              ),
            ),

            // Bottom padding
            const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
          ],
        ),
      ),
    );
  }
}
