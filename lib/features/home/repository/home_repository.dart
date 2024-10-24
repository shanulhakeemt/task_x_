import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:task_x/core/constants/service_constants.dart';
import 'package:task_x/core/failure/app_failure.dart';
import 'package:task_x/features/home/model/products_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  Future<Either<AppFailure, List<ProductModel>>> getProductModels() async {
    try {
      final uri =
          Uri.parse("${ServiceConstants.baseUrl}${ServiceConstants.endPoint}");

      final res = await http.get(uri);

      if (res.statusCode == 200) {
        final resBodyMap = jsonDecode(res.body);   
        final List<ProductModel> productModels = (resBodyMap as List)
            .map((e) => ProductModel.fromMap(e as Map<dynamic, dynamic>))
            .toList();
        return right(productModels);
      } else {
        return left(AppFailure("Invalid url"));
      }
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
