import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_api/widgets/build_image_widget.dart';
import 'package:flutter/material.dart';
import '../const/colors.dart';
import 'build_text_widget.dart';

class CarouselHomeWidget extends StatefulWidget {
  final List<String> imgList;
  final List<String> textList;

  const CarouselHomeWidget({
    super.key,
    required this.imgList,
    required this.textList,
  });

  @override
  State<CarouselHomeWidget> createState() => _CarouselHomeWidget();
}

class _CarouselHomeWidget extends State<CarouselHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      itemCount: widget.imgList.length,
      itemBuilder: (context, index, pageViewIndex) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors().primaryColors,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: BuildImageWidget(
                imgLink: widget.imgList[index],
              ),
            ),
            Align(
              alignment: const Alignment(-0.7, 0.4),
              child: BuildTextWidget(
                size: 30,
                text: widget.textList[index],
                weight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
