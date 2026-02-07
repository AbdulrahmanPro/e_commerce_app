import 'package:e_commerce/models/product_item_model.dart';
import 'package:e_commerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;
    final isTablet = screenWidth > 400 && screenWidth <= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        centerTitle: true,
        elevation: 0,
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 24.0 : 16.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section - Fixed layout
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: isDesktop
                          ? 28
                          : isTablet
                          ? 26
                          : 24,
                      backgroundImage: const NetworkImage(
                        'https://avatars.githubusercontent.com/u/175641545?s=200&v=4', // Larger image URL
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back,',
                            style: TextStyle(
                              fontSize: isDesktop ? 15 : 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            'Abdulrhman Al-Dharfi',
                            style: TextStyle(
                              fontSize: isDesktop ? 18 : 16,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Categories Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text('See All')),
                ],
              ),

              const SizedBox(height: 16),

              // Products Grid
              // In your home_page.dart, adjust the grid parameters:
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = _getCrossAxisCount(
                      isDesktop,
                      isTablet,
                      constraints.maxWidth,
                    );

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 12, // Reduced from 16
                        crossAxisSpacing: 12, // Reduced from 16
                        childAspectRatio:
                            0.65, // Reduced from 0.7 for more compact
                      ),
                      itemBuilder: (context, index) => ProductItem(
                        product: dummyProducts[index],
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                      itemCount: dummyProducts.length,
                      padding: const EdgeInsets.only(bottom: 16),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(bool isDesktop, bool isTablet, double maxWidth) {
    if (isDesktop) {
      if (maxWidth > 900) return 4;
      if (maxWidth > 700) return 3;
      return 2;
    } else if (isTablet) {
      if (maxWidth > 500) return 2;
      return 2;
    } else {
      return 2;
    }
  }
}
