import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final Color? BACKGROUND_COLOR = Colors.green[100];

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPage createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {
  late List<CameraDescription> _cameras;
  late CameraDescription _camera;
  late CameraController? _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    Future(() async {
      _cameras = await availableCameras();
      setState(() {
        _camera = _cameras.first;
        _controller = CameraController(_camera, ResolutionPreset.medium, enableAudio: false);
        _initializeControllerFuture = _controller!.initialize();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done || snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CameraPreview(
                      _controller!,
                    ),
                    FloatingActionButton(onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('実装中だよ。', style: TextStyle(fontFamily: "OptFonts"),)));
                    }, child: const Icon(Icons.photo_camera),),
                  ],
                ),
              );
            } else {
              return const Text("カメラが見つかりません。");
            }
          });
    } catch(e) {
      return const Text("カメラが見つかりません。");
    }
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}