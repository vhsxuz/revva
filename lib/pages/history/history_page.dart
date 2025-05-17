import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction History',
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
      backgroundColor: const Color(0xFFf4f4f4),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.value.isNotEmpty) {
                return Center(
                  child: Text('Error: ${controller.errorMessage.value}'),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.historyList.length,
                itemBuilder: (context, index) {
                  final history = controller.historyList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                controller.getDisplayMonthYear(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Income: ${controller.getTotalIncome().toStringAsFixed(0)}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF797979),
                                        ),
                                      ),
                                      Text(
                                        'Spending: 0',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF797979),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: history.details.length,
                        itemBuilder: (context, detailIndex) {
                          final detail = history.details[detailIndex];
                          String getPaymentIcon(String paymentType) {
                            switch (paymentType.trim().toLowerCase()) {
                              case 'qris':
                                return 'assets/images/qr_image.png';
                              case 'cash':
                                return 'assets/images/cash_image.png';
                              case 'debit card':
                                return 'assets/images/debit_image.png';
                              case 'digital wallet':
                                return 'assets/images/bitcoin_image.png';
                              case 'credit card':
                                return 'assets/images/cc_image.png';
                              default:
                                return 'assets/images/default_image.png'; // Default jika tidak ada yang sesuai
                            }
                          }

                          return Column(
                            children: [
                              Container(
                                color: Color(0xFFFFFFFF),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                    vertical: 4.0,
                                  ),
                                  leading: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        getPaymentIcon(history.paymentType),
                                        height: 25,
                                        width: 25,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    detail.menuName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${history.paymentType}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  trailing: Text(
                                    '+Rp ${detail.quantity * detail.price}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF3ba659),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                indent: 12,
                                endIndent: 12,
                                color: Colors.grey[300],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
