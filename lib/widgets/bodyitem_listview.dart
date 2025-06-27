import 'package:flutter/material.dart';
import 'package:news_app/models/bodyitem_model.dart';
import 'package:news_app/widgets/bodyitem_widget.dart';

class BodyListView extends StatelessWidget {
  final List<BodyItemModel> futureArticles;

  const BodyListView({super.key, required this.futureArticles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: futureArticles.length,
        (context, index) {
          return BodyItemWidget(
            bodyItemModel: futureArticles[index],
            index: index,
            bodyItemModelS: futureArticles,
          );
        },
      ),
    );
  }
}
