import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/config/component/appBar/main_app_bar.dart';
import 'package:revva/config/component/bottomNav/main_bottom_nav.dart';
import 'package:revva/config/component/financial_chart/financial_chart.dart';
import 'package:revva/config/component/totalBalanceCard/total_balance_card.dart';
import 'package:revva/controllers/total_balance_card_controller.dart';

class Finance extends StatelessWidget {
  const Finance({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(TotalBalanceCardController());

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: const MainAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const TotalBalanceCard(),
                  const SizedBox(height: 20),
                  FinancialChart(
                    title: 'Monthly Expenses',
                    data: [15000000, 25000000, 7500000, 80000000],
                    labels: ['JAN', 'FEB', 'MAR', 'APR'],
                    chartType: ChartType.bar,
                  ),
                  const SizedBox(height: 20),
                  FinancialChart(
                    title: 'Gross Profit Income',
                    data: [30000000, 40000000, 35000000, 50000000],
                    labels: ['Q1', 'Q2', 'Q3', 'Q4'],
                    chartType: ChartType.line,
                  ),
                  const SizedBox(height: 20),
                  FinancialChart(
                    title: 'Revenue Distribution',
                    data: [25000000, 30000000, 20000000, 25000000],
                    labels: ['Americano', 'Espresso', 'Croissant', 'Toast'],
                    chartType: ChartType.pie,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MainBottomNav(),
          ),
        ],
      ),
    );
  }
}
