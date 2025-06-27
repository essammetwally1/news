import 'package:flutter/material.dart';
import 'package:news_app/widgets/list_view_builder.dart';

class CategoryCustomScroll extends StatelessWidget {
  final String searchFor;
  const CategoryCustomScroll({
    super.key,
    required this.searchFor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        ListViewBuilder(
          searchFor: searchFor,
        ),
      ],
    );
  }
}
