import 'dart:async';
import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'description.dart';

class ObjectGuide extends StatefulWidget {
  final String UserName;
  const ObjectGuide({super.key, required this.UserName});

  @override
  State<ObjectGuide> createState() => _ObjectGuideState();
}

class _ObjectGuideState extends State<ObjectGuide> {
  RTCPeerConnection? _peerConnection;
  final _localRenderer = RTCVideoRenderer();

  MediaStream? _localStream;

  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;
  String transformType = "none";

  String objectName = "";
  // MediaStream? _localStream;
  bool _inCalling = false;

  DateTime? _timeStart;

  bool _loading = false;

  void _onTrack(RTCTrackEvent event) {
    print("TRACK EVENT: ${event.streams.map((e) => e.id)}, ${event.track.id}");
    if (event.track.kind == "video") {
      print("HERE");
      _localRenderer.srcObject = event.streams[0];
    }
  }

  void _onDataChannelState(RTCDataChannelState? state) {
    switch (state) {
      case RTCDataChannelState.RTCDataChannelClosed:
        print("Camera Closed!!!!!!!");
        break;
      case RTCDataChannelState.RTCDataChannelOpen:
        print("Camera Opened!!!!!!!");
        break;
      default:
        print("Data Channel State: $state");
    }
  }

  Future<bool> _waitForGatheringComplete(_) async {
    print("WAITING FOR GATHERING COMPLETE");
    if (_peerConnection!.iceGatheringState ==
        RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return true;
    } else {
      await Future.delayed(Duration(seconds: 1));
      return await _waitForGatheringComplete(_);
    }
  }

  void _toggleCamera() async {
    if (_localStream == null) throw Exception('Stream is not initialized');

    final videoTrack = _localStream!
        .getVideoTracks()
        .firstWhere((track) => track.kind == 'video');
    await Helper.switchCamera(videoTrack);
  }

  Future<void> _negotiateRemoteConnection() async {
    return _peerConnection!
        .createOffer()
        .then((offer) {
          return _peerConnection!.setLocalDescription(offer);
        })
        .then(_waitForGatheringComplete)
        .then((_) async {
          var des = await _peerConnection!.getLocalDescription();
          var headers = {
            'Content-Type': 'application/json',
          };
          var request = http.Request(
            'POST',
            Uri.parse(
                'http://3.91.132.16:8002/offer'), // CHANGE URL HERE TO LOCAL SERVER  192.168.1.3
          );
          request.body = json.encode(
            {
              "sdp": des!.sdp,
              "type": des.type,
              "video_transform": transformType,
            },
          );
          request.headers.addAll(headers);

          http.StreamedResponse response = await request.send();

          String data = "";
          print(response);
          if (response.statusCode == 200) {
            data = await response.stream.bytesToString();
            var dataMap = json.decode(data);
            print(dataMap);
            await _peerConnection!.setRemoteDescription(
              RTCSessionDescription(
                dataMap["sdp"],
                dataMap["type"],
              ),
            );
          } else {
            print(response.reasonPhrase);
          }
        });
  }

  Future<void> _makeCall() async {
    setState(() {
      _loading = true;
    });
    var configuration = <String, dynamic>{
      'sdpSemantics': 'unified-plan',
    };

    //* Create Peer Connection
    if (_peerConnection != null) return;
    _peerConnection = await createPeerConnection(
      configuration,
    );

    _peerConnection!.onTrack = _onTrack;
    // _peerConnection!.onAddTrack = _onAddTrack;

    //* Create Data Channel
    _dataChannelDict = RTCDataChannelInit();
    _dataChannelDict!.ordered = true;
    _dataChannel = await _peerConnection!.createDataChannel(
      "chat",
      _dataChannelDict!,
    );
    _dataChannel!.onDataChannelState = _onDataChannelState;
    // _dataChannel!.onMessage = _onDataChannelMessage;

    final mediaConstraints = <String, dynamic>{
      'audio': false,
      'video': {
        'mandatory': {
          'minWidth': '600',
          'maxWidth': '700',
          'minHeight': '500',
          'maxHeight': '600',
          'minFrameRate': '30',
          'maxFrameRate': '30',
        },
        // 'facingMode': 'user',
        'facingMode': 'environment',
        'optional': [],
      }
    };

    try {
      var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      // _mediaDevicesList = await navigator.mediaDevices.enumerateDevices();
      _localStream = stream;
      // _localRenderer.srcObject = _localStream;

      stream.getTracks().forEach((element) {
        _peerConnection!.addTrack(element, stream);
      });

      print("NEGOTIATE");
      await _negotiateRemoteConnection();
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _inCalling = true;
      _loading = false;
    });
  }

  Future<void> _stopCall() async {
    try {
      await _localStream?.dispose();
      await _dataChannel?.close();
      await _peerConnection?.close();
      _peerConnection = null;
      _localRenderer.srcObject = null;
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      _inCalling = false;
    });
  }

  Future<void> initLocalRenderers() async {
    await _localRenderer.initialize();
  }

  FirebaseDatabase database = FirebaseDatabase.instance;
  String range = "+";
  bool Tos_enabled = false;

  final player = AudioPlayer();

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

  Future<void> init_fun() async {
    // /Audio/playThis
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Audio/playThis');
    starCountRef.onValue.listen((DatabaseEvent event) async {
      final data = event.snapshot.value;

      print("data sanp");
      print(data);

      loadMusic("assets/audios/$data");
      setState(() {
        range = data.toString();
        Tos_enabled = true;
        objectName = data.toString();
      });
      // EasyLoading.showToast(range);
      print(range);
    });
  }

  // collect centered img
  Future<void> checkCenter() async {
    // /Audio/playThis
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Audio/Center');
    starCountRef.onValue.listen(
      (DatabaseEvent event) async {
        final data = event.snapshot.value;
        print("data sanp");
        print(data);
        if (data == "center") {
          await _stopCall();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Description(
                name: objectName,
                UserName: widget.UserName,
              ),
            ),
          );
        }
        // await loadMusic("assets/audios/$data.mp3");
        setState(() {
          range = data.toString();
          Tos_enabled = true;
        });
        // EasyLoading.showToast(range);
        print(range);
      },
    );
  }

  Future<void> init_msg() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('Audio');
    await ref.update(
      {
        "Center": "test",
        "playThis": "test",
      },
    );
  }

  @override
  void initState() {
    super.initState();
    init_msg();
    _makeCall();
    checkCenter();
    init_fun();
    initLocalRenderers();
  }

  @override
  void dispose() async {
    player.stop();
    init_msg();
    await _stopCall();
    super.dispose();
  }

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: Colors.black,
                      child: _loading
                          ? Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  Positioned.fill(
                    child: RTCVideoView(
                      _localRenderer,
                      // mirror: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Theme.of(context).colorScheme.inversePrimary,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: -46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                    padding: const EdgeInsets.all(2),
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    // shadowColor: Colors.black,
                  ),
                  child: const Icon(Icons.camera, size: 80, color: Colors.red),
                  onPressed: () {
                    _toggleCamera();
                    // _stopCall(); // remove this
                    // _makeCall();
                    debugPrint('FAB tapped!');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
