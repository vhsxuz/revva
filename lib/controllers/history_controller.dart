import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:revva/models/history_model.dart';

class HistoryController extends GetxController {
  var historyList = <HistoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final String baseUrl = "https://revva-service.vercel.app/api/v1/transaction";
  final Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    try {
      isLoading.value = true;
      print("Fetching history data...");
      final response = await dio.get(baseUrl);
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");
      if (response.statusCode == 200) {
        historyList.value =
            (response.data['data'] as List)
                .map((json) => HistoryModel.fromJson(json))
                .toList();
        errorMessage.value = '';
      } else {
        errorMessage.value = 'Failed to fetch data';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchHistoryById(String id) async {
    try {
      isLoading.value = true;
      final response = await dio.get('$baseUrl/$id');
      if (response.statusCode == 200) {
        final history = HistoryModel.fromJson(response.data);
        historyList.value = [history];
        errorMessage.value = '';
      } else {
        errorMessage.value = 'Failed to fetch data';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Di HistoryController
  String getDisplayMonthYear() {
    if (historyList.isEmpty) return 'No transactions';

    // Ambil semua tanggal created_at
    final dates = historyList.map((h) => h.transactionDate).toList();

    // Cari tanggal terbaru
    DateTime? latestDate;
    for (var dateStr in dates) {
      try {
        final date = DateTime.parse(dateStr);
        if (latestDate == null || date.isAfter(latestDate)) {
          latestDate = date;
        }
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    if (latestDate == null) return 'No valid dates';

    // Format menjadi "Month Year" (contoh: May 2025)
    return '${_getMonthName(latestDate.month)} ${latestDate.year}';
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  // Dalam HistoryController
  double getTotalIncome() {
    double total = 0;
    for (var history in historyList) {
      for (var detail in history.details) {
        total += detail.quantity * detail.price;
      }
    }
    return total;
  }
}
