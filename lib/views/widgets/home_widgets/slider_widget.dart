import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/home_slider_item_model.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final PageController _sliderController = PageController();

  int _currentSliderIndex = 0;

  @override
  void initState() {
    super.initState();
    // Auto-slide functionality
    _startAutoSlide();
  }

  @override
  void dispose() {
    _sliderController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 5), () {
      if (_sliderController.hasClients && mounted) {
        final nextPage = (_currentSliderIndex + 1) % dummySliderItems.length;
        _sliderController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;
    final isTablet = screenWidth > 400 && screenWidth <= 600;

    final sliderHeight = isDesktop
        ? 200.0
        : isTablet
        ? 180.0
        : 160.0;

    return // Slider/Carousel Section
    Container(
      height: sliderHeight,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          // PageView for sliding
          PageView.builder(
            controller: _sliderController,
            itemCount: dummySliderItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentSliderIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle slider tap
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        dummySliderItems[index].imageUrl,
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withAlpha(50),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(isDesktop ? 24 : 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.black.withAlpha(150),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummySliderItems[index].title,
                          style: TextStyle(
                            fontSize: isDesktop
                                ? 24
                                : isTablet
                                ? 22
                                : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dummySliderItems[index].description,
                          style: TextStyle(
                            fontSize: isDesktop
                                ? 16
                                : isTablet
                                ? 14
                                : 12,
                            color: Colors.white.withAlpha(230),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 20 : 16,
                              vertical: isDesktop ? 12 : 8,
                            ),
                          ),
                          child: Text(
                            'Shop Now',
                            style: TextStyle(
                              fontSize: isDesktop
                                  ? 16
                                  : isTablet
                                  ? 14
                                  : 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Dots indicator
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                dummySliderItems.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSliderIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white.withAlpha(128),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
