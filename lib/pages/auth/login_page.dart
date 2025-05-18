import 'package:flutter/material.dart';
import 'package:revva/routes/route.dart';
import 'package:revva/services/auth_service.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
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
    return Text("Login", style: TextStyle(fontSize: 20, color: Colors.white));
  }

  Widget forgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
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
        onPressed: () {
          AuthService()
              .signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              )
              .then((value) {
                if (value != null) {
                  Get.offAllNamed(Routes.HOME);
                }
              });
        },
        child: const Text(
          'Sign In',
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

  Widget googleLoginButton() {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
        ),
        onPressed: () async {
          await AuthService().signInWithGoogle();
        },
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
                  'Login with Google',
                  style: TextStyle(color: Color(0xff1B232A)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget registerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have account? ',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 2),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.REGISTER);
          },
          child: const Text(
            'Register',
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
              CustomTextFormField(label: "Email", controller: emailController),
              CustomTextFormField(
                label: "Password",
                controller: passwordController,
              ),
              forgotPasswordText(),
              const SizedBox(height: 40),
              signInButton(),
              const SizedBox(height: 40),
              orDivider(),
              const SizedBox(height: 40),
              googleLoginButton(),
              const SizedBox(height: 40),
              registerRow(),
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
    if (label.toLowerCase().contains("email")) {
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
