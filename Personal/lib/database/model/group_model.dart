class Group {
  final int? id;
  final String? name;

  Group({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name}';
  }
}