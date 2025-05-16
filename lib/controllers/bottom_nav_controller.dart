import 'package:get/get.dart';
import 'package:revva/routes/route.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        //add Get Route
        print(index);
        break;
      case 2:
        //add Get Route
        print(index);
        break;
      case 3:
        //add Get Route
        print(index);
        break;
      case 4:
        //add Get Route
        print(index);
        break;
    }
  }
}
