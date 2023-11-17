class UserModel {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final List<dynamic> favVolunteerings;
  String currVolunteering;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.favVolunteerings,
    required this.currVolunteering,
  });

  toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'email': email,
        'currVolunteering': currVolunteering,
        'favVolunteerings': favVolunteerings,
      };

  factory UserModel.fromMap(Map<String, dynamic> map, String? id) {
    return UserModel(
      id: id ?? '',
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
      favVolunteerings: map['favVolunteerings'],
      currVolunteering: map['currVolunteering'],
    );
  }
}
