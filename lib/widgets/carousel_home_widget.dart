import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_api/models/e_commerce_response_model.dart';
import 'package:ecommerce_api/widgets/build_image_widget.dart';
import 'package:flutter/material.dart';
import '../utils/AppColor.dart';
import 'build_text_widget.dart';

class CarouselHomeWidget extends StatefulWidget {
  final List<Product> productList;

  const CarouselHomeWidget({
    super.key,
    required this.productList,
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
      itemCount: widget.productList.length,
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
              alignment: Alignment.centerRight,
              child: CachedNetworkImage(
                imageUrl: widget.productList[index].thumbnail!,
                placeholder: (context, url) => CircularProgressIndicator(
                  color: AppColors().primaryColors,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Align(
              alignment: const Alignment(-0.7, 0.4),
              child: BuildTextWidget(
                size: 30,
                text:
                    'Get Up to \n${widget.productList[index].discountPercentage?.toInt()} % off !',
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
