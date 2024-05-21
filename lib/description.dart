import 'package:be_my_eyes/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:just_audio/just_audio.dart';
import 'package:firebase_database/firebase_database.dart';

class Description extends StatefulWidget {
  final String name;
  final String UserName;

  const Description({super.key, required this.name, required this.UserName});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final player = AudioPlayer();
  String objectName = "";
  FirebaseDatabase database = FirebaseDatabase.instance;

  String textTOWrite = "";

  Future<void> init_fun() async {
    // /Audio/playThis
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Audio/playThisObject');

    final snapshot = await starCountRef.get();

    if (snapshot.exists) {
      print(snapshot.value);
      final data = snapshot.value;

      print("data sanp");
      print(data);
      setState(() {
        objectName = data.toString();
        textTOWrite = descriptions[data.toString()]!;
      });

      loadMusic("assets/audios/$data.mp3");
      // EasyLoading.showToast(data.toString());
    } else {
      print('No data available.');
    }
    // starCountRef.onValue.listen((DatabaseEvent event) async {
    //   final data = event.snapshot.value;
    //
    //   print("data sanp");
    //   print(data);
    //   setState(() {
    //     objectName = data.toString();
    //     textTOWrite = descriptions[data.toString()]!;
    //   });
    //
    //   await loadMusic("assets/audios/$data.mp3");
    //   EasyLoading.showToast(data.toString());
    // });
  }

  Future loadMusic(String pathA) async {
    player.setAsset(pathA);
    player.play();
    // player.stop();
  }

  @override
  void initState() {
    init_fun();
    if (widget.name == "Banana") {
      loadMusic("assets/audios/tb.mp3");
    }
    // loadMusic("assets/audios/${widget.name}.mp3");
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  final Map<String, String> descriptions = {
    "banana":
        "Banana is a fruit. it feels long and smooth. It's not round like an apple. The skin of a banana is soft and easy to peel. Bananas have a sweet smell. When you eat a banana, it's juicy and has a mild, sweet flavor.",
    "apple":
        "Apple is a fruit. It's round and feels smooth when you touch it. If you gently run your fingers around the apple, you might feel a small dent near the top. That's where the stem connects to the apple. You can eat an apple by taking small bites. It's juicy and crunchy when you bite into it.",
    "orange":
        "Orange is a fruit. It has a round shape like a ball. Oranges are usually orange in color. The skin of an orange is thick and rough. Oranges have a fresh, citrusy smell. When you bite into an orange segment, you'll taste the sweet juice bursting in your mouth.",
    "pineapple":
        "A pineapple is a fruit. Pineapples are usually yellow or orange in color. It has long, pointy leaves that stick out from the top. The skin is rough and covered in little bumps. When you bite into a piece of pineapple, you'll taste the sweet juice bursting in your mouth.",
    "pears":
        "A pear is a fruit. Pears come in different colors, like green, yellow, or red. The skin of a pear is thin and soft. When you bite into a pear, you'll taste the juicy flesh with its sweet flavor.",
    "dragon_fruit":
        "A dragon fruit is a fruit. It's covered in thick, scaly skin that can be pink, red, or yellow. When you bite into a dragon fruit, you'll taste the juicy flesh with its unique, fruity flavor.",
    "guava":
        "A guava is a fruit. Guavas come in different colors, like green, yellow, or pink. it round or oval-shaped and slightly bumpy on the outside. The skin of a guava is thin and soft. When you bite into a guava, you'll taste the juicy flesh with its unique, fruity flavor. It's like tasting a blend of strawberries and pears.",
    "sugar_apple":
        "A sugar apple is a fruit. , with a textured skin that may have small bumps or ridges. it is round or heart-shaped and slightly bumpy on the outside. It's soft and tender to the touch. When you bite into a sugar apple, you'll taste the soft flesh with its sweet and custard-like flavor.",
    "beet":
        "A beet is a vegetable. It is round or oval-shaped, like a small ball. Beets are red. You can use your fingers to feel its texture, which might be slightly bumpy or rough.",
    "cucumber":
        "A cucumber is a vegetable. It is long and cylindrical, like a straight tube. Cucumbers are green. You can use your fingers to feel its texture, which is smooth and slightly bumpy.",
    "cabbage":
        "Cabbage is a vegetable. It is round or oval-shaped, like a large ball. Cabbages are green or purple. You can use your fingers to feel its texture, which is smooth but slightly wrinkled on the outer leaves.",
    "carrot":
        "A carrot is a vegetable. It is long and slender, like a cone. Carrots are orange. You can use your fingers to feel its texture, which is smooth but slightly rough near the top where the greens were removed.",
    "bell-pepper":
        "A bell pepper is a vegetable. It is shaped like a bell-shaped. It is green. It usually about the size of a large apple.",
    "eggplant":
        "Eggplant is a vegetable. It is shaped like a large, elongated egg or a sphere. Eggplants are purple. You can use your fingers to feel its texture, which is smooth and sometimes slightly glossy on the outside.",
    "garlic":
        "Garlic is a vegetable. It is small and round, with a papery skin covering cloves inside. Garlic cloves are white. You can use your fingers to feel its texture, which is smooth and firm.",
    "onion":
        "Onion is a vegetable. It is round or oval-shaped, like a small ball. Onions are purple. You can use your fingers to feel its texture, which is dry and papery on the outside layers, with firm and slightly moist flesh inside.",
    "potato":
        "Potato is a vegetable. It is like a lumpy ball or an elongated oval. Potatoes are yellow. You can use your fingers to feel its texture, which is smooth and slightly rough on the skin, with starchy flesh inside.",
    "tomato":
        "Tomato is a fruit, often used as a vegetable in cooking. It is round or oval-shaped, like a small ball or an elongated sphere. Tomatoes are red. You can use your fingers to feel its texture, which is smooth and slightly soft, with thin skin and juicy flesh inside.",
    "zucchini":
        "Zucchini is a vegetable. It is shaped like a long, slender cylinder or a slightly curved tube. Zucchinis are green. You can use your fingers to feel its texture, which is smooth and slightly waxy on the skin, with soft flesh inside."
  };

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
            player.stop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(name: widget.UserName),
              ),
            );
          },
        ),
        leadingWidth: 100,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Navigator.pop(context);
          debugPrint("test");
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 51, 105, 255),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Center(
                    child: Text(
                      objectName,
                      style: TextStyle(color: Colors.white, fontSize: 34),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      textTOWrite,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
