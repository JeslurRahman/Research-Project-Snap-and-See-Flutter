import 'package:be_my_eyes/dragGame.dart';
import 'package:be_my_eyes/game3.dart';
import 'package:be_my_eyes/guide/guideGameMenu.dart';
import 'package:be_my_eyes/homeg.dart';
import 'package:be_my_eyes/identifyGame.dart';
import 'package:be_my_eyes/qa.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'home.dart';

class GameMenu extends StatefulWidget {
  final String name;

  const GameMenu({super.key, required this.name});

  @override
  State<GameMenu> createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  bool showGame3 = false;

  Future<void> init_fun() async {
    // /Audio/playThis
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('User/${widget.name}/game');
    starCountRef.onValue.listen((DatabaseEvent event) async {
      final data = event.snapshot.value;

      print("data sanp");
      print(data);
      if (data != null) {
        print(data);
        setState(() {
          showGame3 = true;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    init_fun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(name: widget.name),
              ),
            );
          },
        ),
        leadingWidth: 100,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuideGameMenu(name: widget.name),
                  ));
            },
            icon: Icon(Icons.info, color: Colors.white),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                IdentifyGame(name: widget.name)),
                      );
                      // Navigator.pushNamed(context, '/description');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 105, 255),
                      shape: const BeveledRectangleBorder(),
                    ),
                    child: const Text(
                      "Touch & Play",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DragGame(
                            name: widget.name,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 51, 105, 255),
                      shape: const BeveledRectangleBorder(),
                    ),
                    child: const Text(
                      "Seek Shuffle",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                showGame3
                    ? Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black54,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, '/game3');
                            Navigator.push(
                              context,
                              // MaterialPageRoute(builder: (context) => QandA()),
                              // MaterialPageRoute(builder: (context) => Homeg()),
                              MaterialPageRoute(
                                builder: (context) => Game3(
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 51, 105, 255),
                            shape: const BeveledRectangleBorder(),
                          ),
                          child: const Text(
                            "Shape Solve",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black54,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 51, 105, 255),
                            shape: const BeveledRectangleBorder(),
                          ),
                          child: const Text(
                            "Complete Game 2 First",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      textScaleFactor: 2,
    )));
  }
}
