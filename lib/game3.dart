import 'package:be_my_eyes/gameMenu.dart';
import 'package:be_my_eyes/service/apiDio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Game3 extends StatefulWidget {
  final String name;
  const Game3({super.key, required this.name});

  @override
  State<Game3> createState() => _Game3State();
}

class _Game3State extends State<Game3> {
  final player = AudioPlayer();
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

  Future loadMusic_a(String pathA) async {
    final duration = await player.setAsset(pathA);
    await player.play();
    player.stop();
  }

  Future loadMusic(String pathA) async {
    player.setAsset(pathA);
    player.play();
    // player.stop();
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
        return 'assets/images/apple.jpeg';
      case 1:
        return 'assets/images/ball.jpg';
      case 2:
        return 'assets/images/triangl.png';
      case 3:
        return 'assets/images/banana.jpg';
      case 4:
        return 'assets/images/Carrot.jpg';
      case 5:
        return 'assets/images/eggplant.jpg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  String getImageAssetForShapeToy(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/ball.jpg';
      case 1:
        return 'assets/images/triangl.png';
      case 2:
        return 'assets/images/bat.jpg';
      case 3:
        return 'assets/images/Circle.jpg';
      case 4:
        return 'assets/images/square.jpg';
      case 5:
        return 'assets/images/toycar.jpg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  String getAudioAssetForShapeToy(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/ballg.mp3';
      case 1:
        return 'assets/audios/triangleg.mp3';
      case 2:
        return 'assets/audios/batg.mp3';
      case 3:
        return 'assets/audios/circleg.mp3';
      case 4:
        return 'assets/audios/squareg.mp3';
      case 5:
        return 'assets/audios/toy_carg.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

  String getImageAssetForShapeFruit(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/apple.jpeg';
      case 1:
        return 'assets/images/triangl.png';
      case 2:
        return 'assets/images/banana.jpg';
      case 3:
        return 'assets/images/Circle.jpg';
      case 4:
        return 'assets/images/square.jpg';
      case 5:
        return 'assets/images/pineApple.jpeg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  String getAudioAssetForShapeFruit(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/Appleg.mp3';
      case 1:
        return 'assets/audios/triangleg.mp3';
      case 2:
        return 'assets/audios/bananag.mp3';
      case 3:
        return 'assets/audios/circleg.mp3';
      case 4:
        return 'assets/audios/squareg.mp3';
      case 5:
        return 'assets/audios/pineappleg.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

  String getImageAssetForShapeVegetable(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/Carrot.jpg';
      case 1:
        return 'assets/images/triangl.png';
      case 2:
        return 'assets/images/eggplant.jpg';
      case 3:
        return 'assets/images/Circle.jpg';
      case 4:
        return 'assets/images/square.jpg';
      case 5:
        return 'assets/images/cucumber.jpeg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  String getAudioAssetForShapeVegetable(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/carrotg.mp3';
      case 1:
        return 'assets/audios/triangleg.mp3';
      case 2:
        return 'assets/audios/eggplantg.mp3';
      case 3:
        return 'assets/audios/circleg.mp3';
      case 4:
        return 'assets/audios/squareg.mp3';
      case 5:
        return 'assets/audios/cucumberg.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

  String getImageAssetForToyFruit(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/apple.jpeg';
      case 1:
        return 'assets/images/ball.jpg';
      case 2:
        return 'assets/images/banana.jpg';
      case 3:
        return 'assets/images/bat.jpg';
      case 4:
        return 'assets/images/toycar.jpg';
      case 5:
        return 'assets/images/pineApple.jpeg';
      default:
        return 'assets/images/apple.jpeg';
    }
  }

  String getAudioAssetForToyFruit(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/Appleg.mp3';
      case 1:
        return 'assets/audios/ballg.mp3';
      case 2:
        return 'assets/audios/bananag.mp3';
      case 3:
        return 'assets/audios/batg.mp3';
      case 4:
        return 'assets/audios/toy_carg.mp3';
      case 5:
        return 'assets/audios/pineappleg.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

  String getImageAssetForToyVegetable(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/Carrot.jpg';
      case 1:
        return 'assets/images/ball.jpg';
      case 2:
        return 'assets/images/eggplant.jpg';
      case 3:
        return 'assets/images/bat.jpg';
      case 4:
        return 'assets/images/toycar.jpg';
      case 5:
        return 'assets/images/cucumber.jpeg';
      default:
        return 'assets/images/Carrot.jpg';
    }
  }

  String getAudioAssetForToyVegetable(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/carrotg.mp3';
      case 1:
        return 'assets/audios/ballg.mp3';
      case 2:
        return 'assets/audios/eggplantg.mp3';
      case 3:
        return 'assets/audios/batg.mp3';
      case 4:
        return 'assets/audios/toy_carg.mp3';
      case 5:
        return 'assets/audios/cucumberg.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

  String getImageAssetForFruitVegetable(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/images/Carrot.jpg';
      case 1:
        return 'assets/images/apple.jpeg';
      case 2:
        return 'assets/images/eggplant.jpg';
      case 3:
        return 'assets/images/banana.jpg';
      case 4:
        return 'assets/images/pineApple.jpeg';
      case 5:
        return 'assets/images/cucumber.jpeg';
      default:
        return 'assets/images/Carrot.jpg';
    }
  }

  String getAudioAssetForFruitVegetable(int gameCount) {
    switch (gameCount) {
      case 0:
        // add voice here
        return 'assets/audios/carrortg.mp3';
      case 1:
        return 'assets/audios/Appleg.mp3';
      case 2:
        return 'assets/audios/eggplantg.mp3';
      case 3:
        return 'assets/audios/bananag.mp3';
      case 4:
        return 'assets/audios/pineappleg.mp3';
      case 5:
        return 'assets/audios/cucumberg.mp3';
      default:
        return 'assets/audios/apple.mp3';
    }
  }

  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<void> init_fun() async {
    // /Audio/playThis
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('/User/${widget.name}/game/gameSuggest');
    starCountRef.onValue.listen((DatabaseEvent event) async {
      final data = event.snapshot.value;
      print("data sanp");
      print(data);
      print(widget.name);
      if (data == "[0 1]" || data == "[1 0]") {
        setState(() {
          weekInShape = 1;
          weekInToy = 1;
        });
      } else if (data == "[0 2]" || data == "[2 0]") {
        setState(() {
          weekInShape = 1;
          weekInFruit = 1;
        });
      } else if (data == "[0 3]" || data == "[3 0]") {
        setState(() {
          weekInShape = 1;
          weekInVegetable = 1;
        });
      } else if (data == "[1 2]" || data == "[2 1]") {
        setState(() {
          weekInToy = 1;
          weekInFruit = 1;
        });
      } else if (data == "[1 3]" || data == "[3 1]") {
        setState(() {
          weekInToy = 1;
          weekInVegetable = 1;
        });
      } else if (data == "[2 3]" || data == "[3 2]") {
        setState(() {
          weekInFruit = 1;
          weekInVegetable = 1;
        });
      }
      init_audio();
    });
  }

  Future<void> init_audio() async {
    if (weekInShape == 1 && weekInToy == 1) {
      loadMusic(getAudioAssetForShapeToy(0));
    }
    if (weekInShape == 1 && weekInFruit == 1) {
      loadMusic(getAudioAssetForShapeFruit(0));
    }
    if (weekInShape == 1 && weekInVegetable == 1) {
      loadMusic(getAudioAssetForShapeVegetable(0));
    }
    if (weekInToy == 1 && weekInVegetable == 1) {
      loadMusic(getAudioAssetForToyVegetable(0));
    }
    if (weekInToy == 1 && weekInFruit == 1) {
      loadMusic(getAudioAssetForToyFruit(0));
    }
    if (weekInFruit == 1 && weekInVegetable == 1) {
      loadMusic(getAudioAssetForFruitVegetable(0));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    init_fun();
    super.initState();
  }

  int weekInShape = 0;
  int weekInToy = 0;
  int weekInFruit = 0;
  int weekInVegetable = 0;

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
                          (weekInShape == 1 && weekInToy == 1)
                              ? getImageAssetForShapeToy(gameCount)
                              : (weekInShape == 1 && weekInFruit == 1)
                                  ? getImageAssetForShapeFruit(gameCount)
                                  : (weekInShape == 1 && weekInVegetable == 1)
                                      ? getImageAssetForShapeVegetable(
                                          gameCount)
                                      : (weekInToy == 1 && weekInFruit == 1)
                                          ? getImageAssetForToyFruit(gameCount)
                                          : (weekInToy == 1 &&
                                                  weekInVegetable == 1)
                                              ? getImageAssetForToyVegetable(
                                                  gameCount)
                                              : (weekInFruit == 1 &&
                                                      weekInVegetable == 1)
                                                  ? getImageAssetForFruitVegetable(
                                                      gameCount)
                                                  : getImageAssetForGameCount(
                                                      gameCount),
                          // getImageAssetForGameCount(gameCount),
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
                        (weekInShape == 1 && weekInToy == 1)
                            ? getImageAssetForShapeToy(gameCount)
                            : (weekInShape == 1 && weekInFruit == 1)
                                ? getImageAssetForShapeFruit(gameCount)
                                : (weekInShape == 1 && weekInVegetable == 1)
                                    ? getImageAssetForShapeVegetable(gameCount)
                                    : (weekInToy == 1 && weekInFruit == 1)
                                        ? getImageAssetForToyFruit(gameCount)
                                        : (weekInToy == 1 &&
                                                weekInVegetable == 1)
                                            ? getImageAssetForToyVegetable(
                                                gameCount)
                                            : (weekInFruit == 1 &&
                                                    weekInVegetable == 1)
                                                ? getImageAssetForFruitVegetable(
                                                    gameCount)
                                                : getImageAssetForGameCount(
                                                    gameCount),
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

                                if (weekInShape == 1 && weekInToy == 1) {
                                  if (gameCount == 1 ||
                                      gameCount == 3 ||
                                      gameCount == 4) {
                                    setState(() {
                                      shapeCount++;
                                      timeDuration2 = duration.inSeconds;
                                      gameCount++;
                                      player.stop();
                                      loadMusic(
                                          getAudioAssetForShapeToy(gameCount));
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      _isDroppedShape = true;
                                    });
                                  }
                                }

                                if (weekInShape == 1 && weekInFruit == 1) {
                                  if (gameCount == 1 ||
                                      gameCount == 3 ||
                                      gameCount == 4) {
                                    setState(() {
                                      shapeCount++;
                                      timeDuration2 = duration.inSeconds;
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForShapeFruit(
                                          gameCount));
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      _isDroppedShape = true;
                                    });
                                  }
                                }

                                if (weekInShape == 1 && weekInVegetable == 1) {
                                  if (gameCount == 1 ||
                                      gameCount == 3 ||
                                      gameCount == 4) {
                                    setState(() {
                                      shapeCount++;
                                      timeDuration2 = duration.inSeconds;
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForShapeVegetable(
                                          gameCount));
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      _isDroppedShape = true;
                                    });
                                  }
                                }
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
                                if (weekInShape == 1 && weekInToy == 1) {
                                  if (gameCount == 0 ||
                                      gameCount == 2 ||
                                      gameCount == 5) {
                                    if (gameCount == 5) {
                                      toyMark++;
                                      timeDuration1 = duration.inSeconds;
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      _isDroppedToy = true;
                                      Navigator.pop(context);
                                    }
                                    setState(() {
                                      toyMark++;
                                      timeDuration1 = duration.inSeconds;
                                      gameCount++;
                                      player.stop();
                                      loadMusic(
                                          getAudioAssetForShapeToy(gameCount));
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      _isDroppedToy = true;
                                    });
                                  }
                                }

                                if (weekInToy == 1 && weekInFruit == 1) {
                                  if (gameCount == 1 ||
                                      gameCount == 3 ||
                                      gameCount == 4) {
                                    setState(() {
                                      toyMark++;
                                      timeDuration1 = duration.inSeconds;
                                      gameCount++;
                                      player.stop();
                                      loadMusic(
                                          getAudioAssetForToyFruit(gameCount));
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      _isDroppedToy = true;
                                    });
                                  }
                                }

                                if (weekInToy == 1 && weekInVegetable == 1) {
                                  if (gameCount == 1 ||
                                      gameCount == 3 ||
                                      gameCount == 4) {
                                    setState(() {
                                      toyMark++;
                                      timeDuration1 = duration.inSeconds;
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForToyVegetable(
                                          gameCount));
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      _isDroppedToy = true;
                                    });
                                  }
                                }
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

