import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto/core/models/review.dart';
import 'package:moto/core/models/service.dart';
import 'package:moto/core/theme/app_colors.dart';
import 'package:moto/core/theme/app_text_styles.dart';
import 'package:moto/core/utils/image_helper.dart';
import 'package:moto/core/widgets/app_button.dart';
import 'package:moto/features/service_details/widgets/review_card.dart';
import 'package:moto/features/service_details/widgets/service_image_carousel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final String serviceId;

  const ServiceDetailsScreen({
    Key? key,
    required this.serviceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In a real app, you'd fetch this from an API
    final service = demoServices.firstWhere((s) => s.id == serviceId);
    final reviews = demoReviews.where((r) => r.serviceId == serviceId).toList();
    
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          // Content
          CustomScrollView(
            slivers: [
              // App Bar with Image Carousel
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: ServiceImageCarousel(images: service.images),
                ),
              ),

              // Service Details
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Service Name & Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              service.name,
                              style: AppTextStyles.headline2,
                            ),
                          ),
                          Text(
                            '\$${service.price}',
                            style: AppTextStyles.headline2.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Rating
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: service.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 18,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${service.rating} (${service.reviewCount} reviews)',
                            style: AppTextStyles.body2,
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      const Divider(),
                      
                      const SizedBox(height: 16),
                      
                      // Description
                      const Text(
                        'Description',
                        style: AppTextStyles.headline3,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        service.description,
                        style: AppTextStyles.body1,
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Features
                      const Text(
                        'What\'s Included',
                        style: AppTextStyles.headline3,
                      ),
                      const SizedBox(height: 12),
                      ...service.features.map((feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.success,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                feature,
                                style: AppTextStyles.body1,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              
              // Reviews Section
              // Provider Section
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Service Provider',
                        style: AppTextStyles.headline3,
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          // Navigate to provider details
                          // Using a dummy provider ID since we don't have it in the service model
                          context.push('/providers/1');
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ImageHelper.loadNetworkImage(
                                imageUrl: 'https://images.unsplash.com/photo-1607346256330-dee7af15f7c5',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                placeholder: Container(
                                  color: AppColors.lightGrey,
                                  width: 60,
                                  height: 60,
                                ),
                                errorWidget: Container(
                                  color: AppColors.lightGrey,
                                  width: 60,
                                  height: 60,
                                  child: const Icon(Icons.business, color: AppColors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'ServicePro Solutions',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        '4.9',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ' (256 reviews)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Reviews Section
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Reviews',
                            style: AppTextStyles.headline3,
                          ),
                          TextButton(
                            onPressed: () {
                              context.push('/services/$serviceId/reviews');
                            },
                            child: Text(
                              'See All',
                              style: AppTextStyles.body2.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Show first 3 reviews
                      ...reviews.take(3).map((review) => ReviewCard(review: review)),
                    ],
                  ),
                ),
              ),
              
              // Bottom space for button
              const SliverToBoxAdapter(
                child: SizedBox(height: 80),
              ),
            ],
          ),
          
          // Bottom Book Now button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: AppButton(
                text: 'Book Now',
                onPressed: () {
                  context.push('/booking/${service.id}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
