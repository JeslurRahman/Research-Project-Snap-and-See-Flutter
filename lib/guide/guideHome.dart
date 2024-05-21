import 'dart:ui';

import 'package:be_my_eyes/guide/guideGameMenu.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../gameMenu.dart';
import '../home.dart';
import '../objectGuide.dart';
import '../profile.dart';

class GuideHome extends StatefulWidget {
  final String name;
  const GuideHome({super.key, required this.name});

  @override
  State<GuideHome> createState() => _GuideHomeState();
}

class _GuideHomeState extends State<GuideHome> {
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

  bool _Object = false;
  bool _Game = false;
  bool _Profile = false;
  bool _Bot = false;

  late TutorialCoachMark tutorialCoachMark;

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

  @override
  void initState() {
    loadMusic("assets/audios/ob.mp3");
    Vibration.vibrate(duration: 1000);
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     actions: <Widget>[
    //       IconButton(
    //         // key: keyButton1,
    //         icon: const Icon(Icons.add),
    //         onPressed: () {},
    //       ),
    //       PopupMenuButton(
    //         key: keyButton1,
    //         icon: const Icon(Icons.view_list, color: Colors.white),
    //         itemBuilder: (context) => [
    //           const PopupMenuItem(
    //             child: Text("Is this"),
    //           ),
    //           const PopupMenuItem(
    //             child: Text("What"),
    //           ),
    //           const PopupMenuItem(
    //             child: Text("You Want?"),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    //   body: Container(
    //     color: Colors.white,
    //     child: Stack(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(top: 100.0),
    //           child: Align(
    //             alignment: Alignment.topCenter,
    //             child: Container(
    //               key: keyButton,
    //               color: Colors.blue,
    //               height: 100,
    //               width: MediaQuery.of(context).size.width - 50,
    //               child: Align(
    //                 alignment: Alignment.center,
    //                 child: ElevatedButton(
    //                   child: const Icon(Icons.remove_red_eye),
    //                   onPressed: () {
    //                     showTutorial();
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.center,
    //           child: SizedBox(
    //             width: 50,
    //             height: 50,
    //             child: ElevatedButton(
    //               key: keyButton2,
    //               onPressed: () {},
    //               child: Container(),
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Padding(
    //             padding: const EdgeInsets.all(50.0),
    //             child: SizedBox(
    //               width: 50,
    //               height: 50,
    //               child: ElevatedButton(
    //                 key: keyButton3,
    //                 onPressed: () {},
    //                 child: Container(),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: Padding(
    //             padding: const EdgeInsets.all(50.0),
    //             child: SizedBox(
    //               width: 50,
    //               height: 50,
    //               child: ElevatedButton(
    //                 key: keyButton4,
    //                 onPressed: () {},
    //                 child: Container(),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.centerLeft,
    //           child: Padding(
    //             padding: const EdgeInsets.all(50.0),
    //             child: SizedBox(
    //               width: 50,
    //               height: 50,
    //               child: ElevatedButton(
    //                 key: keyButton5,
    //                 onPressed: () {},
    //                 child: Container(),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //   bottomNavigationBar: Stack(
    //     children: [
    //       SizedBox(
    //         height: 50,
    //         child: Row(
    //           children: [
    //             Expanded(
    //                 child: Center(
    //               child: SizedBox(
    //                 key: keyBottomNavigation1,
    //                 height: 40,
    //                 width: 40,
    //               ),
    //             )),
    //             Expanded(
    //                 child: Center(
    //               child: SizedBox(
    //                 key: keyBottomNavigation2,
    //                 height: 40,
    //                 width: 40,
    //               ),
    //             )),
    //             Expanded(
    //               child: Center(
    //                 child: SizedBox(
    //                   key: keyBottomNavigation3,
    //                   height: 40,
    //                   width: 40,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       BottomNavigationBar(
    //         items: const <BottomNavigationBarItem>[
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.home),
    //             label: 'Home',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.business),
    //             label: 'Business',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.school),
    //             label: 'School',
    //           ),
    //         ],
    //         // currentIndex: _selectedIndex,
    //         selectedItemColor: Colors.amber[800],
    //         onTap: (index) {},
    //       ),
    //     ],
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              icon: Icon(Icons.logout, color: Colors.white))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  key: keyBottomNavigation1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 105, 255),
                      shape: const BeveledRectangleBorder(),
                    ),
                    onPressed: () async {
                      Vibration.vibrate(duration: 1000);
                      // if (_Object) {
                      //   Navigator.pushNamed(context, '/');
                      // }
                      // _Object = true;
                      await loadMusic("assets/audios/ob.mp3");
                      // Navigator.pushNamed(context, '/objectGuide');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ObjectGuide(
                                    UserName: widget.name,
                                  )));
                      // Navigator.pushNamed(context, '/home');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child:
                              Image.asset('assets/Camera Identification.png'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Snap Camera",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  key: keyBottomNavigation2,
                  child: ElevatedButton(
                    key: keyBottomNavigation5,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 105, 255),
                      shape: const BeveledRectangleBorder(),
                    ),
                    onPressed: () async {
                      Vibration.vibrate(duration: 500);
                      await loadMusic("assets/audios/g2.mp3");
                      // Navigator.pushNamed(context, '/gameMenu');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameMenu(
                            name: widget.name,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Image.asset(
                              'assets/Prepositions In Front Of.png'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Play Games",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  key: keyBottomNavigation3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 105, 255),
                      shape: const BeveledRectangleBorder(),
                    ),
                    onPressed: () async {
                      Vibration.vibrate(duration: 250);
                      Vibration.vibrate(duration: 100);
                      await loadMusic("assets/audios/profile.mp3");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(
                            name: widget.name,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Image.asset('assets/Account.png'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  key: keyBottomNavigation4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 105, 255),
                      shape: const BeveledRectangleBorder(),
                    ),
                    onPressed: () async {
                      Vibration.vibrate(duration: 250);
                      await loadMusic("assets/audios/bot.mp3");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Image.asset('assets/Messaging.png'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Chat",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
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
          player.stop();
          loadMusic("assets/audios/g2.mp3");
          Vibration.vibrate(duration: 500);
        } else if (target.identify == "keyBottomNavigation2") {
          player.stop();
          loadMusic("assets/audios/profile.mp3");
          Vibration.vibrate(duration: 250);
          Vibration.vibrate(duration: 100);
        } else if (target.identify == "keyBottomNavigation3") {
          player.stop();
          loadMusic("assets/audios/bot.mp3");
          Vibration.vibrate(duration: 250);
        } else if (target.identify == "keyBottomNavigation4") {
          player.stop();
          loadMusic(
              "assets/audios/LetsSeePlayGame.mp3"); // let see how to play game
          Vibration.vibrate(duration: 250);
        } else if (target.identify == "keyBottomNavigation5") {
          player.stop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GuideGameMenu(
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
        print("skip");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(name: "name"),
            ));
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
        enableTargetTab: true,
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
        identify: "Target 0",
        keyTarget: keyButton1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: keyButton,
        color: Colors.purple,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.previous();
                    },
                    child: const Icon(Icons.chevron_left),
                  ),
                ],
              );
            },
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: keyButton4,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Multiples content",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          TargetContent(
              align: ContentAlign.top,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Multiples content",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ))
        ],
        shape: ShapeLightFocus.RRect,
      ),
    );
    targets.add(TargetFocus(
      identify: "Target 3",
      keyTarget: keyButton5,
      contents: [
        TargetContent(
            align: ContentAlign.right,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Title lorem ipsum",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ))
      ],
      shape: ShapeLightFocus.RRect,
    ));
    targets.add(TargetFocus(
      identify: "Target 4",
      keyTarget: keyButton3,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  tutorialCoachMark.previous();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    "https://juststickers.in/wp-content/uploads/2019/01/flutter.png",
                    height: 200,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Image Load network",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(
      TargetFocus(
        identify: "Target 5",
        keyTarget: keyButton2,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Multiples contents",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          TargetContent(
              align: ContentAlign.bottom,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Multiples contents",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );

    return targets;
  }
}
