import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:revva/controllers/financial_chart_controller.dart';

enum ChartType {
  bar,
  line,
  pie,
}

class FinancialChart extends StatefulWidget {
  final String title;
  final List<double> data;
  final List<String> labels;
  final ChartType chartType;

  const FinancialChart({
    super.key,
    required this.title,
    required this.data,
    required this.labels,
    required this.chartType,
  });

  @override
  State<FinancialChart> createState() => _FinancialChartState();
}

class _FinancialChartState extends State<FinancialChart> {
  late final FinancialChartController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FinancialChartController());
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    double total = widget.data.reduce((a, b) => a + b);
    double percentageChange = widget.data.length > 1
        ? ((widget.data.last - widget.data.first) / widget.data.first * 100)
        : 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              formatter.format(total),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              '+${percentageChange.toStringAsFixed(1)}% from last year',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: widget.chartType == ChartType.bar
                  ? Obx(() => BarChart(_buildBarChart()))
                  : widget.chartType == ChartType.line
                      ? LineChart(_buildLineChart())
                      : PieChart(_buildPieChart()),
            ),
          ],
        ),
      ),
    );
  }

  BarChartData _buildBarChart() {
    final Color selectedColor = const Color(0xFF2F3C47);
    final Color defaultColor = Colors.grey.shade300;

    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: widget.data.reduce((a, b) => a > b ? a : b) * 1.2,
      barGroups: List.generate(widget.data.length, (index) {
        final isSelected = controller.selectedBarIndex.value == index;
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: widget.data[index],
              width: 50,
              color: isSelected ? selectedColor : defaultColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
          showingTooltipIndicators: isSelected ? [0] : [],
        );
      }),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, _) => Text(widget.labels[value.toInt()]),
          ),
        ),
      ),
      barTouchData: BarTouchData(
        touchCallback: (FlTouchEvent event, BarTouchResponse? response) {
          if (event is FlTapUpEvent && response?.spot != null) {
            final tappedIndex = response!.spot!.touchedBarGroupIndex;
            controller.selectBar(tappedIndex);
          }
        },
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) {
            // group.x corresponds to the index of the bar
            final isSelected = controller.selectedBarIndex.value == group.x;
            return isSelected ? selectedColor.withAlpha(255) : Colors.grey.shade700;
          },
          tooltipPadding: const EdgeInsets.all(8),
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(rod.toY),
              TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }


  LineChartData _buildLineChart() {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            widget.data.length,
            (index) => FlSpot(index.toDouble(), widget.data[index]),
          ),
          isCurved: true,
          color: const Color(0xFF2F3C47),
          barWidth: 3,
          dotData: FlDotData(show: false),
        ),
      ],
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, _) => Text(widget.labels[value.toInt()]),
          ),
        ),
      ),
    );
  }

  Color lighten(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  PieChartData _buildPieChart() {
    final baseColor = const Color(0xFF2F3C47);
    final totalSlices = widget.data.length;

    return PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 0,
      sections: List.generate(totalSlices, (index) {
        // Calculate lightness variation step based on index
        // We'll generate colors from lighter to darker in the baseColor range
        final double step = (index / (totalSlices - 1)).clamp(0, 1);

        // Interpolate lightness between lighten and darken
        final color = HSLColor.fromColor(baseColor).withLightness(
          (HSLColor.fromColor(baseColor).lightness * (1 - step) + 
          (HSLColor.fromColor(baseColor).lightness + 0.4).clamp(0,1) * step
          ).clamp(0.0, 1.0),
        ).toColor();

        return PieChartSectionData(
          value: widget.data[index],
          title: widget.labels[index],
          titlePositionPercentageOffset: 0.65,
          titleStyle: TextStyle(
            color: Colors.white
          ),
          color: color,
          radius: 110,
        );
      }),
    );
  }
}
