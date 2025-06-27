import 'package:flutter/material.dart';
import 'package:news_app/screens/category_view.dart';

class CategoryTextButtom extends StatelessWidget {
  final String categoryName;
  const CategoryTextButtom({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(120, 40)),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 12)),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryView(categoryName: categoryName),
            ),
          );
        },
        child: Text(
          categoryName,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.orange,
                blurRadius: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
