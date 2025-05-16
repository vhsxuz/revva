import 'package:flutter/material.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  Widget logoWidget() {
    return Center(
      child: Container(
        width: 352,
        height: 330,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/revva_logo_grey.png'),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF1B232A),
      centerTitle: true,
      elevation: 0,
      leading: const IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: null,
      ),
      title: const Text(
        'Referral Code',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget invitationText() {
    return Text(
      "Friends",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFFC1C7CD),
      ),
    );
  }

  Widget friendListItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF2F3C47),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.person, size: 30, color: Color(0xFF747E87)),
          ),
          const SizedBox(width: 20),
          // Texts (Friend name + Phone number)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Friend 1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: true,
                ),
                SizedBox(height: 4),
                Text(
                  "+62 898 0931 0091",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1B232A),
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ListView(
            children: [
              logoWidget(),
              CustomReferralCodeField(label: "AND902"),
              const SizedBox(height: 20),
              invitationText(),
              const SizedBox(height: 10),
              friendListItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomReferralCodeField extends StatelessWidget {
  const CustomReferralCodeField({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Center(
        child: Container(
          width: 293,
          height: 51,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF2F3C47), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.copy,
                  color: Color(0xFF4280EF),
                  size: 23,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
