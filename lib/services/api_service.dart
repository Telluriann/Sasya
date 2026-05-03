import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart'; // For debugPrint
import '../models/plant_info.dart';

class ApiService {
  Future<PlantInfo?> identifyPlant(XFile imageFile) async {
    // Manually setting plantName to "sunflower" as requested
    String plantName = "rice";

    debugPrint('=== FIRESTORE FETCH INITIATED ===');
    debugPrint(
        'Attempting to query collection: "plants" for document ID: "$plantName"');

    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('plants')
          .doc(plantName)
          .get();

      debugPrint('Query completed. Document exists? ${docSnapshot.exists}');

      if (docSnapshot.exists && docSnapshot.data() != null) {
        final data = docSnapshot.data()!;

        debugPrint(
            'Current User UID: ${FirebaseAuth.instance.currentUser?.uid}');

        // Log the result in the console
        debugPrint('--- Firestore Data Fetched ---');
        debugPrint('Raw Data: $data');
        debugPrint('common_name: ${data['common_name']}');
        debugPrint('sc_name: ${data['sc_name']}');
        debugPrint('------------------------------');

        return PlantInfo.fromJson(data);
      } else {
        // Handle the case when the document does not exist
        debugPrint(
            'Document for "$plantName" does not exist or has null data.');
        return PlantInfo(
          commonName: 'Not Found',
          scientificName: 'N/A',
          kingdom: 'N/A',
          family: 'N/A',
          plantGroup: 'N/A',
          description: 'No data found for plant: "$plantName" in the database.',
        );
      }
    } catch (e, stacktrace) {
      debugPrint('!!! Error fetching from Firestore !!!');
      debugPrint('Error Details: $e');
      debugPrint('Stacktrace: $stacktrace');
      return PlantInfo(
        commonName: 'Error',
        scientificName: 'N/A',
        kingdom: 'N/A',
        family: 'N/A',
        plantGroup: 'N/A',
        description: 'Failed to fetch plant data from database: $e',
      );
    }
  }
}
