import 'package:e_commerce/views/widgets/home_widgets/category.dart';
import 'package:e_commerce/views/widgets/home_widgets/product_grid_view.dart';
import 'package:e_commerce/views/widgets/home_widgets/slider_widget.dart';
import 'package:flutter/material.dart';

class HomeTabView extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;

  const HomeTabView({
    super.key,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 24.0 : 16.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SliderWidget(),
            const SizedBox(height: 24),
            Category(),
            const SizedBox(height: 16),
            ProductGridView(isDesktop: isDesktop, isTablet: isTablet),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
