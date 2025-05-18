import 'package:flutter/material.dart';
import 'package:revva/config/component/appBar/setting_app_bar.dart';
import 'package:revva/config/component/bottomNav/main_bottom_nav.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Widget _buildMenuItem(String title, String iconName) {
    return Column(
      children: [
        SvgPicture.asset('assets/icons/$iconName.svg', width: 24, height: 24),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B232A),
      appBar: const SettingAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Common Section
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 16.0),
                      child: Text(
                        'Common',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        _buildMenuItem('Deposit', 'deposit'),
                        _buildMenuItem('Products', 'products'),
                        _buildMenuItem('Financial', 'financial'),
                        _buildMenuItem('Referral', 'referral'),
                      ],
                    ),

                    // Business Section
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 16.0),
                      child: Text(
                        'Business',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        _buildMenuItem('Cashflow', 'cashflow'),
                        _buildMenuItem('Reports', 'reports'),
                        _buildMenuItem('Employee', 'employee'),
                        _buildMenuItem('Markets', 'markets'),
                      ],
                    ),

                    // Other Section
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 16.0),
                      child: Text(
                        'Other',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _buildMenuItem('Premium', 'premium'),
                    ),
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
      ),
    );
  }
}
