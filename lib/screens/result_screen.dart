import 'package:flutter/material.dart';
import '../models/plant_info.dart';

class ResultScreen extends StatelessWidget {
  final PlantInfo plantInfo;

  const ResultScreen({super.key, required this.plantInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Icon(Icons.local_florist, size: 64, color: Colors.green),
                    const SizedBox(height: 16),
                    Text(
                      plantInfo.commonName,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      plantInfo.scientificName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[700],
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoRow(context, Icons.account_tree, 'Kingdom', plantInfo.kingdom),
            _buildInfoRow(context, Icons.park, 'Family', plantInfo.family),
            _buildInfoRow(context, Icons.category, 'Group', plantInfo.plantGroup),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              plantInfo.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green[600]),
          const SizedBox(width: 16),
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
