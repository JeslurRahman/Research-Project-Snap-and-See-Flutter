import 'package:be_my_eyes/service/apiDio.dart';
import 'package:be_my_eyes/suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget {
  final String name;
  const Profile({super.key, required this.name});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final storage = new FlutterSecureStorage();
  Map<String, dynamic> myData = {};

  Future<void> fetchData() async {
    myData = await apiDio().getData();
    setState(() {}); // Trigger a rebuild after getting the data
  }

  @override
  void initState() {
    // TODO: implement initState
    print("widget.name");
    print(widget.name);
    fetchData();
    super.initState();
  }

  Widget buildGameContainer(String lvl, int time) {
    return Container(
      decoration: const BoxDecoration(),
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                //borderRadius: BorderRadius.zero, //Rectangular border
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Suggestions(suggest: lvl, timeTaken: time),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  height: 10,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("Lvl:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      Text(lvl, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("Time:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      Text(time.toString(), style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("Suggestions:", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      // Add logic to get the corresponding suggestion value
                      Text("Suggestions ...", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                )
              ],
            ),
          )

          // SizedBox(height: 10),
        ],
      ),
    );
  }

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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: Color.fromARGB(255, 242, 242, 246)),
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Text(widget.name,
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 105, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 32)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Levels Placements",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 5),

                  // myData != {} ?
                  // {for (var i = 0; i < myData["lvlList"].length; i++)
                  //   buildGameContainer(
                  //       myData["lvlList"][i], myData["timeList"][i])}
                  //       :
                  //   null };
                  myData.isNotEmpty
                      ? Column(
                          children: [
                            for (var i = myData["lvlList"].length - 1;
                                i >= 0;
                                i--)
                              buildGameContainer(
                                  myData["lvlList"][i], myData["timeList"][i])
                          ],
                        )
                      : CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
