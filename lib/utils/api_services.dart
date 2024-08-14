import 'package:dio/dio.dart';
import '../models/e_commerce_response_model.dart';

class ApiServices {
  Dio dio = Dio();
  static ECommerceResponseModel? eCommerceResponseModel;

  Future<ECommerceResponseModel?> getResponse() async {
    final response =
        await dio.get('https://dummyjson.com/products?limit=0&skip=0');
    if (response.statusCode == 200) {
      eCommerceResponseModel = ECommerceResponseModel.fromJson(response.data);
    }

    await getCategory();
    return eCommerceResponseModel;
  }

  Future<List<String>> getCategory() async {
    List<String> categoryListBeforeCheck = [];
    for (var item in eCommerceResponseModel!.products!) {
      categoryListBeforeCheck.add(item.category!);
    }
    var seen = <String>{};

    List<String> productCategoryAfterCheck = categoryListBeforeCheck
        .where((categoryListBeforeCheck) => seen.add(categoryListBeforeCheck))
        .toList();
    productCategoryAfterCheck.insert(0, "All");

    return productCategoryAfterCheck;
  }
}
