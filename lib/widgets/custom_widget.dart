import 'package:flutter/material.dart';

import 'package:news_app/widgets/category_listview.dart';
import 'package:news_app/widgets/list_view_builder.dart';

class CustomWidget extends StatelessWidget {
  final String searchFor;
  const CustomWidget({
    super.key,
    required this.searchFor,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight / 5,
            child: const CategoryListView(),
          ),
        ),
        ListViewBuilder(
          searchFor: searchFor,
        ),
      ],
    );
  }
}
