import 'package:flutter/material.dart';

class NotAvailablePage extends StatelessWidget {
  NotAvailablePage({super.key});

  Widget logoWidgetGrey() {
    return Center(
      child: Container(
        width: 293,
        height: 293,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/revva_logo_grey_opacity100.png'),
          ),
        ),
      ),
    );
  }

  Widget titleTextError() {
    return Center(
      child: Text(
        "Item Not Available",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: const Color(0xFFB2B2B2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              SizedBox(height: 186),
              logoWidgetGrey(),
              titleTextError(),
            ],
          ),
        ),
      ),
    );
  }
}
