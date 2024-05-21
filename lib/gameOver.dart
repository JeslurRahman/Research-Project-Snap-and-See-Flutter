import 'package:be_my_eyes/gameMenu.dart';
import 'package:be_my_eyes/profile.dart';
import 'package:flutter/material.dart';

class GameOver extends StatefulWidget {
  final String level;
  final String name;
  final String time;
  const GameOver(
      {super.key, required this.level, required this.name, required this.time});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Color.fromARGB(255, 51, 105, 255),
            width: double.infinity,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Game Over!",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Text(
                  widget.level == "0" ? "" : "${widget.level}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.level == "0" ? "" : "Level Time: ${widget.time} s",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                widget.level == "0"
                    ? SizedBox(
                        width: 150,
                      )
                    : SizedBox(
                        width: 250,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Profile(name: widget.name),
                                ),
                              );
                            },
                            child: Text("Suggestions")),
                      ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameMenu(name: widget.name),
                          ),
                        );
                      },
                      child: Text("Close")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
