import 'package:flutter/material.dart';
import 'package:revva/config/component/appBar/main_app_bar.dart';
import 'package:revva/config/component/bottomNav/main_bottom_nav.dart';

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

  Widget saldoCard() {
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
                          Text(
                            'Balance total',
                            style: TextStyle(
                              color: const Color(0xFF777777),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 14,
                              color: const Color(0xFF777777),
                            ),
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
                            Text(
                              'History',
                              style: TextStyle(
                                color: const Color(0xFF777777),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Icon(
                              Icons.chevron_right,
                              size: 12,
                              color: const Color(0xFF777777),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Baseline(
                        baseline: 15,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          'Rp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Baseline(
                        baseline: 24,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          isVisible ? '24.000.000' : '*******',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 10,
                        color: Color(0xFF777777),
                      ),
                      const SizedBox(width: 6),
                      Text(
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
                        Text(
                          'View Details',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
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
      appBar: const MainAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  saldoCard(),
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
