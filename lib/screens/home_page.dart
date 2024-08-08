import 'package:ecommerce_api/const/colors.dart';
import 'package:ecommerce_api/widgets/build_icon_widget.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/build_gridview_widget.dart';
import '../widgets/carousel_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
    'https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/1.png',
    'https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/1.png',
    'https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/1.png',
    'https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/1.png',
    'https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/2.png'
  ];
  final List<String> numbList = [
    '1',
    '2.5',
    '5',
    '6.5',
    '2.4',
    '3',
  ];
  final List<String> textList = [
    'Clearance\nSale',
    'Grab\nYour now !',
    'Up to\n50% off !',
    'New\nArrivals !',
    'Stylish\nCollections',
    'Top Brands\nSale',
  ];
  final List<String> categoryList = [
    'All',
    'Laptop',
    'Camera',
    'Smartphone',
    'Headphone',
    'Accessories',
    'Appliances',
    'Gadgets',
    'Cosmetics'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BuildTextWidget(
                  text: "Discover",
                  size: 25,
                  weight: FontWeight.w900,
                ),
                Badge(
                  backgroundColor: AppColors().primaryColors,
                  smallSize: 15,
                  child: MaterialButton(
                    onPressed: () {},
                    highlightColor: Colors.white,
                    highlightElevation: 0,
                    elevation: 0,
                    minWidth: 0,
                    enableFeedback: false,
                    padding: const EdgeInsets.all(12.0),
                    shape: CircleBorder(
                      side: BorderSide(
                          width: 1.7,
                          color: Colors.grey.withOpacity(0.3),
                          style: BorderStyle.solid),
                    ),
                    child: const BuildIconWidget(
                      imgLink:
                          "https://img.icons8.com/fluency-systems-regular/48/shopping-bag--v1.png",
                      size: 21,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const BuildIconWidget(
                      imgLink:
                          "https://img.icons8.com/external-febrian-hidayat-basic-outline-febrian-hidayat/48/external-search-user-interface-febrian-hidayat-basic-outline-febrian-hidayat.png",
                      size: 27,
                    ),
                  ),
                ),
              ),
            ),
            CarouselHomeWidget(
              imgList: imgList,
              textList: textList,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BuildTextWidget(
                  text: "Categories",
                  size: 16,
                  weight: FontWeight.w700,
                ),
                TextButton(
                  onPressed: () {},
                  child: BuildTextWidget(
                    text: "See all",
                    weight: FontWeight.bold,
                    color: AppColors().primaryColors,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors().primaryColors,
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: BuildTextWidget(
                                  text: categoryList[index],
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.black, width: 1.2),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: BuildTextWidget(
                                  text: categoryList[index],
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
            BuildGridviewWidget(
              numbList: numbList,
              categoryList: categoryList,
              imgList: imgList,
            ),
          ],
        ),
      ),
    );
  }
}
