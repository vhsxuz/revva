import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/controllers/market_controller.dart';

class Market extends StatelessWidget {
  Market({Key? key}) : super(key: key);

  // Use Get.find to get the controller instance
  final MarketController controller = Get.put(MarketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B232A),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B232A),
        iconTheme: IconThemeData(color: Color(0xFFC1C7CD)),
        leadingWidth: 200, // widen leading area to fit arrow + text
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () => Get.back(),
              splashRadius: 20,
            ),
            Text(
              'Markets',
              style: TextStyle(
                color: Color(0xFFC1C7CD),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.symbols.length,
          itemBuilder: (context, index) {
            final symbol = controller.symbols[index];

            return ListTile(
              title: Text(
                symbol,
                style: TextStyle(
                  color: Color(0xFFC1C7CD)
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() {
                    final market = controller.prices[symbol];
                    final priceText = market != null ? market.price.toStringAsFixed(2) : '...';
                    final isPositive = market != null && market.change > 0;
                    return Text(
                      '\$ $priceText',
                      style: TextStyle(color: isPositive ? Colors.green : Colors.red),
                    );
                  }),
                  const SizedBox(width: 8),
                  Obx(() {
                    final market = controller.prices[symbol];
                    final changePercent = market != null ? market.changePercent.toStringAsFixed(2) : '...';
                    final isPositive = market != null && market.change > 0;
                    return Text(
                      '(${isPositive ? '+' : ''}$changePercent%)',
                      style: TextStyle(color: isPositive ? Colors.green : Colors.red),
                    );
                  }),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}