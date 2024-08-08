import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import 'build_image_widget.dart';
import 'build_text_widget.dart';

class CarouselProductWidget extends StatefulWidget {
  final List<String> imgList;

  const CarouselProductWidget({
    super.key,
    required this.imgList,
  });

  @override
  State<CarouselProductWidget> createState() => _CarouselProductWidgetState();
}

class _CarouselProductWidgetState extends State<CarouselProductWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlayInterval: const Duration(seconds: 6),
        viewportFraction: 1,
        autoPlay: true,
        aspectRatio: 1.0,
        enlargeCenterPage: true,
      ),
      itemCount: widget.imgList.length,
      itemBuilder: (context, index, pageViewIndex) {
        return BuildImageWidget(
          imgLink: widget.imgList[index],
        );
      },
    );
  }
}
