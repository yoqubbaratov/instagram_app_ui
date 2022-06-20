import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'feet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  final _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Instagram",
          style: TextStyle(color: Colors.grey),
        ),
        leading: IconButton(
          icon: const Icon(Feather.camera),
          color: Colors.grey,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Feather.tv),
            color: Colors.grey,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Feather.send),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            label: "Searh",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.plus_square),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.heart),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            label: "Acaunt",
          ),
        ],
      ),
    );
  }
}
