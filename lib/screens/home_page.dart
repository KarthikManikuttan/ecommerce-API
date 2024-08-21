import 'package:ecommerce_api/screens/cart_page.dart';
import 'package:ecommerce_api/utils/api_services.dart';
import 'package:ecommerce_api/widgets/build_icon_widget.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:ecommerce_api/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/e_commerce_response_model.dart';
import '../utils/appColor.dart';
import '../widgets/build_gridview_widget.dart';
import '../widgets/carousel_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  ECommerceResponseModel? eCommerceResponseModel;

  List<dynamic>? productCategory;
  int selectedIndex = 0;
  String? category = "All";
  int limit = 10;
  ScrollController scrollController = ScrollController();

  bool isLoadingPagination = false;
  bool isLoadingGrid = false;

  @override
  void initState() {
    getServices();
    scrollController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingPagination = true;
      });
      limit += 10;
      getServices();
      setState(() {});
    }
  }

  getServices() async {
    eCommerceResponseModel = await ApiServices()
        .getCategorizedProducts(category: category, limit: limit);
    productCategory = await ApiServices().getCategory();
    setState(() {
      isLoading = false;
      isLoadingPagination = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: AppColors().primaryColors,
          size: 50,
        ),
      );
    } else {
      return SingleChildScrollView(
        controller: scrollController,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
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
              const SearchFieldWidget(),
              CarouselHomeWidget(
                productList: eCommerceResponseModel!.products!,
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
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: productCategory!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              isLoadingGrid = true;
                              selectedIndex = index;
                            });
                            limit = 10;

                            category = productCategory![index];
                            eCommerceResponseModel =
                                await ApiServices().getCategorizedProducts(
                              category: productCategory![index],
                              limit: limit,
                            );
                            setState(() {
                              isLoadingGrid = false;
                              isLoadingPagination = false;
                            });
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? AppColors().primaryColors
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: index == selectedIndex
                                  ? const Border.symmetric()
                                  : Border.all(color: Colors.black, width: 1.2),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: BuildTextWidget(
                                  text: productCategory![index],
                                  color: index == selectedIndex
                                      ? Colors.white
                                      : Colors.black,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              isLoadingGrid
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors().primaryColors,
                        size: 50,
                      ),
                    )
                  : BuildGridviewWidget(
                      productList: eCommerceResponseModel!.products!,
                    ),
              if (isLoadingPagination == true)
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: AppColors().primaryColors,
                      size: 50,
                    ),
                  ),
                ),
              const SizedBox(
                height: 45,
              )
            ],
          ),
        ),
      );
    }
  }
}
