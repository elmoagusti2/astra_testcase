import 'package:equatable/equatable.dart';

class Stats extends Equatable {
  final String? name;
  final String? url;

  const Stats({this.name, this.url});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Stats copyWith({
    String? name,
    String? url,
  }) {
    return Stats(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
