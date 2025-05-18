import 'package:flutter/material.dart';
import 'package:revva/models/deposit_model.dart';
import 'package:get/get.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1b232a),
      appBar: AppBar(
        title: const Text(
          'Deposit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0XFF1b232a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Rp ',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: DepositModel.formattedAmount,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                _buildNumberButton(1),
                _buildNumberButton(2),
                _buildNumberButton(3),
                _buildNumberButton(4),
                _buildNumberButton(5),
                _buildNumberButton(6),
                _buildNumberButton(7),
                _buildNumberButton(8),
                _buildNumberButton(9),
                _buildDeleteButton(),
                _buildNumberButton(0),
                _buildNextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(int number) {
    return InkWell(
      onTap: () {
        setState(() {
          DepositModel.addDigit(number);
        });
      },
      child: Container(
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return InkWell(
      onTap: () {
        setState(() {
          DepositModel.deleteLastDigit();
        });
      },
      child: Container(
        child: const Center(
          child: Icon(Icons.backspace, size: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return InkWell(
      onTap: () {
        Get.toNamed('/depositresult', arguments: DepositModel.amount);
      },
      child: Container(
        child: const Center(
          child: Icon(Icons.arrow_forward, size: 24, color: Color(0XFF4280EF)),
        ),
      ),
    );
  }
}
