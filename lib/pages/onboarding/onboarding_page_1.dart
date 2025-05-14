import 'package:flutter/material.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {

  static const _title = 'Streamline Your Workflow';
  static const _description = 'Streamline operations, boost growth, and manage everything in one place. Take your business to the next level.';

  
  Widget onBoardingImage() {
    return Image.asset(
      'assets/images/onboarding_1.png',
      width: double.infinity,
      height: 356,
    );
  }

  Widget titleText() {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      textAlign: TextAlign.center
    );
  }

  Widget descriptionText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        _description,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFFC5C5C5)
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Color(0xFF4280EF)),
        shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      ),
      onPressed: () {
        
      }, 
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 150),
            onBoardingImage(),
            titleText(),
            SizedBox(height: 24),
            descriptionText(),
            SizedBox(height: 120),
            nextButton()
          ],
        ),
      )
    );
  }
}