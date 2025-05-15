import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final TextEditingController usernameController = TextEditingController();

  Widget logoWidget() {
    return Center(
      child: Container(
        width: 352,
        height: 330,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/revva_logo.png'),
          ),
        ),
      ),
    );
  }

  Widget titleText() {
    return Text(
      "Forgot Password",
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget forgotPasswordButton() {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: const Text(
          'Send Password Reset Mail',
          style: TextStyle(color: Color(0xff1B232A)),
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
              logoWidget(),
              titleText(),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: "Username",
                controller: usernameController,
              ),
              forgotPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Color(0xFF9C9C9C)),
        obscureText: label.toLowerCase().contains("password"),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: const Color(0xFF9C9C9C),
            size: 18.0,
          ),
          label: Text(label),
          labelStyle: const TextStyle(color: Color(0xFF9C9C9C)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9C9C9C)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
