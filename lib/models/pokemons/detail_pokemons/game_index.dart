import 'version.dart';

class GameIndex {
  int? gameIndex;
  Version? version;

  GameIndex({this.gameIndex, this.version});

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json['game_index'] as int?,
        version: json['version'] == null
            ? null
            : Version.fromJson(json['version'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'game_index': gameIndex,
        'version': version?.toJson(),
      };

  GameIndex copyWith({
    int? gameIndex,
    Version? version,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      version: version ?? this.version,
    );
  }
}
