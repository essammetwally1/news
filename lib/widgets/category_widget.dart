import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_view.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryWidget({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(categoryName: categoryModel.categoryName);
            },
          ),
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return categoryModel.page;
        //     },
        //   ),
        // );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              top: 5,
            ),
            height: screenHeight / 7.5,
            width: screenWidth / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 167, 165, 163),
                  blurRadius: 5,
                  offset: Offset(0, 25),
                ),
              ],
              image: DecorationImage(
                  image: AssetImage(categoryModel.categoryImage),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(221, 124, 124, 124),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 1,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                categoryModel.categoryName,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
