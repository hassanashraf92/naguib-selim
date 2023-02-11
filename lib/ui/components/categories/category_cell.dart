import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final String imageUrl;

  const CategoryCell({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          const Align(
              alignment: Alignment(-0.7, -0.8),
              child: Text(
                "Fabrics",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ],
      ),
    );
  }
}
