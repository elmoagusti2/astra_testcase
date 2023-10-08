import 'package:astra_testscase/models/pokemons/detail_pokemons/abilities.dart';

class Ability {
  Abilities? ability;
  bool? isHidden;
  int? slot;

  Ability({this.ability, this.isHidden, this.slot});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: json['ability'] == null
            ? null
            : Abilities.fromJson(json['ability'] as Map<String, dynamic>),
        isHidden: json['is_hidden'] as bool?,
        slot: json['slot'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ability': ability?.toJson(),
        'is_hidden': isHidden,
        'slot': slot,
      };

  Ability copyWith({
    Abilities? ability,
    bool? isHidden,
    int? slot,
  }) {
    return Ability(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }
}
