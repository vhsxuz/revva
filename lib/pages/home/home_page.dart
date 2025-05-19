import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/config/component/appBar/main_app_bar.dart';
import 'package:revva/config/component/bottomNav/main_bottom_nav.dart';
import 'package:revva/config/component/totalBalanceCard/total_balance_card.dart';
import 'package:revva/controllers/total_balance_card_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;

  // Data List for transactions
  final List<Map<String, dynamic>> transactionList = [
    {
      'image': 'assets/images/qrcode.png',
      'title': 'Espresso Triple Shot',
      'subtitle': 'Coffee',
      'date': '08 Mei 2025, 09:48',
      'price': '+Rp 21.000',
      'priceColor': Color(0xFF34A353),
    },
    {
      'image': 'assets/images/bitcoin.png',
      'title': 'Iced Americano',
      'subtitle': 'Coffee',
      'date': '07 Mei 2025, 11:15',
      'price': '+Rp 21.000',
      'priceColor': Color(0xFF34A353),
    },
    {
      'image': 'assets/images/qrcode.png',
      'title': 'Hot Chocolate',
      'subtitle': 'Non Coffee',
      'date': '06 Mei 2025, 14:32',
      'price': '+Rp 21.000',
      'priceColor': Color(0xFF34A353),
    },
  ];

  Widget menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _IconWithText(
                  icon: Icons.file_download_outlined,
                  label: 'Deposit',
                ),
                _IconWithText(
                  icon: Icons.inventory_2_outlined,
                  label: 'Products',
                ),
                _IconWithText(
                  icon: Icons.account_balance_wallet_outlined,
                  label: 'Financial',
                ),
                _IconWithText(
                  icon: Icons.person_add_alt_1_outlined,
                  label: 'Referral',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _IconWithText(icon: Icons.people_outline, label: 'Employee'),
                _IconWithText(icon: Icons.bar_chart, label: 'Markets'),
                _IconWithText(icon: Icons.description_outlined, label: 'News'),
                _IconWithText(icon: Icons.menu, label: 'More'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionItem() {
    return Column(
      children:
          transactionList.map((item) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B232A),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image'],
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1B232A),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item['subtitle'],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1B232A),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item['date'],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1B232A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item['price'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: item['priceColor'],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xFFEEEEEE),
                  thickness: 1,
                  indent: 44,
                  endIndent: 0,
                ),
              ],
            );
          }).toList(),
    );
  }

  Widget transactionHistories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction Histories',
                  style: TextStyle(
                    color: Color(0xFF2F3C47),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.chevron_right, size: 18, color: Color(0xFF777777)),
              ],
            ),
            const SizedBox(height: 12),
            transactionItem(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4F4F4),
      appBar: MainAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const TotalBalanceCard(),
                  const SizedBox(height: 20),
                  menu(),
                  const SizedBox(height: 20),
                  transactionHistories(),
                ],
              ),
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
}

class _IconWithText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconWithText({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    Get.put(TotalBalanceCardController());

    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Icon(icon, size: 22, color: Color(0xFF2F3C47)),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF2F3C47),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
