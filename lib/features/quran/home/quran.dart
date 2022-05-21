import 'package:aqra/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;

import '../../quran_view_page/quran_view.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  int menuValue = 1;
  int fontMenuValue = 1;
  double fontSize = 82.sp;
  int pagesValue = 1;
  final int index = 0;
  bool isDark = false;

  ScrollController? scrollController = ScrollController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  double sliderValue = 0;

  @override
  void initState() {
    super.initState();
    scrollController?.initialScrollOffset;
    _audioPlayer.setAsset(Assets.audioSplash);
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 250.h,
            elevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(3, 3),
                        blurRadius: 5),
                  ],
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<int>(
                    borderRadius: BorderRadius.circular(20),
                    underline: SizedBox(),
                    isExpanded: true,
                    iconSize: 80.r,
                    alignment: Alignment.center,
                    style: TextStyle(color: Colors.black, fontSize: 50.sp),
                    iconEnabledColor: Colors.cyan,
                    dropdownColor: Colors.grey[100],
                    value: fontMenuValue,
                    items:const [
                      DropdownMenuItem(
                          value: 1,
                          child: Center(
                            child: Text(
                              'خط متوسط',
                            ),
                          )),
                      DropdownMenuItem(
                          value: 2,
                          child: Center(
                            child: Text(
                              'خط كبير',
                            ),
                          )),
                      DropdownMenuItem(
                          value: 3, child: Center(child: Text('خط صغير'))),
                    ],
                    onChanged: (value) {
                      setState(() {
                        fontMenuValue = value!;

                        if (value == 1) {
                          fontSize = 82.sp;
                        } else if (value == 2) {
                          fontSize = 100.sp;
                        } else {
                          fontSize = 62.sp;
                        }
                      });
                    }),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(30.r),
            controller: scrollController,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 1; i < 115; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (build) => QuranView(
                                      fontSize: fontSize,
                                      surahNumber: i,
                                    )));
                      },
                      child: ListTile(
                        leading: Text(
                          quran.getVerseEndSymbol(i),
                          style: TextStyle(fontSize: fontSize),
                        ),
                        title: Center(
                          child: Text(
                            quran.getSurahNameArabic(i),
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ),
                      ),
                    )
                ]),
          )),
    );
  }
}


