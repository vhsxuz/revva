import 'package:flutter/material.dart';

class PromotionPage extends StatelessWidget {
  PromotionPage({super.key});

  Widget imagePromotion() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/promotion_image.png',
          width: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),

        Positioned(
          bottom: 30,
          left: 20,
          right: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Increase your business\neven more',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Increase your business potential with AI\nassistant that helps your productivity and\nbusiness expansions',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget boxPromotionDescription() {
    return Center(
      child: Container(
        width: 335,
        height: 170,
        padding: const EdgeInsets.fromLTRB(60, 33, 30, 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFF2F3C47), // warna border
            width: 1.5, // ketebalan border
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Image(image: AssetImage('assets/images/check_image.png')),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Crown on the Profile',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Image(image: AssetImage('assets/images/check_image.png')),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'AI chatbot acts as virtual assistant',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Image(image: AssetImage('assets/images/check_image.png')),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Access to clearer AI Insights',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Image(image: AssetImage('assets/images/check_image.png')),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Ad-free experience',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textCoomingSoon() {
    return Center(
      child: Text(
        "COMING SOON",
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1B232A),
      body: SafeArea(
        child: ListView(
          children: [
            imagePromotion(),
            SizedBox(height: 40),
            boxPromotionDescription(),
            SizedBox(height: 35),
            textCoomingSoon(),
          ],
        ),
      ),
    );
  }
}
