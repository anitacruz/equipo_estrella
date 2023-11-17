import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/news_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'news_controller.g.dart';

var logger = Logger();

@riverpod
class NewsController extends _$NewsController {
  @override
  Future<List<NewsModel>> build() {
    // logger.i("Building NewsController");
    return getNewsList();
  }

  Future<List<NewsModel>> getNewsList() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final news = await db.collection("news").get();
    final newsList = news.docs.map((doc) => doc.data()).toList();
    return newsList.map((e) => NewsModel.fromMap(e)).toList();
  }
}
