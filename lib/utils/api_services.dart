import 'package:dio/dio.dart';
import '../models/e_commerce_response_model.dart';

class ApiServices {
  Dio dio = Dio();
  static ECommerceResponseModel? eCommerceResponseModel;
  static ECommerceResponseModel? searchResponseModel;

  Future<List<dynamic>> getCategory() async {
    List<dynamic> categoryList = [];
    final response =
        await dio.get('https://dummyjson.com/products/category-list');
    if (response.statusCode == 200) {
      categoryList = response.data;
    }
    categoryList.insert(0, "All");
    return categoryList;
  }

  Future<ECommerceResponseModel?> getCategorizedProducts(
      {String? category, int? limit}) async {
    Response<dynamic> response;
    category == "All"
        ? response =
            await dio.get('https://dummyjson.com/products?limit=$limit&skip=0')
        : response = await dio.get(
            'https://dummyjson.com/products/category/$category?limit=$limit&skip=0');
    if (response.statusCode == 200) {
      eCommerceResponseModel = ECommerceResponseModel.fromJson(response.data);
    }
    return eCommerceResponseModel!;
  }

  Future<ECommerceResponseModel?> searchProduct({required String? item}) async {
    final response =
        await dio.get('https://dummyjson.com/products/search?q=$item');
    if (response.statusCode == 200) {
      searchResponseModel = ECommerceResponseModel.fromJson(response.data);
    }
    return searchResponseModel;
  }
}
