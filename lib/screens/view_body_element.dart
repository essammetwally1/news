import 'package:flutter/material.dart';
import 'package:news_app/models/bodyitem_model.dart';
import 'package:news_app/screens/website.dart';

class ViewBodyElement extends StatelessWidget {
  final List<BodyItemModel> bodyItemModelS;
  final int index;
  const ViewBodyElement({
    super.key,
    required this.bodyItemModelS,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight - 30,
            child: Column(
              children: [
                IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (index >= 1) {
                            return ViewBodyElement(
                              bodyItemModelS: bodyItemModelS,
                              index: index - 1,
                            );
                          } else {
                            return ViewBodyElement(
                              bodyItemModelS: bodyItemModelS,
                              index: index,
                            );
                          }
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_upward,
                    size: 70,
                    color: Colors.orange,
                  ),
                ),
                const Spacer(flex: 1),
                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    // Detect swipe up (dragging from bottom to top)
                    if (details.primaryDelta != null && index >= 1) {
                      //==> bodyItemElement[0]
                      ViewBodyElement(
                        bodyItemModelS: bodyItemModelS,
                        index: index - 1,
                      );
                    } else {
                      ViewBodyElement(
                        bodyItemModelS: bodyItemModelS,
                        index: index,
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      //
                      color: Colors.white, //
                      borderRadius: BorderRadius.circular(8), //
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 2),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 2,
                          ),
                          child: Container(
                            width: screenWidth,
                            height: screenHeight / 3,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                  bodyItemModelS[index].imageAdd,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            bodyItemModelS[index].title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          width: screenWidth - 50,
                          margin: const EdgeInsets.only(left: 15, bottom: 10),
                          child: Text(
                            bodyItemModelS[index].description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 71, 71, 71),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                        if (bodyItemModelS[index].url.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              width: screenWidth - 200,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(120, 40),

                                  backgroundColor:
                                      Colors.orange[700], // Orange background
                                  foregroundColor: Colors.white, // White text
                                  elevation: 4,
                                  shadowColor: Colors.orange.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return WebsiteView(
                                          urlAdd: bodyItemModelS[index].url,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: const Center(
                                  child: Text(
                                    'View Website',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ViewBodyElement(
                            bodyItemModelS: bodyItemModelS,
                            index: index + 1,
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_downward,
                    size: 70,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
