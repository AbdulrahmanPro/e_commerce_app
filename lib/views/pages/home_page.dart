import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/views/pages/category_tab_view.dart';
import 'package:e_commerce/views/pages/home_tab_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        actions: [
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 24.0 : 16.0,
              vertical: 16.0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: isDesktop
                      ? 28
                      : isTablet
                      ? 26
                      : 24,
                  backgroundImage: const CachedNetworkImageProvider(
                    'https://avatars.githubusercontent.com/u/175641545?s=200&v=4',
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
              ],
            ),
          ),

          // TabBar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 24.0 : 16.0),
            child: TabBar(
              tabs: const [
                Tab(text: 'Home'),
                Tab(text: 'Categories'),
              ],
              controller: _tabController,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: Theme.of(context).colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontSize: isDesktop ? 16 : 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: isDesktop ? 16 : 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // TabBarView (Takes remaining space)
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomeTabView(isDesktop: isDesktop, isTablet: isTablet),
                CategoryTabView(isDesktop: isDesktop, isTablet: isTablet),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
