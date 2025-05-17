import 'package:get/get.dart';

class FinancialChartController extends GetxController {
  var selectedBarIndex = (-1).obs;

  void selectBar(int index) {
    if (selectedBarIndex.value != index) {
      selectedBarIndex.value = index;
    }
  }
}
