import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aqra/core/Assets/Assets.dart';
import 'package:aqra/features/quran/home/quran.dart';
import 'package:aqra/features/sounds/sound.dart';
import 'package:aqra/features/tasbih/tasbih.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [QuranPage(), TasbihPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff44BDA8),
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(currentIndex);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.quranNav,
                  width: 100.w,
                ),
                label: 'القراءن الكريم'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.tasbihNav,
                  width: 100.w,
                ),
                label: 'المسبحة'),
          ]),
    );
  }
}
