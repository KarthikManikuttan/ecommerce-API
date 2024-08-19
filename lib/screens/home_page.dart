import 'package:ecommerce_api/const/colors.dart';
import 'package:ecommerce_api/utils/api_services.dart';
import 'package:ecommerce_api/widgets/build_icon_widget.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:flutter/material.dart';
import '../models/e_commerce_response_model.dart';
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
  String? category = "";
  int limit = 10;
  ScrollController scrollController = ScrollController();
  bool isLoadingPagination = false;

  @override
  void initState() {
    // TODO: implement initState

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
      // ApiServices().getCategorizedProducts(category: category, limit: limit);
      getServices();
      setState(() {});
    }
  }

  getServices() async {
    eCommerceResponseModel = await ApiServices().getResponse(limit: limit);
    productCategory = await ApiServices().getCategory();
    setState(() {
      isLoading = false;
      isLoadingPagination = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors().primaryColors,
            ),
          )
        : SingleChildScrollView(
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
                                limit = 10;
                                setState(() {
                                  selectedIndex = index;
                                });
                                category = productCategory![index];
                                eCommerceResponseModel =
                                    await ApiServices().getCategorizedProducts(
                                  category: productCategory![index],
                                  limit: limit,
                                );
                                setState(() {
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
                                      : Border.all(
                                          color: Colors.black, width: 1.2),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                  BuildGridviewWidget(
                    productList: eCommerceResponseModel!.products!,
                  ),
                  if (isLoadingPagination == true)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors().primaryColors,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
  }
}
