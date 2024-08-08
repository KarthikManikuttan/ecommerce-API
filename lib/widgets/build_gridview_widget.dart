import 'package:ecommerce_api/screens/product_detail_page.dart';
import 'package:ecommerce_api/widgets/build_image_widget.dart';
import 'package:flutter/material.dart';
import '../const/colors.dart';
import 'build_text_widget.dart';

class BuildGridviewWidget extends StatefulWidget {
  final List<String> imgList;
  final List<String> categoryList;
  final List<String> numbList;

  const BuildGridviewWidget({
    super.key,
    required this.numbList,
    required this.categoryList,
    required this.imgList,
  });

  @override
  State<BuildGridviewWidget> createState() => _BuildGridviewWidgetState();
}

class _BuildGridviewWidgetState extends State<BuildGridviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: widget.imgList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    imgList: widget.imgList,
                    title: widget.categoryList[index],
                  ),
                ),
              );
            },
            child: GridTile(
              footer: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildTextWidget(
                            text: widget.categoryList[index],
                            color: Colors.grey,
                            weight: FontWeight.w600,
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
                                text: widget.numbList[index],
                                weight: FontWeight.w600,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: BuildTextWidget(
                        text: "\$200",
                        size: 18,
                        weight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Card(
                  color: AppColors().greyColors,
                  elevation: 0,
                  borderOnForeground: false,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: BuildImageWidget(
                      imgLink: widget.imgList[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
