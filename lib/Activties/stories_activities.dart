import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:privacywave/Activties/story_details_activities.dart';

import '../data/stories_json.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 20),
              child: Text(
                "For You",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(stories_data.length, (index) {
                  return Container(
                    width: (size.width - 30) / 2,
                    height: 250,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: StoryDeatailPage(
                                  videoUrl: stories_data[index]['videoUrl'],
                                ),
                                type: PageTransitionType.scale,
                                alignment: Alignment.bottomCenter));
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: (size.width - 30) / 2,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        stories_data[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: (size.width - 30) / 2,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.25),
                                      Colors.black.withOpacity(0)
                                    ],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    stories_data[index]['name'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 10, top: 10),
                                  child: Text(
                                    stories_data[index]['date'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.1),
                ),
                child: const Icon(
                  Entypo.user,
                  color: Colors.yellow,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.1),
                ),
                child: const Icon(
                  Feather.search,
                  color: Colors.blueGrey,
                  size: 23,
                ),
              ),
            ],
          ),
          const Text(
            "Stories",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.1),
                ),
                child: const Icon(
                  Feather.user_plus,
                  color: Colors.blueGrey,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.1),
                ),
                child: const Icon(
                  Entypo.dots_three_horizontal,
                  color: Colors.blueGrey,
                  size: 23,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
