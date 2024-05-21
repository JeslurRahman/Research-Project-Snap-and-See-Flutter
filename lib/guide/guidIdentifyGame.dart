import 'dart:ui';

import 'package:be_my_eyes/guide/guideDragGame.dart';
import 'package:be_my_eyes/identifyGame.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class GuideIdentifyGame extends StatefulWidget {
  final String name;
  const GuideIdentifyGame({super.key, required this.name});

  @override
  State<GuideIdentifyGame> createState() => _GuideIdentifyGameState();
}

class _GuideIdentifyGameState extends State<GuideIdentifyGame> {
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
    // there are two buttons , you need to listtn istruction and click button up or down
    loadMusic("assets/audios/idfGamein.mp3");
    Vibration.vibrate(duration: 1000);
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
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
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            key: keyBottomNavigation1,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                key: keyBottomNavigation2,
                onPressed: () async {
                  Vibration.vibrate(duration: 1000);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                // child: const Text("vib1000"),
                child: Image.asset(
                  // 'assets/images/apple.jpeg',
                  getImageAssetForGameCount1(gameCount),
                  height: screenSize.height / 3,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              SizedBox(
                key: keyBottomNavigation4,
              ),
              ElevatedButton(
                key: keyBottomNavigation3,
                onPressed: () async {
                  Vibration.vibrate(duration: 500);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Image.asset(
                  // 'assets/images/ball.jpg',
                  getImageAssetForGameCount2(gameCount),
                  height: screenSize.height / 3,
                  width: double.infinity,
                ),
              ),
            ],
          ),
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
          loadMusic("assets/audios/AB2.mp3");
          Vibration.vibrate(duration: 500);
        } else if (target.identify == "keyBottomNavigation2") {
          loadMusic("assets/audios/yesApple.mp3"); // yes its apple
          gameCount = 2;
          Vibration.vibrate(duration: 250);
        } else if (target.identify == "keyBottomNavigation3") {
          loadMusic(
              "assets/audios/lestseeg2g3.mp3"); // lets see how to play game 2
          // Vibration.vibrate(duration: 500);
        } else if (target.identify == "keyBottomNavigation4") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GuideDragGame(
                name: widget.name,
              ),
            ),
          );
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
            builder: (context) => IdentifyGame(
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
        focusAnimationDuration: Duration(seconds: 1),
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
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Lets See 2n Game"),
                  ElevatedButton(
                    onPressed: () {
                      controller.skip();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideDragGame(
                            name: widget.name,
                          ),
                        ),
                      );
                      controller.skip();
                    },
                    child: const Icon(Icons.chevron_right),
                  ),
                ],
              );
            },
          ),
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
    return targets;
  }
}
