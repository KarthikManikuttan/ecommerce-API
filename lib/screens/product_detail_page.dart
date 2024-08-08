import 'package:ecommerce_api/const/colors.dart';
import 'package:ecommerce_api/widgets/build_container_widget.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:ecommerce_api/widgets/carousel_product_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/build_circle_icon_button_widget.dart';

class ProductDetailPage extends StatefulWidget {
  final List<String> imgList;
  final String title;

  const ProductDetailPage({
    super.key,
    required this.imgList,
    required this.title,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors().greyColors2,
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildCircleIconButtonWidget(
                      onPressed: () {},
                      imgLink: "https://img.icons8.com/windows/64/back.png",
                    ),
                    Row(
                      children: [
                        BuildCircleIconButtonWidget(
                          onPressed: () {},
                          imgLink:
                              "https://img.icons8.com/ios-filled/50/like--v1.png",
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        BuildCircleIconButtonWidget(
                          onPressed: () {},
                          imgLink:
                              "https://img.icons8.com/external-dreamstale-lineal-dreamstale/32/000000/external-upload-ui-dreamstale-lineal-dreamstale.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CarouselProductWidget(
                imgList: widget.imgList,
              ),
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildTextWidget(
                              text: widget.title,
                              size: 25,
                              weight: FontWeight.w900,
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                color: AppColors().redColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: BuildTextWidget(
                                  text: "% On sale",
                                  color: Colors.white,
                                  weight: FontWeight.w900,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        BuildContainerWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
