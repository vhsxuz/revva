import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      "Register",
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget signInButton() {
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
          'Sign Up',
          style: TextStyle(color: Color(0xff1B232A)),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Row(
      children: const [
        Expanded(child: Divider(color: Colors.white, height: 3)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('or', style: TextStyle(color: Colors.white)),
        ),
        Expanded(child: Divider(color: Colors.white, height: 3)),
      ],
    );
  }

  Widget googleRegisterButton() {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/google_logo.png'),
                ),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign Up with Google',
                  style: TextStyle(color: Color(0xff1B232A)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 2),
        GestureDetector(
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: Color(0xFF4280EF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
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
              CustomTextFormField(
                label: "Password",
                controller: passwordController,
              ),
              signInButton(),
              const SizedBox(height: 40),
              orDivider(),
              const SizedBox(height: 40),
              googleRegisterButton(),
              const SizedBox(height: 40),
              loginRow(),
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
    IconData? icon;
    if (label.toLowerCase().contains("username")) {
      icon = Icons.person;
    } else if (label.toLowerCase().contains("password")) {
      icon = Icons.shield;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Color(0xFF9C9C9C)),
        obscureText: label.toLowerCase().contains("password"),
        decoration: InputDecoration(
          prefixIcon:
              icon != null
                  ? Icon(icon, color: const Color(0xFF9C9C9C), size: 18.0)
                  : null,
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
