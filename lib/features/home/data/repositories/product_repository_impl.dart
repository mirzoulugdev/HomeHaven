import 'dart:convert';
import 'dart:developer';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/service_locator.dart';
import '../models/product_banner_model.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<ProductModel?> getProducts() async {
    final url = Uri.parse(ApiConstants.GET_PRODUCT_URL);
    final token = getIt<CacheHelper>().getToken();

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        final data = ProductModel.fromJson(resBody);
        log(resBody.toString());
        return data;
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
    return null;
  }

  @override
  Future<ProductBannerModel?> getProductBanner() async {
    final url = Uri.parse(ApiConstants.GET_BANNER_URL);
    final token = getIt<CacheHelper>().getToken();

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": 'application/json',
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        final bannerData = jsonDecode(response.body);
        return ProductBannerModel.fromJson(bannerData);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
