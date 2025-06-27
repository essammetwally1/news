import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_textbutton.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Entertainment',
      'Business',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        return Container(
          width: constraints.maxWidth - 25,
          height: constraints.maxHeight / 14,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(221, 124, 124, 124),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.orange,
                blurRadius: 0,
              )
            ],
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: categories.length,
            separatorBuilder: (context, index) => VerticalDivider(
              color: Colors.orange.withOpacity(0.5),
              thickness: 1,
              width: isSmallScreen ? 4 : 12,
              indent: 10,
              endIndent: 10,
            ),
            itemBuilder: (context, index) => Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isSmallScreen ? 4 : 8),
                child: CategoryTextButtom(
                  categoryName: categories[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
