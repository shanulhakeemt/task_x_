import 'package:get/get.dart';
import 'package:task_x/features/home/model/products_model.dart';
import 'package:task_x/features/home/repository/home_repository.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  List<ProductModel> productModels = [];
  int currentTabIndex = 0;

  Future<void> getProductModels() async {
    final res = await Get.put(HomeRepository()).getProductModels();
    res.fold((l) {}, (listOfProductModels) {
      productModels = listOfProductModels;
      update();
    });
  }

  void updateTabIndex(int inx) {
    currentTabIndex = inx;
    update();
  }

  @override
  Future<void> onReady() async {}
}
