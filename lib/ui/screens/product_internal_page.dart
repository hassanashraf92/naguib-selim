import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:naguib_selim/ui/components/MainButton.dart';
import 'package:naguib_selim/ui/components/home/home_products_section.dart';
import 'package:naguib_selim/ui/components/products/product_count.dart';
import 'package:naguib_selim/ui/screens/cart_page.dart';

class ProductInternalPage extends StatefulWidget {
  const ProductInternalPage({super.key});

  @override
  State<ProductInternalPage> createState() => _ProductInternalPageState();
}

class _ProductInternalPageState extends State<ProductInternalPage> {
  final List<String> _images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ]; // For testing purposes only.

  final List<String> _productImages = [
    "assets/product_01.png",
    "assets/product_02.png",
    "assets/product_03.png",
    "assets/product_01.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Product Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sofia Sofa",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Image.asset(
                  "assets/product_01.png",
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.width / _productImages.length,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _productImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width /
                                _productImages.length -
                            (_productImages.length * 2),
                        height: MediaQuery.of(context).size.width /
                            _productImages.length,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Image.asset(
                            _productImages[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1500 EGP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ProductCounter(),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      "Colors: ",
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          0xFF5C5C5C,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Sofia Sofa is a mid-century modern design has never looked so posh. Her two-seat, vintage shape is modernly revamped by KOKET with her plush curves being cupped by a lustrous, linear metal base.",
                  style: TextStyle(
                    color: Color(
                      0xFF1A1E1F,
                    ),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                HomeProductSection(
                  images: _images,
                  title: "Related Products",
                  buttonText: "See all",
                  buttonPressed: () {
                    print("Sell all inside product internal page is pressed!");
                  },
                ),
                SizedBox(
                  height: 88,
                ),
              ],
            ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 48,
            child: MainButton(
                buttonText: "Add to Cart",
                buttonAction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
