import 'package:equatable/equatable.dart';

class Abilities extends Equatable {
  final String? name;
  final String? url;

  const Abilities({this.name, this.url});

  factory Abilities.fromJson(Map<String, dynamic> json) => Abilities(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Abilities copyWith({
    String? name,
    String? url,
  }) {
    return Abilities(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
