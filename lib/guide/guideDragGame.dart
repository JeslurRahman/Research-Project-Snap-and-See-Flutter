import 'dart:ui';

import 'package:be_my_eyes/dragGame.dart';
import 'package:be_my_eyes/home.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class GuideDragGame extends StatefulWidget {
  final String name;
  const GuideDragGame({super.key, required this.name});

  @override
  State<GuideDragGame> createState() => _GuideDragGameState();
}

class _GuideDragGameState extends State<GuideDragGame> {
  late TutorialCoachMark tutorialCoachMark;
  int gameCount = 0;

  String getImageAssetForGameCount1(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/apple.jpeg';
      case 1:
        return 'assets/images/triangl.png';
      case 2:
        return 'assets/images/banana.jpg';
      case 3:
        return 'assets/images/Carrot.jpg';
      case 4:
        return 'assets/images/apple.jpeg';
      case 5:
        return 'assets/images/ball.jpg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  String getImageAssetForGameCount2(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/ball.jpg';
      case 1:
        return 'assets/images/Carrot.jpg';
      case 2:
        return 'assets/images/eggplant.jpg';
      case 3:
        return 'assets/images/banana.jpg';
      case 4:
        return 'assets/images/triangl.png';
      case 5:
        return 'assets/images/eggplant.jpg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();
  GlobalKey keyButton3 = GlobalKey();
  GlobalKey keyButton4 = GlobalKey();
  GlobalKey keyButton5 = GlobalKey();

  GlobalKey keyBottomNavigation1 = GlobalKey();
  GlobalKey keyBottomNavigation2 = GlobalKey();
  GlobalKey keyBottomNavigation3 = GlobalKey();
  GlobalKey keyBottomNavigation4 = GlobalKey();
  GlobalKey keyBottomNavigation5 = GlobalKey();
  GlobalKey keyBottomNavigation6 = GlobalKey();

  final player = AudioPlayer();

  Future loadMusic(String pathA) async {
    final duration = await player.setAsset(pathA);
    await player.play();
    player.stop();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  void initState() {
    loadMusic(
        "assets/audios/game23.mp3"); // this is the object , and i will tell you about it , you need to drag and drop me to coorect bucket
    Vibration.vibrate(duration: 1000);
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  String _color = 'red';
  String getImageAssetForGameCount(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        // loadMusic(getAudioAssetForGameCount(gameCount));
        return 'assets/images/apple.jpeg';
      case 1:
        // loadMusic(getAudioAssetForGameCount(gameCount));
        return 'assets/images/ball.jpg';
      case 2:
        // loadMusic(getAudioAssetForGameCount(gameCount));
        return 'assets/images/triangl.png';
      case 3:
        // loadMusic(getAudioAssetForGameCount(gameCount));
        return 'assets/images/banana.jpg';
      case 4:
        // loadMusic(getAudioAssetForGameCount(gameCount));
        return 'assets/images/Carrot.jpg';
      case 5:
        // loadMusic(getAudioAssetForGameCount(gameCount));
        return 'assets/images/eggplant.jpg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  String getAudioAssetForGameCount(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/Appleg.mp3';
      case 1:
        return 'assets/audios/ballg.mp3';
      case 2:
        return 'assets/audios/triangleg.mp3';
      case 3:
        return 'assets/audios/bananag.mp3';
      case 4:
        return 'assets/audios/carrotg.mp3';
      case 5:
        return 'assets/audios/eggplantg.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

  Color getColorForGameCount(int gameCount) {
    switch (gameCount) {
      case 0:
        return Colors.redAccent;
      case 1:
        return Colors.orangeAccent;
      // Add more cases for other values of gameCount
      default:
        // Default color when gameCount doesn't match any case
        return Colors.grey; // You can change this to another default color
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 51, 105, 255),
        // title: const Text(
        //   "Snap N SEE",
        //   style: TextStyle(color: Colors.white),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            SizedBox(width: 8),
            const Text(
              "snapNsee",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Container(
                key: keyBottomNavigation1,
                width: 200,
                height: 200,
                color: Colors.black54,
                child: Draggable<String>(
                  // Data is the value this Draggable stores.
                  onDragStarted: () {
                    setState(() {});
                  },
                  data: _color,
                  feedback: Material(
                    child: Container(
                      height: 170.0,
                      width: 170.0,
                      // decoration: BoxDecoration(
                      //   color: getColorForGameCount(gameCount),
                      //   // color: (gameCount == 0)
                      //   //     ? Colors.blueAccent
                      //   //     : Colors.redAccent,
                      // ),
                      child: Center(
                        child: Image.asset(
                          getImageAssetForGameCount(gameCount),
                          height: screenSize.height / 3,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    height: 150.0,
                    width: 150.0,
                    color: Colors.grey,
                    child: const Center(
                      child: Text(
                        'I was here',
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    color: getColorForGameCount(gameCount),
                    child: Center(
                      child: Image.asset(
                        getImageAssetForGameCount(gameCount),
                        height: screenSize.height / 3,
                        width: double.infinity,
                      ),
                      // child: Text(
                      //   'Drag me',
                      //   textScaleFactor: 2,
                      // ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Expanded(
              child: Container(
                key: keyBottomNavigation2,
                width: double.infinity,
                color: Colors.blue.shade300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            key: keyBottomNavigation3,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return SizedBox(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Container(
                                    color: Colors.pinkAccent,
                                    child: Center(
                                        child: Text(
                                      'Shape',
                                      textScaleFactor: 2,
                                    )),
                                  ),
                                );
                              },
                              onWillAccept: (data) {
                                return data == _color;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            key: keyBottomNavigation4,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return SizedBox(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Container(
                                    color: Colors.yellow,
                                    child: Center(
                                        child: Text(
                                      'Toy',
                                      textScaleFactor: 2,
                                    )),
                                  ),
                                );
                              },
                              onWillAccept: (data) {
                                return data == _color;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            key: keyBottomNavigation5,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return SizedBox(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Container(
                                    color: Colors.lightGreenAccent,
                                    child: Center(
                                      child: Text(
                                        'Fruit',
                                        textScaleFactor: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onWillAccept: (data) {
                                return data == _color;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            key: keyBottomNavigation6,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return SizedBox(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Container(
                                    color: Colors.deepOrangeAccent,
                                    child: Center(
                                        child: Text(
                                      'Vegetable',
                                      textScaleFactor: 2,
                                    )),
                                  ),
                                );
                              },
                              onWillAccept: (data) {
                                return data == _color;
                              },
                              // onLeave: (data) {
                              //   showSnackBarGlobal(context, 'Missed');
                              // },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.red,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: ${target.identify}');
        if (target.identify == "keyBottomNavigation1") {
          loadMusic("assets/audios/buckets.mp3"); // these are the buckets
          Vibration.vibrate(duration: 500);
        } else if (target.identify == "keyBottomNavigation2") {
          loadMusic("assets/audios/bucketShape.mp3"); // this bucket for shape
          gameCount = 2;
          Vibration.vibrate(duration: 250);
        } else if (target.identify == "keyBottomNavigation3") {
          loadMusic("assets/audios/bucketToys.mp3"); // this bucket for Toys
          Vibration.vibrate(duration: 500);
        } else if (target.identify == "keyBottomNavigation4") {
          loadMusic("assets/audios/bucketFruits.mp3"); // this bucket for Fruits
        } else if (target.identify == "keyBottomNavigation5") {
          loadMusic(
              "assets/audios/bucketVegetables.mp3"); // this bucket for Vegetables
        } else if (target.identify == "keyBottomNavigation6") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(name: widget.name),
              ));
        }
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        player.stop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DragGame(
              name: widget.name,
            ),
          ),
        );
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyBottomNavigation1,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          // TargetContent(
          //   align: ContentAlign.bottom,
          //   builder: (context, controller) {
          //     return Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         const Text(
          //           "Titulo lorem ipsum",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //             fontSize: 20.0,
          //           ),
          //         ),
          //         const Padding(
          //           padding: EdgeInsets.only(top: 10.0),
          //           child: Text(
          //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //         ElevatedButton(
          //           onPressed: () {
          //             controller.previous();
          //           },
          //           child: const Icon(Icons.chevron_left),
          //         ),
          //       ],
          //     );
          //   },
          // )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation2",
        keyTarget: keyBottomNavigation2,
        alignSkip: Alignment.topRight,
        contents: [
          // TargetContent(
          //   align: ContentAlign.top,
          //   builder: (context, controller) {
          //     return const Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           "Titulo lorem ipsum ff",
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation3",
        keyTarget: keyBottomNavigation3,
        alignSkip: Alignment.topRight,
        contents: [
          // TargetContent(
          //   align: ContentAlign.top,
          //   builder: (context, controller) {
          //     return const Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           "Titulo lorem ipsum",
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation4",
        keyTarget: keyBottomNavigation4,
        alignSkip: Alignment.topRight,
        contents: [
          // TargetContent(
          //   align: ContentAlign.bottom,
          //   builder: (context, controller) {
          //     return Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: <Widget>[
          //         Text("Lets See 2n Game"),
          //         ElevatedButton(
          //           onPressed: () {
          //             controller.previous();
          //           },
          //           child: const Icon(Icons.chevron_right),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation5",
        keyTarget: keyBottomNavigation5,
        alignSkip: Alignment.topRight,
        contents: [
          // TargetContent(
          //   align: ContentAlign.top,
          //   builder: (context, controller) {
          //     return const Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           "Titulo lorem ipsum",
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation6",
        keyTarget: keyBottomNavigation6,
        alignSkip: Alignment.topRight,
        contents: [
          // TargetContent(
          //   align: ContentAlign.top,
          //   builder: (context, controller) {
          //     return const Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           "Titulo lorem ipsum",
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
    return targets;
  }
}
