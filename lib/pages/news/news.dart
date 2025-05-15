import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/controllers/news_controller.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B232A),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B232A),
        iconTheme: IconThemeData(color: Color(0xFFC1C7CD)),
        leadingWidth: 180, // widen leading area to fit arrow + text
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () => Get.back(),
              splashRadius: 20,
            ),
            Text(
              'Latest News',
              style: TextStyle(
                color: Color(0xFFC1C7CD),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => newsController.fetchNews(),
          ),
        ],
      ),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (newsController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              newsController.errorMessage.value,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          itemCount: newsController.newsList.length,
          itemBuilder: (context, index) {
            final article = newsController.newsList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Card(
                color: const Color(0xFF2E3A45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: article.title ?? 'News Detail',
                      barrierDismissible: true,
                      contentPadding: const EdgeInsets.only(bottom: 20), // Gap below the button
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (article.urlToImage != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  article.urlToImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(height: 8),
                            Text(
                              article.content ?? 'No content available',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      textConfirm: 'Close',
                      onConfirm: () => Get.back(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Container
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[300],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: article.urlToImage != null
                              ? Image.network(
                                  article.urlToImage!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image, size: 50, color: Colors.grey,),
                                )
                              : const Icon(Icons.image, size: 50, color: Colors.grey),
                        ),
                        const SizedBox(width: 12), // Space between image and text

                        // Title and Description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title ?? 'No title',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                article.description ?? 'No description available',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}