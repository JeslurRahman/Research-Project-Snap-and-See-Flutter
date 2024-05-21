import 'package:be_my_eyes/description.dart';
import 'package:be_my_eyes/dragGame.dart';
import 'package:be_my_eyes/game3.dart';
import 'package:be_my_eyes/gameMenu.dart';
import 'package:be_my_eyes/home.dart';
import 'package:be_my_eyes/identifyGame.dart';
import 'package:be_my_eyes/loginPage.dart';
import 'package:be_my_eyes/objectGuide.dart';
import 'package:be_my_eyes/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:be_my_eyes/bot/speech_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // '/home': (context) => const Homeg(),
        '/': (context) => const LoginPage(),
        // '/': (context) => const GuideHome(name: 'kid'),
        // '/': (context) => const GameOver(
        //       level: "Pro",
        //       name: "kid",
        //     ),
        '/home': (context) => const Home(
              name: '',
            ),
        '/gameMenu': (context) => const GameMenu(
              name: '',
            ),
        '/dragGame': (context) => const DragGame(
              name: '',
            ),
        '/identifyGame': (context) => const IdentifyGame(
              name: '',
            ),
        '/game3': (context) => const Game3(
              name: '',
            ),
        '/profile': (context) => const Profile(
              name: '',
            ),
        '/objectGuide': (context) => const ObjectGuide(
              UserName: '',
            ),
        '/description': (context) => const Description(
              name: '',
              UserName: '',
            ),
        '/assistant': (context) => const SpeechScreen()
      },
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 51, 105, 255)),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: screenSize.height / 4,
                      color: Colors.red,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: const BeveledRectangleBorder(),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Object Guide",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: screenSize.height / 4,
                      color: Colors.red,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: const BeveledRectangleBorder(),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Game",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: screenSize.height / 4,
                      color: Colors.red,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const BeveledRectangleBorder(),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: screenSize.height / 4,
                      color: Colors.red,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: const BeveledRectangleBorder(),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Bot",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Information',
        child: const Icon(Icons.info, color: Colors.white),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
