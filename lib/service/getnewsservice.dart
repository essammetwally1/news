import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/bodyitem_model.dart';

class NewsService {
  final Dio dio;

  const NewsService({required this.dio});

  Future<List<BodyItemModel>> getNews(String searchFor) async {
    final String apiKey = dotenv.env['API_KEY'] ?? '';

    try {
      final Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$searchFor&apiKey=$apiKey&language=en&searchIn=description',
      );

      List<dynamic> articles = response.data['articles'];
      List<BodyItemModel> articlesView = [];

      for (var article in articles) {
        if (article['urlToImage'] != null &&
            article['title'] != null &&
            article['description'] != null &&
            article['url'] != null) {
          articlesView.add(BodyItemModel.fromJson(article));
        }
      }

      return articlesView;
    } catch (e) {
      print('NewsService error: $e');
      return [];
    }
  }
}
