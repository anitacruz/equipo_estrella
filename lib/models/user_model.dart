class UserModel {
  final String? id;
  final String name;
  final String lastname;
  final String email;
  final List<dynamic> favVolunteerings;

  UserModel({
    //optional id
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.favVolunteerings,
  });

  toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'email': email,
        'favVolunteerings': favVolunteerings,
      };

  factory UserModel.fromMap(Map<String, dynamic> map, String? id) {
    return UserModel(
      id: id ?? '',
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
      favVolunteerings: map['favVolunteerings'],
    );
  }
}
