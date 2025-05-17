import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/controllers/total_balance_card_controller.dart';

class TotalBalanceCard extends StatelessWidget {
  const TotalBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TotalBalanceCardController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF1B232A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 100,
              top: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/revva_logo_grey_opacity100.png',
                width: 300,
                height: 300,
                opacity: const AlwaysStoppedAnimation<double>(0.1),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Balance total',
                            style: TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: controller.toggleVisibility,
                            child: Obx(() => Icon(
                                  controller.isVisible.value ? Icons.visibility : Icons.visibility_off,
                                  size: 14,
                                  color: const Color(0xFF777777),
                                )),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 80,
                        height: 22,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2F3C47),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'History',
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Icon(
                              Icons.chevron_right,
                              size: 12,
                              color: Color(0xFF777777),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Obx(() => Row(
                        children: [
                          const Text(
                            'Rp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            controller.isVisible.value ? '24.000.000' : '*******',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 10,
                        color: Color(0xFF777777),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Daily Income : Rp 348.000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFF777777),
                    thickness: 1,
                    height: 1,
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'View Details',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 12,
                          color: Color(0xFF777777),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
