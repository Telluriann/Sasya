import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'result_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isInit = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _controller = CameraController(
          cameras.first,
          ResolutionPreset.high,
          enableAudio: false,
        );
        await _controller!.initialize();
        if (mounted) {
          setState(() {
            _isInit = true;
          });
        }
      }
    } catch (e) {
      debugPrint("Camera initialization error: $e");
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized || _isProcessing) {
      return;
    }
    
    setState(() => _isProcessing = true);
    
    try {
      final XFile file = await _controller!.takePicture();
      
      // Analyze with mock API
      final api = ApiService();
      final result = await api.identifyPlant(file);
      
      if (!mounted) return;
      
      if (result != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ResultScreen(plantInfo: result)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to identify plant.')),
        );
        setState(() => _isProcessing = false);
      }
    } catch (e) {
      debugPrint('Error taking picture: $e');
      setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInit || _controller == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Scan Plant'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_controller!),
          ),
          // Overlay overlay to center plant...
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          if (_isProcessing)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Colors.greenAccent),
                    SizedBox(height: 16),
                    Text('Analyzing plant...', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _isProcessing
          ? null
          : FloatingActionButton.large(
              onPressed: _takePicture,
              child: const Icon(Icons.camera),
            ),
    );
  }
}
