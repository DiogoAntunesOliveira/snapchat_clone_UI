import 'package:flutter/material.dart';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_player/video_player.dart';

class StoryDeatailPage extends StatefulWidget {
  final String videoUrl;

  const StoryDeatailPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _StoryDeatailPageState createState() => _StoryDeatailPageState();
}

class _StoryDeatailPageState extends State<StoryDeatailPage> {
  late VideoPlayerController _controller;
  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _controller.addListener((){
      setState(() {});
    });
    _controller.initialize().then((value) => setState(() {}));
    _controller.play();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(width: size.width, height: size.height, child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: VideoPlayer(_controller),
          )),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0)
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      MaterialIcons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 28,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Text(
                          "View more Episodes",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.2),
                      border: Border.all(color: Colors.white.withOpacity(0.2))),
                  child: const Center(
                    child: Icon(
                      FontAwesome.location_arrow,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          _controller.pause();
          _controller.removeListener(() { });
        },
        icon: const Icon(Icons.close),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              AntDesign.like2,
              size: 20,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Entypo.dots_three_vertical,
              size: 20,
            ))
      ],
    );
  }
}
