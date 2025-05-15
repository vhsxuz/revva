import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
    return Text("OTP", style: TextStyle(fontSize: 20, color: Colors.white));
  }

  Widget resendCodeText() {
    return const Center(
      child: Text(
        'Resend code (30)',
        style: TextStyle(
          color: Color(0xFFA7AFB7),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget resendLinkText() {
    return const Center(
      child: Text(
        'Resend Link',
        style: TextStyle(
          color: Color(0xFF4280EF),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget otpButton() {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Color(0xff4280EF),
        ),
        onPressed: () {},
        child: const Text('Continue', style: TextStyle(color: Colors.white)),
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
              const OtpInputFields(),
              const SizedBox(height: 16),
              resendCodeText(),
              const SizedBox(height: 8),
              resendLinkText(),
              const SizedBox(height: 20),
              otpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpInputFields extends StatefulWidget {
  const OtpInputFields({super.key});

  @override
  State<OtpInputFields> createState() => _OtpInputFieldsState();
}

class _OtpInputFieldsState extends State<OtpInputFields> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Container(
          width: 51,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF161C22),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 3) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}
