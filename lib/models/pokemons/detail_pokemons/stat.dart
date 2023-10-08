import 'package:astra_testscase/models/pokemons/detail_pokemons/stats.dart';

class Stat {
  int? baseStat;
  int? effort;
  Stats? stat;

  Stat({this.baseStat, this.effort, this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'] as int?,
        effort: json['effort'] as int?,
        stat: json['stat'] == null
            ? null
            : Stats.fromJson(json['stat'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat?.toJson(),
      };

  Stat copyWith({
    int? baseStat,
    int? effort,
    Stats? stat,
  }) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }
}
