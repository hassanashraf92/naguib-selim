import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/home/home_categories_section.dart';
import 'package:naguib_selim/ui/components/home/ads_slider.dart';
import 'package:naguib_selim/ui/components/home/home_products_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ]; // For testing purposes only.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: AdsSlider(imagesUrls: _images),
          ),
          HomeCategoriesSection(
            images: _images, // To be replaced with categories list.
            title: "Categories",
            buttonText: "View all",
            onButtonPressed: () {},
            onItemPressed: () {},
          ),
          HomeProductSection(
            images: _images, //To be replaced with product list.
            title: "Best Selling",
            buttonText: "View all",
            buttonPressed: () {
              print("Home Best Selling Pressed");
            },
          ),
          HomeProductSection(
            images: _images, //To be replaced with products list.
            title: "Featured Products",
            buttonText: "View all",
            buttonPressed: () {
              print("Home Featured Products Pressed");
            },
          ),
        ],
      )),
    );
  }
}
