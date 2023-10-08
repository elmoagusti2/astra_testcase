class Form {
  String? name;
  String? url;

  Form({this.name, this.url});

  factory Form.fromJson(Map<String, dynamic> json) => Form(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Form copyWith({
    String? name,
    String? url,
  }) {
    return Form(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
