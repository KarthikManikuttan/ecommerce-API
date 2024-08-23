import 'package:flutter/material.dart';

import '../models/e_commerce_response_model.dart';
import '../screens/product_detail_page.dart';
import '../utils/api_services.dart';
import '../utils/app_color.dart';
import 'build_icon_widget.dart';
import 'build_image_widget.dart';
import 'build_text_widget.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  ECommerceResponseModel? searchResponseModel;
  TextEditingController textEditingController = TextEditingController();
  String searchValue = "";

  searchProduct(String text) async {
    searchResponseModel = await ApiServices().searchProduct(item: text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: textEditingController,
            onChanged: (value) {
              searchValue = value;
              searchProduct(value);
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
        searchValue.isEmpty
            ? const SizedBox()
            : ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchResponseModel?.products?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            title: searchResponseModel!.products![index].title!,
                            description: searchResponseModel!.products![index].description!,
                            discount: searchResponseModel!.products![index].discountPercentage!,
                            rating: searchResponseModel!.products![index].rating!,
                            imgList: searchResponseModel!.products![index].images!,
                            price: searchResponseModel!.products![index].price!,
                            reviewList: searchResponseModel!.products![index].reviews!,
                            availabilityStatus:
                                searchResponseModel!.products![index].availabilityStatus!,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors().greyColors, borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: BuildTextWidget(
                                  text: searchResponseModel!.products![index].title,
                                ),
                              ),
                              BuildImageWidget(
                                  imgLink: searchResponseModel!.products![index].thumbnail!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
