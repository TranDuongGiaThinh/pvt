import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';
import '../models/product_type_model.dart';
import '../models/setting_model.dart';
import '../utils/constants.dart';
import 'api_config.dart';

class ApiService {
  Future<int> fetchWebsiteId(String domain) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.getWebsiteIdAPI),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'domain': domain}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is Map<String, dynamic> &&
            data.containsKey('website') &&
            data['website'] is Map<String, dynamic> &&
            data['website'].containsKey('id') &&
            data['website']['id'] is int) {
          return data['website']['id'] as int;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching website ID: $e');
      }
    }
    return Constants.nonId;
  }

  Future<SettingModel> fetchSetting(int websiteId) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConfig.getSettingAPI}$websiteId"),
      );

      if (response.statusCode == 200) {
        return SettingModel.fromJson(jsonDecode(response.body)['setting']);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching setting: $e');
      }
    }
    return SettingModel.defaultSetting();
  }

  Future<List<ProductTypeModel>> fetchProductTypes(int websiteId) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConfig.getAllProductTypesAPI}$websiteId"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['product_types'];
        return data.map((json) => ProductTypeModel.fromJson(json)).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching product types: $e');
      }
    }
    return [];
  }

  Future<List<ProductModel>> fetchProducts(int websiteId) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConfig.getAllProductsAPI}$websiteId"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['products'];
        return data.map((json) => ProductModel.fromJson(json)).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products: $e');
      }
    }
    return [];
  }
}
