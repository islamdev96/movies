import '../../domain/entities/recommmendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required int id,
    required String backdropPath,
  }) : super(
          id: id,
          backdropPath: backdropPath,
        );

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'backdrop_path': backdropPath,
    };
  }
}
