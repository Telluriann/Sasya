import 'dart:convert';
import 'package:camera/camera.dart';
import '../models/plant_info.dart';
// import 'package:http/http.dart' as http; // Uncomment when using real API

class ApiService {
  // Replace with real real API endpoint
  // static const String _mockApiUrl = 'https://mock.api/plants/identify';

  Future<PlantInfo?> identifyPlant(XFile imageFile) async {
    // MOCK IMPLEMENTATION
    // Delay to simulate network request
    await Future.delayed(const Duration(seconds: 2));

    // For the starter code, we return mock data exactly as the UI expects.
    // To connect a real API, use an http multipar request:
    /*
    var request = http.MultipartRequest('POST', Uri.parse(_mockApiUrl));
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    // add headers, auth, etc.
    var response = await request.send();
    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      return PlantInfo.fromJson(jsonDecode(respStr));
    }
    */

    return PlantInfo(
      commonName: 'Sunflower',
      scientificName: 'Helianthus annuus',
      kingdom: 'Plantae',
      family: 'Asteraceae',
      plantGroup: 'Angiosperms',
      description: 'The sunflower is a tall, bright yellow flower known for its large head and seeds.',
    );
  }
}
