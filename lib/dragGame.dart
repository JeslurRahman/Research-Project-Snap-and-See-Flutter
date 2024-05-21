import 'package:be_my_eyes/gameMenu.dart';
import 'package:be_my_eyes/guide/guideDragGame.dart';
import 'package:be_my_eyes/service/apiDio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DragGame extends StatefulWidget {
  final String name;
  const DragGame({super.key, required this.name});

  @override
  State<DragGame> createState() => _DragGameState();
}

class _DragGameState extends State<DragGame> {
  bool _isDropped = false;
  bool _isDroppedFruit = false;
  bool _isDroppedToy = false;
  bool _isDroppedShape = false;
  String _color = 'red';

  int gameCount = 0;

  int fruitMark1 = 0; //apple
  int toyMark = 0; // ball
  int shapeCount = 0; // Triangle
  int fruitMark2 = 0; // banana
  int vegetableMark2 = 0; // carrot
  int vegetableMark1 = 0; // eggplant

  int timeDuration0 = 0;
  int timeDuration1 = 0;
  int timeDuration2 = 0;
  int timeDuration3 = 0;
  int timeDuration4 = 0;
  int timeDuration5 = 0;

  late DateTime _dragStartTime;
  late DateTime _dragEndTime;

  final player = AudioPlayer();

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
  void initState() {
    loadMusic("assets/audios/Appleg.mp3");
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

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

  // Future loadMusic(String pathA) async {
  //   final duration = await player.setAsset(pathA);
  //   await player.play();
  //   player.stop();
  // }
  Future loadMusic(String pathA) async {
    player.setAsset(pathA);
    player.play();
    // player.stop();
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
                    builder: (context) => GuideDragGame(name: widget.name),
                  ));
            },
            icon: Icon(Icons.info, color: Colors.white),
          )
        ],
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
                width: 200,
                height: 200,
                color: Colors.black54,
                child: Draggable<String>(
                  // Data is the value this Draggable stores.
                  onDragStarted: () {
                    setState(() {
                      _isDropped = false;
                      _isDroppedFruit = false;
                      _isDroppedToy = false;
                      _isDroppedShape = false;
                      _dragStartTime = DateTime.now();
                    });
                  },
                  data: _color,
                  feedback: Material(
                    child: Container(
                      height: 170.0,
                      width: 170.0,
                      decoration: BoxDecoration(
                        color: getColorForGameCount(gameCount),
                        // color: (gameCount == 0)
                        //     ? Colors.blueAccent
                        //     : Colors.redAccent,
                      ),
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
                                      !_isDroppedShape ? 'Shape' : 'Dropped',
                                      textScaleFactor: 2,
                                    )),
                                  ),
                                );
                              },
                              onAccept: (data) async {
                                debugPrint('hi $data');
                                _dragEndTime = DateTime.now();
                                final duration =
                                    _dragEndTime.difference(_dragStartTime);
                                debugPrint(
                                    'Time taken: ${duration.inSeconds} seconds');

                                if (gameCount == 2) {
                                  setState(() {
                                    shapeCount++;
                                    timeDuration2 = duration.inSeconds;
                                  });
                                }
                                if (gameCount == 5) {
                                  debugPrint('Send data to api');
                                  await apiDio().addChildRate(
                                      fruitMark1,
                                      toyMark,
                                      shapeCount,
                                      fruitMark2,
                                      vegetableMark2,
                                      vegetableMark1,
                                      timeDuration0,
                                      timeDuration1,
                                      timeDuration2,
                                      timeDuration3,
                                      timeDuration4,
                                      timeDuration5,
                                      context);
                                  // Navigator.pop(context);
                                }

                                setState(() {
                                  showSnackBarGlobal(
                                      context, 'Dropped successfully!');
                                  _isDroppedShape = true;
                                  gameCount++;
                                  player.stop();
                                  loadMusic(
                                      getAudioAssetForGameCount(gameCount));
                                });
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
                                      !_isDroppedToy ? 'Toy' : 'Dropped',
                                      textScaleFactor: 2,
                                    )),
                                  ),
                                );
                              },
                              onAccept: (data) async {
                                debugPrint('hi $data');
                                _dragEndTime = DateTime.now();
                                final duration =
                                    _dragEndTime.difference(_dragStartTime);
                                debugPrint(
                                    'Time taken: ${duration.inSeconds} seconds');
                                if (gameCount == 1) {
                                  setState(() {
                                    toyMark++;
                                    timeDuration1 = duration.inSeconds;
                                  });
                                }
                                if (gameCount == 5) {
                                  debugPrint('Send data to api');
                                  await apiDio().addChildRate(
                                      fruitMark1,
                                      toyMark,
                                      shapeCount,
                                      fruitMark2,
                                      vegetableMark2,
                                      vegetableMark1,
                                      timeDuration0,
                                      timeDuration1,
                                      timeDuration2,
                                      timeDuration3,
                                      timeDuration4,
                                      timeDuration5,
                                      context);
                                  // Navigator.pop(context);
                                }
                                setState(() {
                                  showSnackBarGlobal(
                                      context, 'Dropped successfully!');
                                  _isDroppedToy = true;
                                  gameCount++;
                                  player.stop();
                                  loadMusic(
                                      getAudioAssetForGameCount(gameCount));
                                });
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
                                        !_isDroppedFruit ? 'Fruit' : 'Dropped',
                                        textScaleFactor: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onAccept: (data) async {
                                debugPrint('hi $data');
                                _dragEndTime = DateTime.now();
                                final duration =
                                    _dragEndTime.difference(_dragStartTime);
                                debugPrint(
                                    'Time taken: ${duration.inSeconds} seconds');
                                if (gameCount == 0) {
                                  setState(() {
                                    fruitMark1++;
                                    timeDuration0 = duration.inSeconds;
                                  });
                                }
                                if (gameCount == 3) {
                                  setState(() {
                                    fruitMark2++;
                                    timeDuration3 = duration.inSeconds;
                                  });
                                }
                                if (gameCount == 5) {
                                  debugPrint('Send data to api');
                                  await apiDio().addChildRate(
                                      fruitMark1,
                                      toyMark,
                                      shapeCount,
                                      fruitMark2,
                                      vegetableMark2,
                                      vegetableMark1,
                                      timeDuration0,
                                      timeDuration1,
                                      timeDuration2,
                                      timeDuration3,
                                      timeDuration4,
                                      timeDuration5,
                                      context);
                                  // Navigator.pop(context);
                                }
                                debugPrint('hi $fruitMark2');
                                setState(() {
                                  showSnackBarGlobal(
                                      context, 'Dropped successfully!');
                                  _isDroppedFruit = true;
                                  gameCount++;
                                  player.stop();
                                  loadMusic(
                                      getAudioAssetForGameCount(gameCount));
                                });
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
                                      !_isDropped ? 'Vegetable' : 'Dropped',
                                      textScaleFactor: 2,
                                    )),
                                  ),
                                );
                              },
                              onAccept: (data) async {
                                debugPrint('hi $data');
                                _dragEndTime = DateTime.now();
                                final duration =
                                    _dragEndTime.difference(_dragStartTime);
                                debugPrint(
                                    'Time taken: ${duration.inSeconds} seconds');
                                if (gameCount == 4) {
                                  setState(() {
                                    vegetableMark2++;
                                    timeDuration4 = duration.inSeconds;
                                  });
                                }
                                if (gameCount == 5) {
                                  setState(() {
                                    vegetableMark1++;
                                    timeDuration5 = duration.inSeconds;
                                  });
                                  debugPrint('Send data to api');
                                  await apiDio().addChildRate(
                                      fruitMark1,
                                      toyMark,
                                      shapeCount,
                                      fruitMark2,
                                      vegetableMark2,
                                      vegetableMark1,
                                      timeDuration0,
                                      timeDuration1,
                                      timeDuration2,
                                      timeDuration3,
                                      timeDuration4,
                                      timeDuration5,
                                      context);
                                  // Navigator.pop(context);
                                }
                                setState(() {
                                  showSnackBarGlobal(
                                      context, 'Dropped successfully!');
                                  _isDropped = true;
                                  gameCount++;
                                  player.stop();
                                  loadMusic(
                                      getAudioAssetForGameCount(gameCount));
                                });
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

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      textScaleFactor: 2,
    )));
  }
}
