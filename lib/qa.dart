import 'package:flutter/material.dart';

class QandA extends StatefulWidget {
  const QandA({super.key});

  @override
  State<QandA> createState() => _QandAState();
}

class _QandAState extends State<QandA> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
        ),
        backgroundColor: Colors.purple.shade200,
        body: Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: const ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(width: 4, color: Colors.deepPurple),
              ),
            ),
            child: ElevatedButton(
              child: Icon(Icons.mic, size: 70),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
