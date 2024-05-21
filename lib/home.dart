import 'package:be_my_eyes/gameMenu.dart';
import 'package:be_my_eyes/guide/guideHome.dart';
import 'package:be_my_eyes/objectGuide.dart';
import 'package:be_my_eyes/profile.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';

import 'description.dart';

class Home extends StatefulWidget {
  final String name;

  const Home({super.key, required this.name});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
            icon: Icon(Icons.logout, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuideHome(name: widget.name),
                  ));
            },
            icon: Icon(Icons.info, color: Colors.white),
          )
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
                  child: ElevatedButton(
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 105, 255),
                      shape: const BeveledRectangleBorder(),
                    ),
                    onPressed: () async {
                      Vibration.vibrate(duration: 250);
                      await loadMusic("assets/audios/bot.mp3");
                      Navigator.pushNamed(context, '/assistant');
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
}
