import 'package:equatable/equatable.dart';

import 'result.dart';

class Pokemons extends Equatable {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;

  const Pokemons({this.count, this.next, this.previous, this.results});

  factory Pokemons.fromJson(Map<String, dynamic> json) => Pokemons(
        count: json['count'] as int?,
        next: json['next'] as String?,
        previous: json['previous'] as dynamic,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toJson()).toList(),
      };

  Pokemons copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<Result>? results,
  }) {
    return Pokemons(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}
