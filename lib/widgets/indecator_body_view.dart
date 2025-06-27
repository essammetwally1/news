import 'package:flutter/material.dart';

class IndecatorBodyListView extends StatelessWidget {
  const IndecatorBodyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 200,
          ),
          height: 150,
          width: 150,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Color.fromARGB(255, 238, 165, 55),
            ),
            strokeWidth: 5,
          ),
        ),
      ),
    );
  }
}
