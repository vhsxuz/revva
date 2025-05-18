import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:revva/models/menu_model.dart';
import 'package:revva/models/menu_detail_model.dart';

class MenuController extends GetxController {
  var isLoading = false.obs;
  var menuList = <MenuModel>[].obs;
  var menuDetail = MenuDetailModel(
    id: '',
    name: '',
    menuCategoryId: '',
    rating: 0,
    description: '',
    productionCost: 0,
    price: 0,
    margin: 0,
    monthlyRevenue: 0,
    monthlyProfit: 0,
    stockServing: 0,
    prepTimeMinutes: 0,
    lastRestocked: '',
    createdAt: '',
    menuCategory: MenuDetailCategory(
      id: '',
      name: '',
      createdAt: '',
    ),
  ).obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchMenus();
    super.onInit();
  }

  Future<void> fetchMenus() async {
    isLoading.value = true;
    try {
      final response = await _dio.get('https://revva-service.vercel.app/api/v1/menu/');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        menuList.value = data.map((json) => MenuModel.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch menus');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMenuDetail(String id) async {
    print("ID : $id");
    isLoading.value = true;
    try {
      final response = await _dio.get('https://revva-service.vercel.app/api/v1/menu/$id');

      if (response.statusCode == 200) {
        menuDetail.value = MenuDetailModel.fromJson(response.data['data']);
      } else {
        Get.snackbar('Error', 'Failed to fetch menu details');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Optional: Clear detail when leaving detail page
  void clearMenuDetail() {
    menuDetail.value = MenuDetailModel(
      id: '',
      name: '',
      menuCategoryId: '',
      rating: 0,
      description: '',
      productionCost: 0,
      price: 0,
      margin: 0,
      monthlyRevenue: 0,
      monthlyProfit: 0,
      stockServing: 0,
      prepTimeMinutes: 0,
      lastRestocked: '',
      createdAt: '',
      menuCategory: MenuDetailCategory(
        id: '',
        name: '',
        createdAt: '',
      ),
    );
  }
}