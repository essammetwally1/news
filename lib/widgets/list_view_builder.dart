import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/bodyitem_model.dart';
import 'package:news_app/service/getnewsservice.dart';
import 'package:news_app/widgets/bodyitem_listview.dart';
import 'package:news_app/widgets/error_massage.dart';
import 'package:news_app/widgets/indecator_body_view.dart';

class ListViewBuilder extends StatefulWidget {
  final String searchFor;
  const ListViewBuilder({super.key, required this.searchFor});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  var future;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio()).getNews(widget.searchFor);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BodyItemModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BodyListView(
            futureArticles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const ErrorMassage();
        } else {
          return const IndecatorBodyListView();
        }
      },
    );
  }
}
