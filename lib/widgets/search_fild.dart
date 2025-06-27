import 'package:flutter/material.dart';
import 'package:news_app/screens/category_view.dart';

class SearchFild extends StatefulWidget {
  const SearchFild({
    super.key,
  });

  @override
  State<SearchFild> createState() => _SearchFildState();
}

class _SearchFildState extends State<SearchFild> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void clearText() {
    myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.orange,
      // autofocus: false,
      focusNode: _focusNode,
      // textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.bottom, // Center text vertically

      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ), // Border radius
          borderSide: BorderSide(
            color: Colors.white, // Border color when enabled
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ), // Border radius when focused
          borderSide: BorderSide(
            color: Colors.white, // Border color when focused
          ),
        ),
        hintMaxLines: 1,
        hintText: _isFocused ? '' : 'Search...',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 240, 184, 81),
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: myController,
      onSubmitted: (myController) {
        if (myController.isNotEmpty) {
          clearText();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CategoryView(categoryName: myController);
              },
            ),
          );
        }
      },
    );
  }
}
