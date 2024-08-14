import 'package:dio/dio.dart';
import 'package:ecommerce_api/const/colors.dart';
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
  Dio dio = Dio();
  ECommerceResponseModel? eCommerceResponseModel;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    getResponse();
    super.initState();
  }

  void getResponse() async {
    final response = await dio.get("https://dummyjson.com/products");
    if (response.statusCode == 200) {
      eCommerceResponseModel = ECommerceResponseModel.fromJson(response.data);
    }
    setState(() {
      isLoading = false;
    });
    getCategory();
  }

  List<String> categoryListBeforeCheck = [];
  List<String> productCategoryAfterCheck = [];

  void getCategory() {
    for (var item in eCommerceResponseModel!.products!) {
      categoryListBeforeCheck.add(item.category!);
    }
    var seen = <String>{};
    productCategoryAfterCheck = categoryListBeforeCheck
        .where((categoryListBeforeCheck) => seen.add(categoryListBeforeCheck))
        .toList();
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
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: productCategoryAfterCheck.length,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: BuildTextWidget(
                                        text: productCategoryAfterCheck[index],
                                        weight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.black, width: 1.2),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: BuildTextWidget(
                                        text: productCategoryAfterCheck[index],
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
                    productList: eCommerceResponseModel!.products!,
                  ),
                ],
              ),
            ),
          );
  }
}
