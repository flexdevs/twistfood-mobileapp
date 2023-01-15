import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twist_food/data/models/discounts/discounts_model.dart';
import 'package:twist_food/data/services/api/open_api_service.dart/open_api_service.dart';

class HomeController extends GetxController {
  var isLoading = true;
  var box = GetStorage();
  OpenApiService service = OpenApiService();

  List<DiscountsModel> discountData = [];
  @override
  void onInit() {
    fetchDiscount();
    if (box.read('discountData') != null) {
      discountData.assignAll(box.read('discountData'));
      debugPrint('Data keldi');
    }
    super.onInit();
  }

  void fetchDiscount() async {
    try {
      isLoading = true;
      update();
      List<DiscountsModel> dicountData = await service.getDiscounts();
      if (discountData != null) {
        discountData.assignAll(dicountData);
        box.write('discountData', dicountData);
      }
    } catch (e) {
      isLoading = false;
      update();
      debugPrint('data fetch done');
    }
  }
}
