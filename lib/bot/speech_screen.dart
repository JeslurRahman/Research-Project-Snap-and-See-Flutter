import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:vibration/vibration.dart';
import 'package:just_audio/just_audio.dart';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:be_my_eyes/bot/api_services.dart';
import 'package:be_my_eyes/bot/chat_model.dart';
import 'package:be_my_eyes/bot/colors.dart';
import 'package:be_my_eyes/bot/tts.dart';

import 'package:be_my_eyes/loginPage.dart';
import 'package:be_my_eyes/profile.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

final player = AudioPlayer();

Future loadMusic(String pathA) async {
  final duration = await player.setAsset(pathA);
  await player.play();
  player.stop();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();
  TextEditingController textEditingController = TextEditingController();
  var text = "Hold the button and start speaking";
  var isListening = true;
  var isVoiceInput = true;

  final List<ChatMessage> messages = [];
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    TextToSpeech.initTTS();
  }

  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: const Duration(microseconds: 2000),
        glowColor: bgColor,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        setState(() {
                          text = result.recognizedWords;
                        });
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              isListening = false;
            });
            await speechToText.stop();

            if (text.isNotEmpty &&
                text != "Hold the button and start speaking") {
              messages.add(ChatMessage(text: text, type: ChatMessageType.user));
              var msg = await ApiServices.callFlaskAPI(text);
              msg = msg.trim();

              if (msg != null) {
                Map<String, dynamic> jsonResponse = json.decode(msg);
                String resValue = jsonResponse['top']['res'];

                // Stop any ongoing speech before starting a new one
                await TextToSpeech.stop();

                setState(() {
                  messages.add(
                      ChatMessage(text: resValue, type: ChatMessageType.bot));
                });

                Future.delayed(const Duration(milliseconds: 500), () {
                  TextToSpeech.speak(resValue);
                });
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Failed to process. Try again!")));
            }
          },
          onDoubleTap: () async {
            // Stop speaking when double-tapped
            await TextToSpeech.stop();
          },
          onTap: () {
            // Trigger vibration when the CircleAvatar is tapped
            Vibration.vibrate(duration: 500);
          },
          child: Visibility(
            visible: isVoiceInput,
            child: CircleAvatar(
              backgroundColor: isListening ? btnClr : bgColor,
              radius: 100,
              child: Icon(
                isListening ? Icons.mic : Icons.mic_none,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: const Icon(
          Icons.sort_rounded,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0.0,
        // title: const Text(
        //   "Assistant",
        //   style: TextStyle(
        //     fontWeight: FontWeight.w600,
        //     color: textColor,
        //   ),
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
              "sNs voice",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.settings,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // Add your settings functionality here
        //     },
        //   ),
        //   PopupMenuButton<String>(
        //     icon: const Icon(
        //       Icons.more_vert,
        //       color: Colors.white,
        //     ),
        //     onSelected: (value) {
        //       // Handle menu item selection

        //     },
        //     itemBuilder: (context) => [
        //       const PopupMenuItem(
        //         value: 'Home',
        //         child: Text('Home',
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //             )),
        //       ),
        //       const PopupMenuItem(
        //         value: 'Logout',
        //         child: Text('Log Out',
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //             )),
        //       ),
        //     ],
        //   ),
        // ],
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your settings functionality here
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == 'Logout') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Profile',
                child: Text('Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const PopupMenuItem(
                value: 'Logout',
                child: Text('Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: [isVoiceInput, !isVoiceInput],
              onPressed: (index) {
                setState(() {
                  isVoiceInput = index == 0;
                });
              },
              color: Colors.black54,
              selectedColor: Colors.blue,
              fillColor: Colors.blue.withOpacity(0.1),
              children: const [
                Icon(Icons.mic),
                Icon(Icons.keyboard),
              ],
            ),
            const SizedBox(height: 2),
            Visibility(
              visible: isVoiceInput,
              child: Text(
                text,
                style: TextStyle(
                    color: isListening ? btnClr : Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 12, top: 12, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: chatBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    var chat = messages[index];
                    return chatBubble(chatText: chat.text, type: chat.type);
                  },
                ),
              ),
            ),

            Visibility(
              visible: isVoiceInput,
              child: const SizedBox(
                height: 165,
              ),
            ),
            Visibility(
              visible: !isVoiceInput,
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      sendMessage();
                    },
                  ),
                ),
              ),
            ),
            // const Text(
            //   "Developed by Jeslur Rahman",
            //   style: TextStyle(
            //       color: Colors.black54,
            //       fontWeight: FontWeight.w400,
            //       fontSize: 10),
            // ),
          ],
        ),
      ),
    );
  }

  sendMessage() async {
    String text = textEditingController.text.trim();

    if (text.isNotEmpty) {
      messages.add(ChatMessage(text: text, type: ChatMessageType.user));
      var msg = await ApiServices.callFlaskAPI(text);
      msg = msg.trim();

      if (msg != null) {
        Map<String, dynamic> jsonResponse = json.decode(msg);
        String resValue = jsonResponse['top']['res'];

        // Stop any ongoing speech before starting a new one
        await TextToSpeech.stop();

        setState(() {
          messages.add(ChatMessage(text: resValue, type: ChatMessageType.bot));
        });

        Future.delayed(const Duration(milliseconds: 500), () {
          TextToSpeech.speak(resValue);
        });

        // Clear the previous question from the text field
        setState(() {
          text = "";
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to process. Try again!")));
    }
    // Clear the text field after sending the message
    textEditingController.clear();
  }

  Widget chatBubble({required chatText, required ChatMessageType? type}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: bgColor,
          child: type == ChatMessageType.bot
              ? Image.asset('assets/images/bot/chatbot-icon.png')
              : const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                  color: type == ChatMessageType.bot ? bgColor : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )),
              child: Text(
                "$chatText",
                style: TextStyle(
                    color:
                        type == ChatMessageType.bot ? textColor : chatBgColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )),
        ),
      ],
    );
  }
}
