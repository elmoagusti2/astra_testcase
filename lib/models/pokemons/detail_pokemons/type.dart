import 'package:astra_testscase/models/pokemons/detail_pokemons/types.dart';

class Type {
  int? slot;
  Types? type;

  Type({this.slot, this.type});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'] as int?,
        type: json['type'] == null
            ? null
            : Types.fromJson(json['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'slot': slot,
        'type': type?.toJson(),
      };

  Type copyWith({
    int? slot,
    Types? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }
}
