import 'package:e_commerce/models/product_item_model.dart';
import 'package:e_commerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;

  const ProductGridView({
    super.key,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive grid
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
              TextButton(onPressed: () {}, child: const Text('View All')),
            ],
          ),
        ),

        // Calculate crossAxisCount based on screen width
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getCrossAxisCount(screenWidth),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) => ProductItem(
            product: dummyProducts[index],
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
          itemCount: dummyProducts.length,
          shrinkWrap: true, // Important: Allows GridView to shrink-wrap content
          physics:
              const NeverScrollableScrollPhysics(), // Important: Prevents nested scrolling
        ),
      ],
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth > 900) return 4; // Large desktop
    if (screenWidth > 700) return 3; // Desktop
    if (screenWidth > 500) return 2; // Tablet
    return 2; // Mobile
  }
}
