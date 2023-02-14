import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/categories/category_cell.dart';
import 'package:naguib_selim/ui/screens/products_page.dart';

class HomeCategoriesSection extends StatelessWidget {
  final List<String> images;
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback onItemPressed;

  const HomeCategoriesSection({
    super.key,
    required this.images,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
    required this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF5C5C5C),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: onButtonPressed,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: CategoryCell(
                    imageUrl: images[index],
                    categoryPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsPage(),
                        ),
                      );
                    },
                  ));
            }),
          ),
        ),
      ],
    );
  }
}
