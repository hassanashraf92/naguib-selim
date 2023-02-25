import 'package:flutter/material.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({
    super.key,
  });

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  Widget build(BuildContext context) {
    int count = 1;

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          height: 25,
          width: 25,
          child: const Center(
            child: Text(
              "-",
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        SizedBox(
          height: 25,
          width: 25,
          child: Center(
            child: Text(
              "$count".toString(),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              count = count + 1;
              print("New count: $count");
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
            ),
            height: 25,
            width: 25,
            child: const Center(
              child: Text(
                "+",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
