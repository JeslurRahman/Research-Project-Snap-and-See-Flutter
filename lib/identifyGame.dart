import 'package:be_my_eyes/gameMenu.dart';
import 'package:be_my_eyes/gameOver.dart';
import 'package:be_my_eyes/guide/guidIdentifyGame.dart';
import 'package:be_my_eyes/service/apiDio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';

class IdentifyGame extends StatefulWidget {
  final String name;
  const IdentifyGame({super.key, required this.name});

  @override
  State<IdentifyGame> createState() => _IdentifyGameState();
}

class _IdentifyGameState extends State<IdentifyGame> {
  final player = AudioPlayer();
  int gameCount = 0;

  @override
  void initState() {
    loadMusic("assets/audios/AB2.mp3");
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  Future loadMusic(String pathA) async {
    player.setAsset(pathA);
    player.play();
    // player.stop();
  }

  Future loadMusic_wait(String pathA) async {
    final duration = await player.setAsset(pathA);
    await player.play();
    player.stop();
  }

  String getAudioAssetForGameCount(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/AB2.mp3';
      case 1:
        return 'assets/audios/CT.mp3';
      case 2:
        return 'assets/audios/BE.mp3';
      case 3:
        return 'assets/audios/BC.mp3';
      case 4:
        return 'assets/audios/AT.mp3';
      case 5:
        return 'assets/audios/BE2.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

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

  int attempt = 0;

  int gameMark1 = 0; // up f
  int gameMark2 = 0; // down v
  int gameMark3 = 0; // up f
  int gameMark4 = 0; // up v
  int gameMark5 = 0; // down s
  int gameMark6 = 0; // up t

  int timeDuration0 = 0;
  int timeDuration1 = 0;
  int timeDuration2 = 0;
  int timeDuration3 = 0;
  int timeDuration4 = 0;
  int timeDuration5 = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            player.stop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameMenu(name: widget.name),
              ),
            );
          },
        ),
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
              player.stop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuideIdentifyGame(name: widget.name),
                  ));
            },
            icon: Icon(Icons.info, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  Vibration.vibrate(duration: 1000);
                  if (gameCount == 0) {
                    if (attempt == 0) {
                      setState(() {
                        gameMark1++;
                        attempt = 0;
                        gameCount++;
                      });
                      player.stop();
                      await loadMusic(getAudioAssetForGameCount(gameCount));
                    } else {
                      setState(() {
                        gameCount++;
                        attempt = 0;
                      });
                      player.stop();
                      await loadMusic(getAudioAssetForGameCount(gameCount));
                    }
                  } else if (gameCount == 2) {
                    if (attempt == 0) {
                      setState(() {
                        gameMark3++;
                        attempt = 0;
                        gameCount++;
                      });
                      player.stop();
                      await loadMusic(getAudioAssetForGameCount(gameCount));
                    } else {
                      setState(() {
                        gameCount++;
                        attempt = 0;
                      });
                      player.stop();
                      await loadMusic(getAudioAssetForGameCount(gameCount));
                    }
                  } else if (gameCount == 3) {
                    if (attempt == 0) {
                      setState(() {
                        gameMark4++;
                        attempt = 0;
                        gameCount++;
                      });
                      player.stop();
                      await loadMusic(getAudioAssetForGameCount(gameCount));
                    } else {
                      setState(() {
                        gameCount++;
                        attempt = 0;
                      });
                      player.stop();
                      await loadMusic(getAudioAssetForGameCount(gameCount));
                    }
                  } else if (gameCount == 5) {
                    if (attempt == 0) {
                      setState(() {
                        gameMark6++;
                        attempt = 0;
                      });
                      // loadMusic(getAudioAssetForGameCount(gameCount));
                      // await apiDio().addChildRate(
                      //     gameMark1,
                      //     gameMark2,
                      //     gameMark3,
                      //     gameMark4,
                      //     gameMark5,
                      //     gameMark6,
                      //     timeDuration0,
                      //     timeDuration1,
                      //     timeDuration2,
                      //     timeDuration3,
                      //     timeDuration4,
                      //     timeDuration5);

                      setState(() {
                        gameCount++;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameOver(
                            level: "0",
                            name: widget.name,
                            time: '',
                          ),
                        ),
                      );
                    } else {
                      // await apiDio().addChildRate(
                      //     gameMark1,
                      //     gameMark2,
                      //     gameMark3,
                      //     gameMark4,
                      //     gameMark5,
                      //     gameMark6,
                      //     timeDuration0,
                      //     timeDuration1,
                      //     timeDuration2,
                      //     timeDuration3,
                      //     timeDuration4,
                      //     timeDuration5);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameOver(
                            level: "0",
                            name: widget.name,
                            time: '',
                          ),
                        ),
                      );
                      setState(() {
                        gameCount++;
                        attempt = 0;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameOver(
                            level: "0",
                            name: widget.name,
                            time: '',
                          ),
                        ),
                      );
                    }
                  } else if (gameCount == 1 || gameCount == 4) {
                    setState(() {
                      attempt++;
                      debugPrint('test $attempt');
                    });
                    player.stop();
                    await loadMusic_wait("assets/audios/NT.mp3");
                    await loadMusic(getAudioAssetForGameCount(gameCount));
                    //tryAgain
                  }
                  // await loadMusic("assets/audios/appleRG.mp3");
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => QuestionTwo()));
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
              ElevatedButton(
                onPressed: () async {
                  Vibration.vibrate(duration: 500);
                  // await loadMusic("assets/audios/NoBall.mp3");
                  // await loadMusic("assets/audios/tb.mp3");
                  if (gameCount == 1) {
                    if (attempt == 0) {
                      setState(() {
                        gameMark2++;
                        attempt = 0;
                        gameCount++;
                      });
                      player.stop();
                      loadMusic(getAudioAssetForGameCount(gameCount));
                    } else {
                      setState(() {
                        gameCount++;
                        attempt = 0;
                      });
                      player.stop();
                      loadMusic(getAudioAssetForGameCount(gameCount));
                    }
                  } else if (gameCount == 4) {
                    if (attempt == 0) {
                      setState(() {
                        gameMark5++;
                        attempt = 0;
                        gameCount++;
                      });
                      player.stop();
                      loadMusic(getAudioAssetForGameCount(gameCount));
                    } else {
                      setState(() {
                        gameCount++;
                        attempt = 0;
                      });
                      player.stop();
                      loadMusic(getAudioAssetForGameCount(gameCount));
                    }
                  } else {
                    setState(() {
                      attempt++;
                    });
                    player.stop();
                    await loadMusic_wait("assets/audios/NT.mp3");
                    await loadMusic(getAudioAssetForGameCount(gameCount));
                    //tryAgain
                  }
                  // setState(() {
                  //   gameCount++;
                  // });
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
}
