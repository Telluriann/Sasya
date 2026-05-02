class PlantInfo {
  final String commonName;
  final String scientificName;
  final String kingdom;
  final String family;
  final String plantGroup;
  final String description;

  PlantInfo({
    required this.commonName,
    required this.scientificName,
    required this.kingdom,
    required this.family,
    required this.plantGroup,
    required this.description,
  });

  factory PlantInfo.fromJson(Map<String, dynamic> json) {
    return PlantInfo(
      commonName: json['common_name'] ?? 'Unknown',
      scientificName: json['sc_name'] ?? json['scientific_name'] ?? 'Unknown',
      kingdom: json['kingdom'] ?? 'Unknown',
      family: json['family'] ?? 'Unknown',
      plantGroup: json['plant_group'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
    );
  }
}
