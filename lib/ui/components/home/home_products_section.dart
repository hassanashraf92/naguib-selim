import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/products/product_cell.dart';
import 'package:naguib_selim/ui/screens/product_internal_page.dart';

class HomeProductSection extends StatelessWidget {
  final List<String> images;
  final String title;
  final String buttonText;
  final VoidCallback buttonPressed;

  const HomeProductSection({
    super.key,
    required this.images,
    required this.title,
    required this.buttonText,
    required this.buttonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16),
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
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: buttonPressed,
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
          height: 188,
          child: ListView.builder(
            // padding: const EdgeInsets.only(left: 16),
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return ProductCell(
                imageUrl: images[index],
                productName: "Pandas",
                productCategory: "Fabrics",
                productPrice: "1500 EGP",
                onItemPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductInternalPage(),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
