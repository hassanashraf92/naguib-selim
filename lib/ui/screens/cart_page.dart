import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/MainButton.dart';
import 'package:naguib_selim/ui/components/TextFieldWithPrefixIcon.dart';
import 'package:naguib_selim/ui/components/cart/cart_product_cell.dart';
import 'package:naguib_selim/ui/components/products/product_count.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            CartProductCell(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            ),
            CartProductCell(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            ),
            CartProductCell(),
            LineSeparator(),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFieldWithPrefixIcon(
                      placeholder: "Insert your coupon code",
                      icon: Icons.percent,
                      inputType: TextInputType.text,
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                      width: 100,
                      child:
                          MainButton(buttonText: "Apply", buttonAction: () {}))
                ],
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal"),
                        Text("1500 EGP"),
                      ],
                    ),
                  ),
                  LineSeparator(),
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping"),
                        Text("150 EGP"),
                      ],
                    ),
                  ),
                  LineSeparator(),
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text("1650 EGP"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            MainButton(
                buttonText: "Proceed to checkout",
                buttonAction: () {
                  print("Proceed");
                })
          ],
        ),
      ),
    );
  }
}

class LineSeparator extends StatelessWidget {
  const LineSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 1,
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
