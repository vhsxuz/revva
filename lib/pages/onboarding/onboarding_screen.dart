import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Streamline Your Workflow',
      'description':
          'Streamline operations, boost growth, and manage everything in one place. Take your business to the next level.',
      'image': 'assets/images/onboarding_1.png',
    },
    {
      'title': 'Track Everything Effortlessly',
      'description':
          'From managing stock to monitoring employee performance, keep your business data organized and accessible.',
      'image': 'assets/images/onboarding_2.png',
    },
    {
      'title': 'Grow Your Business',
      'description':
          'Leverage data-driven insights to make smarter business decisions and achieve sustainable growth.',
      'image': 'assets/images/onboarding_3.png',
    },
  ];

  Widget nextButton() {
    return Obx(
      () => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xFF4280EF)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        onPressed: () {
          if (controller.currentIndex.value == onboardingData.length - 1) {
            Get.toNamed('/market');  // Navigate to login page
          } else {
            controller.nextPage();  // Move to the next page
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Text(
            controller.currentIndex.value == onboardingData.length - 1
                ? 'Get Started'
                : 'Next',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget pageIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(onboardingData.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  controller.currentIndex.value == index
                      ? Colors.white
                      : const Color(0xFFC5C5C5),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.updateIndex,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onboardingData[index]['image']!,
                        width: double.infinity,
                        height: 356,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        onboardingData[index]['title']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          onboardingData[index]['description']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFC5C5C5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            pageIndicator(),
            const SizedBox(height: 30),
            nextButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
