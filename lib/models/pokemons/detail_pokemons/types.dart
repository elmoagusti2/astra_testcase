import 'package:equatable/equatable.dart';

class Types extends Equatable {
  final String? name;
  final String? url;

  const Types({this.name, this.url});

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Types copyWith({
    String? name,
    String? url,
  }) {
    return Types(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
