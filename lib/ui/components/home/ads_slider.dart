
import 'package:flutter/material.dart';

class AdsSlider extends StatefulWidget {
  final List<String> imagesUrls;
  const AdsSlider({super.key, required this.imagesUrls});

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            itemCount: widget.imagesUrls.length,
            pageSnapping: true,
            onPageChanged: (page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  widget.imagesUrls[pagePosition],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          Align(
            alignment: const Alignment(0.5, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(widget.imagesUrls.length, _activePage),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(2),
        width: 6,
        height: 6,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }
}
