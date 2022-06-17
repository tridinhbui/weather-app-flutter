import 'package:flutter/material.dart';
import 'package:weather_app/Page1.dart';

import 'Page2.dart';
import 'Page3.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  int currentIndex = 0;
  List<Widget> listPage = [];

  @override
  void initState() {
    super.initState();
    listPage = [
      const Page1(),
      const Page2(),
      const Page3(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          children: listPage,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listPage.map((e) {
              return currentIndex == listPage.indexOf(e)
                  ? _indicator(true)
                  : _indicator(false);
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 3, left: 3),
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(10),
          color: isActive ? Colors.white : Colors.grey),
    );
  }
}
