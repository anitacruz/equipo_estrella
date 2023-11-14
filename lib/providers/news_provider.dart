import 'package:equipo_estrella/controllers/news_controller.dart';
import 'package:equipo_estrella/models/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider = Provider<NewsController>((ref) {
  return NewsController();
});

final newsListProvider = FutureProvider<List<NewsModel>>(
  (ref) => ref.read(newsProvider).getNewsList(),
);
