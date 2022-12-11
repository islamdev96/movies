import '../../domain/entities/recommmendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.id,
    super.backdropPath,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
    );
  }
}