                                if (weekInShape == 1 && weekInFruit == 1) {
                                  if (gameCount == 0 ||
                                      gameCount == 2 ||
                                      gameCount == 5) {
                                    if (gameCount == 5) {
                                      setState(() {
                                        fruitMark1++;
                                        timeDuration0 = duration.inSeconds;
                                        showSnackBarGlobal(
                                            context, 'Dropped successfully!');
                                        Navigator.pop(context);
                                      });
                                    }
                                    setState(() {
                                      fruitMark1++;
                                      timeDuration0 = duration.inSeconds;
                                      _isDroppedFruit = true;
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForShapeFruit(
                                          gameCount));
                                    });
                                  }
                                }
                                if (weekInToy == 1 && weekInFruit == 1) {
                                  if (gameCount == 0 ||
                                      gameCount == 2 ||
                                      gameCount == 5) {
                                    if (gameCount == 5) {
                                      setState(() {
                                        fruitMark1++;
                                        timeDuration0 = duration.inSeconds;
                                        showSnackBarGlobal(
                                            context, 'Dropped successfully!');
                                        Navigator.pop(context);
                                      });
                                    }
                                    setState(() {
                                      fruitMark1++;
                                      timeDuration0 = duration.inSeconds;
                                      _isDroppedFruit = true;
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      gameCount++;
                                      player.stop();
                                      loadMusic(
                                          getAudioAssetForToyFruit(gameCount));
                                    });
                                  }
                                }
                                if (weekInFruit == 1 && weekInVegetable == 1) {
                                  if (gameCount == 1 ||
                                      gameCount == 3 ||
                                      gameCount == 4) {
                                    setState(() {
                                      fruitMark1++;
                                      timeDuration0 = duration.inSeconds;
                                      _isDroppedFruit = true;
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForFruitVegetable(
                                          gameCount));
                                    });
                                  }
                                }
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
                                if (weekInShape == 1 && weekInVegetable == 1) {
                                  if (gameCount == 0 ||
                                      gameCount == 2 ||
                                      gameCount == 5) {
                                    if (gameCount == 5) {
                                      setState(() {
                                        vegetableMark1++;
                                        timeDuration4 = duration.inSeconds;
                                        showSnackBarGlobal(
                                            context, 'Dropped successfully!');
                                        Navigator.pop(context);
                                      });
                                    }
                                    setState(() {
                                      vegetableMark1++;
                                      timeDuration4 = duration.inSeconds;
                                      _isDropped = true;
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForShapeVegetable(
                                          gameCount));
                                    });
                                  }
                                }
                                if (weekInToy == 1 && weekInVegetable == 1) {
                                  if (gameCount == 0 ||
                                      gameCount == 2 ||
                                      gameCount == 5) {
                                    if (gameCount == 5) {
                                      setState(() {
                                        vegetableMark1++;
                                        timeDuration4 = duration.inSeconds;
                                        showSnackBarGlobal(
                                            context, 'Dropped successfully!');
                                        Navigator.pop(context);
                                      });
                                    }
                                    setState(() {
                                      vegetableMark1++;
                                      timeDuration4 = duration.inSeconds;
                                      _isDropped = true;
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForToyVegetable(
                                          gameCount));
                                    });
                                  }
                                }
                                if (weekInFruit == 1 && weekInVegetable == 1) {
                                  if (gameCount == 0 ||
                                      gameCount == 2 ||
                                      gameCount == 5) {
                                    if (gameCount == 5) {
                                      setState(() {
                                        vegetableMark1++;
                                        timeDuration4 = duration.inSeconds;
                                        showSnackBarGlobal(
                                            context, 'Dropped successfully!');
                                        Navigator.pop(context);
                                      });
                                    }
                                    setState(() {
                                      vegetableMark1++;
                                      timeDuration4 = duration.inSeconds;
                                      _isDropped = true;
                                      showSnackBarGlobal(
                                          context, 'Dropped successfully!');
                                      gameCount++;
                                      player.stop();
                                      loadMusic(getAudioAssetForFruitVegetable(
                                          gameCount));
                                    });
                                  }
                                }
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
