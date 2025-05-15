import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:revva/models/news_model.dart';

class NewsController extends GetxController {
  var newsList = <Article>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final String apiKey = 'c26d21f1aacb4736ba09148065b95898';
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
