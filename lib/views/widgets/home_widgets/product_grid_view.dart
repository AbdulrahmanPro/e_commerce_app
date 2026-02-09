
import 'package:e_commerce/view_model/cubit/home_cubit_cubit.dart';
import 'package:e_commerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // احصل على عرض الشاشة للشبكة المتجاوبة
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Builder(
        // أضف ويدجت Builder هنا
        builder: (blocContext) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المنتجات المميزة',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('عرض الكل')),
                  ],
                ),
              ),

              // حساب crossAxisCount بناءً على عرض الشاشة
              BlocBuilder<HomeCubit, HomeCubitState>(
                bloc: BlocProvider.of<HomeCubit>(
                  blocContext,
                ), // استخدم blocContext هنا
                builder: (context, state) {
                  if (state is HomeCubitLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is HomeCubitFailure) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          state.errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  } else if (state is HomeCubitLoaded) {
                    final products = state.products;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _getCrossAxisCount(screenWidth),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) => ProductItem(
                        product: products[index],
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                      itemCount: products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth > 900) return 4; // سطح مكتب كبير
    if (screenWidth > 700) return 3; // سطح مكتب
    if (screenWidth > 500) return 2; // لوحي
    return 2; // جوال
  }
}
