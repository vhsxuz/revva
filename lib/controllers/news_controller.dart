import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:revva/models/news_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsController extends GetxController {
  var newsList = <Article>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final String apiKey = dotenv.env['NEWS_API_KEY'] ?? 'No API Key';
  final String baseUrl = 'https://newsapi.org/v2/everything';
  final Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews({String query = 'technology'}) async {
    try {
      isLoading.value = true;
      final response = await dio.get(
        baseUrl,
        queryParameters: {
          'q': query,
          'apiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = NewsModel.fromJson(response.data);
        newsList.value = data.articles ?? [];
      } else {
        errorMessage.value = 'Failed to load news';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
