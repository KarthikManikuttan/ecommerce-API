import 'package:ecommerce_api/models/e_commerce_response_model.dart';
import 'package:ecommerce_api/widgets/build_image_widget.dart';
import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../screens/product_detail_page.dart';
import 'build_text_widget.dart';

class BuildGridviewWidget extends StatefulWidget {
  final List<Product> productList;
  int? index;

  BuildGridviewWidget({
    super.key,
    required this.productList,
    this.index,
  });

  @override
  State<BuildGridviewWidget> createState() => _BuildGridviewWidgetState();
}

class _BuildGridviewWidgetState extends State<BuildGridviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.productList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.53,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  title: widget.productList[index].title!,
                  description: widget.productList[index].description!,
                  discount: widget.productList[index].discountPercentage!,
                  rating: widget.productList[index].rating!,
                  imgList: widget.productList[index].images!,
                  price: widget.productList[index].price!,
                  reviewList: widget.productList[index].reviews!,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors().greyColors,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: BuildImageWidget(
                      imgLink: widget.productList[index].thumbnail!,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: BuildTextWidget(
                              text: widget.productList[index].title!.length > 34
                                  ? widget.productList[index].title!
                                      .substring(0, 34)
                                  : widget.productList[index].title,
                              color: Colors.grey,
                              weight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildTextWidget(
                              text: "\$ ${widget.productList[index].price}",
                              size: 18,
                              weight: FontWeight.w900,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                BuildTextWidget(
                                  text: widget.productList[index].rating
                                      .toString(),
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
