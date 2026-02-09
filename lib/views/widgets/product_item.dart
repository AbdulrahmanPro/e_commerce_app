import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_item_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel product;
  final bool isDesktop;
  final bool isTablet;

  const ProductItem({
    super.key,
    required this.product,
    this.isDesktop = false,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    // final isLandscape =
    //     MediaQuery.of(context).orientation == Orientation.landscape;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isDesktop ? 12 : 8),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          isDesktop
              ? 10
              : isTablet
              ? 8
              : 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Container with fixed aspect ratio
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(isDesktop ? 6 : 4),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorWidget: (context, url, error) {
                        return Container(
                          color: Colors.grey[100],
                          child: Icon(
                            Icons.broken_image,
                            size: isDesktop
                                ? 32
                                : isTablet
                                ? 28
                                : 24,
                            color: Colors.grey[400],
                          ),
                        );
                      },
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                value: downloadProgress.progress,
                              ),
                            );
                          },
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(180),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: isDesktop
                            ? 18
                            : isTablet
                            ? 16
                            : 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6), // Reduced from 8
            // Product Name - More compact
            Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isDesktop
                    ? 13
                    : isTablet
                    ? 12
                    : 11, // Smaller font
                height: 1.1, // Tighter line height
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 2), // Reduced from 4
            // Category - More compact
            Text(
              product.category,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: isDesktop
                    ? 11
                    : isTablet
                    ? 10
                    : 9, // Smaller font
                height: 1.1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 6), // Reduced from 8
            // Price and Add to Cart Button - More compact
            SizedBox(
              height: isDesktop
                  ? 32
                  : isTablet
                  ? 30
                  : 28, // Fixed height for row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: isDesktop
                            ? 14
                            : isTablet
                            ? 13
                            : 12, // Smaller font
                        height: 1.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: isDesktop
                        ? 32
                        : isTablet
                        ? 30
                        : 28, // Smaller button
                    height: isDesktop
                        ? 32
                        : isTablet
                        ? 30
                        : 28,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(30),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Theme.of(context).colorScheme.primary,
                        size: isDesktop
                            ? 18
                            : isTablet
                            ? 16
                            : 14, // Smaller icon
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
