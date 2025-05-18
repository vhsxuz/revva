import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:revva/controllers/menu_controller.dart' as revva;
import 'package:revva/routes/route.dart'; // Import Routes

class MenuDetailPage extends StatefulWidget {
  const MenuDetailPage({Key? key}) : super(key: key);

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  final revva.MenuController menuController = Get.find();
  late String menuId;

  @override
  void initState() {
    super.initState();
    menuId = Get.arguments as String;
    print('Received menu ID: $menuId');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      menuController.fetchMenuDetail(menuId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0XFF1b232a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offNamed(Routes.PRODUCT),
        ),
      ),
      body: Obx(() {
        if (menuController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final menu = menuController.menuDetail.value;
        final dateFormat = DateFormat('dd MMM yyyy');
        final lastRestocked = DateTime.parse(menu.lastRestocked);

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Displaying the image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  _getMenuImage(menu.name),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.fastfood,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(menu.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(menu.menuCategory.name, style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 8),
              Text('Rp ${NumberFormat('#,###').format(menu.price)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${menu.rating}', style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(height: 32),
              const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(menu.description),
              const Divider(height: 32),
              const Text('Business Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildInfoRow('Production Cost', 'Rp ${NumberFormat('#,###').format(menu.productionCost)}'),
              _buildInfoRow('Margin', 'Rp ${NumberFormat('#,###').format(menu.margin)}'),
              _buildInfoRow('Monthly Revenue', 'Rp ${NumberFormat('#,###').format(menu.monthlyRevenue)}'),
              _buildInfoRow('Monthly Profit', 'Rp ${NumberFormat('#,###').format(menu.monthlyProfit)}'),
              const Divider(height: 32),
              const Text('Inventory & Operations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildInfoRow('Stock Available', '${menu.stockServing} servings'),
              _buildInfoRow('Preparation Time', '${menu.prepTimeMinutes} minutes'),
              _buildInfoRow('Last Restocked', dateFormat.format(lastRestocked)),
            ],
          ),
        );
      }),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
