import 'package:flutter/material.dart';
import 'package:news_app/screens/website.dart';
import 'package:news_app/widgets/custom_widget.dart';
import 'package:news_app/widgets/footer_widget.dart';
import 'package:news_app/widgets/search_fild.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 222, 219),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: const Icon(Icons.search, size: 30, color: Colors.orange),
            ),
            Container(
              height: screenHeight / 24,
              width: screenWidth / 3,
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 0),
                child: SearchFild(),
              ),
            ),
            const Spacer(flex: 5),
            const Row(
              children: [
                Text(
                  'news',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'app',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    shadows: [Shadow(color: Colors.orange, blurRadius: 2)],
                  ),
                ),
              ],
            ),
            const Spacer(flex: 3),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WebsiteView(
                        urlAdd: 'https://www.youtube.com/shorts/zM5cJj9Bz0A',
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.live_tv, size: 45, color: Colors.orange),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const CustomWidget(searchFor: 'General'),
            Container(
              alignment: Alignment.bottomCenter,
              child: const FooterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
