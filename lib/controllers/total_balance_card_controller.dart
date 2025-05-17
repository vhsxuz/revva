import 'package:get/get.dart';

class TotalBalanceCardController extends GetxController {
  RxBool isVisible = true.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
