import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/config/component/appBar/main_app_bar.dart';
import 'package:revva/config/component/bottomNav/main_bottom_nav.dart';
import 'package:revva/controllers/menu_controller.dart' as revva;
import 'package:revva/routes/route.dart';

class ProductPage extends StatelessWidget {
  final revva.MenuController menuController = Get.put(revva.MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: const MainAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Obx(() {
                if (menuController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (menuController.menuList.isEmpty) {
                  return const Center(child: Text('No products found.'));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                      child: Text(
                        'Menu List',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.82,
                        ),
                        itemCount: menuController.menuList.length,
                        itemBuilder: (context, index) {
                          final menu = menuController.menuList[index];
                          return GestureDetector(
                            onTap: () {
                              // Di ProductPage, sebelum navigasi:
                              print('Navigating with menu ID: ${menu.id}');
                              Get.toNamed(
                                Routes.MENUDETAIL,
                                arguments: menu.id,
                              );
                            },
                            child: Card(
                              elevation: 1,
                              shadowColor: Colors.grey[100], 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image container - menggunakan asset image
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        _getMenuImage(menu.name),
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Center(
                                            child: Icon(
                                              Icons.fastfood,
                                              size: 50,
                                              color: Colors.grey[600],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          menu.name,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          menu.menuCategory.name,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFFC5C5C5),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Rp ${menu.price}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MainBottomNav(),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk mendapatkan path image sesuai nama menu
  String _getMenuImage(String menuName) {
    switch (menuName) {
      case 'Pancake Stack':
        return "assets/images/menu/pancake_stack.jpg";
      case 'Latte':
        return "assets/images/menu/latte.jpeg";
      case 'Croissant':
        return "assets/images/menu/croissant.jpg";
      case 'Espresso':
        return "assets/images/menu/espresso.jpg";
      case 'Cinnamon Roll':
        return "assets/images/menu/cinnamon_roll.jpg";
      case 'Mocha':
        return "assets/images/menu/mocha.png";
      case 'Cappuccino':
        return "assets/images/menu/cappuccino.png";
      case 'Avocado Toast':
        return "assets/images/menu/avocado_toast.jpg";
      case 'Blueberry Muffin':
        return "assets/images/menu/blueberry_muffin.jpg";
      case 'Luwak White Coffee':
        return "assets/images/menu/luwak_wc.jpg";
      default:
        return "assets/images/menu/default.jpg";
    }
  }
}
