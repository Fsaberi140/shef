import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../common/utils.dart';
import '../data/banner.dart';
import '../pages/image.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerEntity> banners;
final PageController _controller= PageController();
   BannerSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children:[ PageView.builder(
          controller: _controller,
          physics: defaultScrollPhysics,
          itemCount: banners.length,
          itemBuilder: (context, index) => _Slide(banner: banners[index]),
        ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: banners.length,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                    spacing:  5.0,
                    radius:  4.0,
                    dotWidth:  18.0,
                    dotHeight:  3.0,
                    paintStyle:  PaintingStyle.fill,
                    strokeWidth:  1.5,
                    dotColor:  Colors.grey.shade400,
                    activeDotColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final BannerEntity banner;
  const _Slide({
    Key? key,
     required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: ImageLoadingService(
        imageUrl: banner.imageUrl,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
