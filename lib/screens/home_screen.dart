import 'package:deuxieme_app_tuto/components/add_hashtag_component.dart';
import 'package:deuxieme_app_tuto/main.dart';
import 'package:deuxieme_app_tuto/screens/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:deuxieme_app_tuto/screens/views/list_hashtags_view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: const [
            HomeView(),
          ListHashtagsView()
        ],
      ), //permet de scroller horizontalement ou verticalement
      floatingActionButton: const AddHashtagComponent(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

           // _pageController.animateToPage(_currentIndex, duration: const Duration(seconds: 1), curve: Curves.easeInOut); pour animer
            _pageController.jumpToPage(_currentIndex);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Tags List"
          )
        ],
        )
      );
  }
}
