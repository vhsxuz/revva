import 'package:flutter/material.dart';
import 'package:revva/controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class MainBottomNav extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  MainBottomNav({super.key});

  Widget _buildNavItem(int index, IconData icon, String label) {
    return Obx(() {
      final bool isSelected = controller.selectedIndex.value == index;

      return GestureDetector(
        onTap: () => controller.onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color:
                  isSelected
                      ? const Color(0xFF4280EF)
                      : const Color(0xFF777777),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected
                        ? const Color(0xFFC1C7CD)
                        : const Color(0xFF777777),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 366,
          height: 76,
          decoration: BoxDecoration(
            color: const Color(0xFF1B232A),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home, 'Home'),
              _buildNavItem(1, Icons.archive, 'Items'),
              _buildNavItem(2, Icons.person, 'Staff'),
              _buildNavItem(3, Icons.account_balance_wallet, 'Finance'),
              _buildNavItem(4, Icons.settings, 'Setting'),
            ],
          ),
        ),
      ),
    );
  }
}
