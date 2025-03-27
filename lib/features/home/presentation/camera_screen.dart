import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:user/features/editor/presentation/video_editor_screen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  // Camera Control
  CameraController? _controller;
  bool _isInitialized = false;
  bool _isRecording = false;
  bool _isFrontCamera = false;
  bool _flashEnabled = false;

  // Recording
  Timer? _recordingTimer;
  int _recordingSeconds = 0;
  final int _maxDuration = 60; // 60 second max like TikTok
  String? _videoPath;

  // Video Scaling
  double _scale = 1.0;
  Size? _previewSize;
  List<CameraDescription> _cameras = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _controller?.dispose();
    _recordingTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) return;

      _controller = CameraController(
        _cameras[_isFrontCamera ? 1 : 0],
        ResolutionPreset.high,
        enableAudio: true,
      );


      await _controller!.initialize();
      if (!mounted) return;

      // Calculate perfect scaling
      _previewSize = _controller!.value.previewSize;
      final media = MediaQuery.of(context);
      final screenRatio = media.size.width / media.size.height;
      final previewRatio = _previewSize!.width / _previewSize!.height;

      _scale = previewRatio > screenRatio
          ? media.size.height / _previewSize!.height
          : media.size.width / _previewSize!.width;

      setState(() => _isInitialized = true);
    } catch (e) {
      print("Camera error: $e");
    }
  }

  Widget _buildCameraPreview() {
    if (!_isInitialized || _previewSize == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Transform.scale(
      scale: _scale,
      child: Center(
        child: CameraPreview(_controller!),
      ),
    );
  }

  Future<void> _toggleRecording() async {
    if (!_isInitialized) return;

    if (_isRecording) {
      await _stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    final dir = await getTemporaryDirectory();
    // final path = join(dir.path, '${DateTime.now().millisecondsSinceEpoch}.mp4');

    await _controller!.startVideoRecording();
    setState(() {
      _isRecording = true;
      _recordingSeconds = 0;
    });

    _recordingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() => _recordingSeconds++);

      if (_recordingSeconds >= _maxDuration) {
        _stopRecording();
      }
    });
  }

  Future<void> _stopRecording() async {
    _recordingTimer?.cancel();
    final file = await _controller!.stopVideoRecording();

    setState(() {
      _isRecording = false;
      _videoPath = file.path;
    });

    _navigateToEditor();
  }

  Future<void> _toggleCamera() async {
    if (_cameras.length < 2) return;

    setState(() => _isFrontCamera = !_isFrontCamera);
    await _controller?.dispose();
    _initializeCamera();
  }

  Future<void> _toggleFlash() async {
    if (!_isInitialized) return;

    setState(() => _flashEnabled = !_flashEnabled);
    await _controller!.setFlashMode(
        _flashEnabled ? FlashMode.torch : FlashMode.off
    );
  }

  Future<void> _importFromGallery() async {
    final video = await _picker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: Duration(seconds: _maxDuration),
    );

    if (video != null) {
      _videoPath = video.path;
      _navigateToEditor();
    }
  }

  void _navigateToEditor() {
    if (_videoPath == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoEditorScreen(
          projectName: 'demo',
          videoFile: File(_videoPath!),
        ),
      ),
    );
  }

  String _formatDuration(int seconds) {
    return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Perfectly scaled camera preview
          _buildCameraPreview(),

          // Top controls
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),

                if (_isRecording)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _formatDuration(_recordingSeconds),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                IconButton(
                  icon: Icon(
                    _flashEnabled ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: _toggleFlash,
                ),
              ],
            ),
          ),

          // Bottom controls
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Gallery button
                    IconButton(
                      icon: Icon(Icons.photo_library, color: Colors.white, size: 30),
                      onPressed: _importFromGallery,
                    ),

                    // Record button
                    GestureDetector(
                      onTap: _toggleRecording,
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 4,
                          ),
                        ),
                        child: Center(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: _isRecording ? 30 : 60,
                            height: _isRecording ? 30 : 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _isRecording ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Flip camera button
                    IconButton(
                      icon: Icon(Icons.flip_camera_ios, color: Colors.white, size: 30),
                      onPressed: _toggleCamera,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}