import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:privacywave/Activties/stories_activities.dart';
import 'package:privacywave/data/bottom_items.dart';
import 'package:privacywave/main.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooteer(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      children: const [
        StoriesPage(),
        StoriesPage(),
        StoriesPage(),
        StoriesPage(),
        StoriesPage(),
        StoriesPage()
      ],
    );
  }

  Widget getFooteer() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(iconItems[index],
                        color: pageIndex == index
                            ? colorItems[index]
                            : Colors.white.withOpacity(0.5)),
                    const SizedBox(
                      height: 5,
                    ),
                    Transform.rotate(
                      angle: 270 * 3.14 / 180,
                      child: Icon(Icons.play_arrow,
                          size: 15,
                          color: pageIndex == index
                              ? colorItems[index]
                              : Colors.white.withOpacity(0.5)),
                    )
                    /*Text(textItems[index], style: const TextStyle(fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),)*/
                  ],
                ),
              );
            })),
      ),
    );
  }
}
