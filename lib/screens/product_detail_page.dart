import 'package:ecommerce_api/main.dart';
import 'package:ecommerce_api/utils/app_color.dart';
import 'package:ecommerce_api/models/e_commerce_response_model.dart';
import 'package:ecommerce_api/utils/cart_services.dart';
import 'package:ecommerce_api/widgets/build_neopop_button.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:ecommerce_api/widgets/carousel_product_widget.dart';
import 'package:flutter/material.dart';
import '../utils/hive_services.dart';
import '../widgets/build_circle_icon_button_widget.dart';
import '../widgets/build_container_widget.dart';

class ProductDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> imgList;
  final double rating;
  final double price;
  final double discount;
  final List<Review> reviewList;
  final String? category;
  final int? productId;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.rating,
    required this.imgList,
    required this.reviewList,
    required this.price,
    required this.description,
    required this.discount,
    required this.category,
    required this.productId,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isWishListAdded = false;
  @override
  void initState() {
    // TODO: implement initState
    isWishListAdded = CartServices().isAdded(widget.productId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().greyColors2,
      body: SingleChildScrollView(
        child: Column(
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    imgLink: "https://img.icons8.com/windows/64/back.png",
                  ),
                  Row(
                    children: [
                      BuildCircleIconButtonWidget(
                        onPressed: () {
                          if (CartServices().isAdded(widget.productId!)) {
                            wishBox?.delete(widget.productId);
                            wishListModelList.removeAt(isAddedIndex!);

                            isWishListAdded = false;
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 1),
                              backgroundColor: AppColors().primaryColors,
                              content: const BuildTextWidget(
                                text: "Product has been removed to your favourites!",
                                color: Colors.white,
                                weight: FontWeight.w700,
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {});
                          } else {
                            HiveServices().addToWishList(
                              title: widget.title,
                              subTitle: widget.category,
                              amount: widget.price,
                              imgLink: widget.imgList[0],
                              id: widget.productId,
                            );

                            wishListModelList = wishBox!.values.toList();

                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 1),
                              backgroundColor: AppColors().primaryColors,
                              content: const BuildTextWidget(
                                text: "Product has been added to your favourites!",
                                color: Colors.white,
                                weight: FontWeight.w700,
                              ),
                            );
                            isWishListAdded = true;

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {});
                          }
                        },
                        imgLink: "https://img.icons8.com/ios-filled/50/like--v1.png",
                        color: isWishListAdded ? Colors.red : AppColors().primaryColors,
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
            Container(
              constraints: const BoxConstraints(
                  minHeight: 290, minWidth: double.infinity, maxHeight: double.infinity),
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
                        Flexible(
                          child: BuildTextWidget(
                            text: widget.title,
                            size: 25,
                            weight: FontWeight.w900,
                          ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          BuildContainerWidget(
                            text: widget.rating.toString(),
                            icon: Icons.star,
                            iconColor: Colors.orange,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          BuildContainerWidget(
                            text: widget.discount.toString(),
                            icon: Icons.percent_rounded,
                            iconColor: Colors.green,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          BuildTextWidget(
                            text: "${widget.reviewList.length} reviews",
                            color: Colors.grey,
                            weight: FontWeight.w700,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                    BuildTextWidget(
                      text: widget.description,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildTextWidget(
                    text: "\$${widget.price}",
                    weight: FontWeight.w900,
                    size: 25,
                  ),
                  BuildNeopopButton(
                    text: "Add to Cart",
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 10,
                    ),
                    onTapUp: () {
                      HiveServices().addToCart(
                        title: widget.title,
                        totalAmount: widget.price,
                        subTitle: widget.category,
                        amount: widget.price,
                        imgLink: widget.imgList[0],
                      );

                      cartModelList = box!.values.toList();

                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: AppColors().primaryColors,
                        content: const BuildTextWidget(
                          text: "Product has been added to your cart!",
                          color: Colors.white,
                          weight: FontWeight.w700,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
