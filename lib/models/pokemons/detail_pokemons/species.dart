class Species {
  String? name;
  String? url;

  Species({this.name, this.url});

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Species copyWith({
    String? name,
    String? url,
  }) {
    return Species(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
