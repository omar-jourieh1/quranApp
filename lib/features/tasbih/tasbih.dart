import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets/assets.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({Key? key}) : super(key: key);

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  int count = 0;
  String word = '';
  String seletedItem = Assets.beadOne;
  CarouselController? carouselController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 250.h,
            elevation: 0,
            
            flexibleSpace:Padding(
              padding: const EdgeInsets.all(25.0),
              child:          Container(
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
              child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                    underline: SizedBox(),
                    isExpanded: true,
                    alignment: Alignment.center,
                  iconSize: 80.r,
                  style: TextStyle(color: Colors.black, fontSize: 50.sp),
                  iconEnabledColor: Colors.cyan,
                  dropdownColor: Colors.grey[100],
                  value: seletedItem,
                  items: const [
                    DropdownMenuItem(
                      value: Assets.beadOne,
                      child: Center(
                        child: Text(
                          'الشكل الأول',
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                        value: Assets.beadTwo, child: Center(child: Text('الشكل الثاني'))),
                    DropdownMenuItem(
                        value: Assets.beadOThree, child: Center(child: Text('الشكل الثالث'))),
                  ],
                  onChanged: (value) {
                    setState(() {
                      seletedItem = value!;
                    });
                  }),
            ),
         )
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$count ' + word,
                  style:
                      const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                imageSlider(context)
              ],
            ),
        ),
      ),
    );
  }

  imageSlider(BuildContext context) {
    return CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: count,
        
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Image.asset(seletedItem),
        options: CarouselOptions(
          height: 500,
          viewportFraction: 0.2,
          initialPage: 0,
          enableInfiniteScroll: true,
          
          reverse: false,
          enlargeCenterPage: true,
          onPageChanged: (change, index) {
            setState(() {
                count++;
                if (count < 30) word = 'سبحان الله';
                if (count == 30) word = 'الحمد الله';
                if (count == 60) word = 'الله اكبر';
                if (count >= 100) count = 0;
              
            });
          },
          scrollDirection: Axis.vertical,
        ));
  }
}
