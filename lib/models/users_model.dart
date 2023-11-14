class UsersModel {
  final String ?id;
  final String name;
  final String lastname;
  final String email;
  final List<String> favoriteVolunteerings;

  UsersModel({
    //optional id
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.favoriteVolunteerings,
  });

  toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'email': email,
        'favoriteVolunteerings': favoriteVolunteerings,
      };

  factory UsersModel.fromMap(Map<String, dynamic> map, String? id) {
    return UsersModel(
      id: id ?? '',
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
      favoriteVolunteerings: map['favoriteVolunteerings'],
    );
  }
}
