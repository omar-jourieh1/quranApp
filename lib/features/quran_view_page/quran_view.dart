import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;

class QuranView extends StatelessWidget {
  QuranView({Key? key, required this.surahNumber, required this.fontSize})
      : super(key: key);
  int surahNumber = 1;
  double fontSize = 82.r;
  @override
  Widget build(BuildContext context) {
    int index = 0;
    int count = quran.getVerseCount(index + surahNumber);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          elevation: 0,
          toolbarHeight: 150.h,
          title: Text(
            ' ${quran.getSurahNameArabic(surahNumber)}',
            style: TextStyle(
              fontSize: 80.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: '',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      for (var i = 1; i <= count; i++) ...{
                        TextSpan(
                          text: quran.getVerse(
                            index + surahNumber,
                            i,
                          ),
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: quran.getVerseEndSymbol(i),
                          style: TextStyle(
                            color: const Color(0xff44BDA8),
                            fontSize: fontSize,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'kitab',
                          ),
                        ),
                      }
                    ],
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                )
              ],
            ),
          ),
        ));
  }
}
