import 'package:flutter/material.dart';
import 'package:news_app/widgets/footer_widget.dart';
import 'package:news_app/widgets/list_view_builder.dart';
import 'package:news_app/widgets/search_fild.dart';

class CategoryView extends StatelessWidget {
  final String categoryName;
  const CategoryView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 222, 219),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: _buildAppBar(context, screenWidth, screenHeight)),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              ListViewBuilder(
                searchFor: categoryName,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: const FooterWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(
      BuildContext context, double screenWidth, double screenHeight) {
    return Row(
      children: [
        const Spacer(
          flex: 1,
        ),
        IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.orange,
          ),
        ),
        Container(
          height: screenHeight / 24,
          width: screenWidth / 3,
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.only(
              left: 0,
            ),
            child: SearchFild(),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Center(
          child: SizedBox(
            width: screenWidth / 3,
            child: Center(
              child: Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 1)],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(Icons.home, size: 30, color: Colors.orange),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
