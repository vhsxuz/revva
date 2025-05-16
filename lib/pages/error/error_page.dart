import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({super.key});

  Widget logoWidgetGrey() {
    return Center(
      child: Container(
        width: 293,
        height: 293,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/revva_logo_grey.png'),
          ),
        ),
      ),
    );
  }

  Widget titleTextError() {
    return Center(
      child: Text(
        "Good Things Will Come",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget titleTextErrorDescription() {
    return Center(
      child: Container(
        width: 229,
        child: Text(
          "This page is under maintenance and unable to access for a moment. Thank you for your patience",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget returnButton() {
    return Center(
      child: SizedBox(
        width: 229,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(const Color(0xFF4280EF)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          onPressed: () {
            Get.toNamed('/');
          },
          child: const Text('Return', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1B232A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              SizedBox(height: 106),
              logoWidgetGrey(),
              titleTextError(),
              SizedBox(height: 21),
              titleTextErrorDescription(),
              SizedBox(height: 58),
              returnButton(),
            ],
          ),
        ),
      ),
    );
  }
}
