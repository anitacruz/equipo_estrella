class UsersModel {
  final String name;
  final String lastname;
  final String email;

  UsersModel({
    required this.name,
    required this.lastname,
    required this.email,
  });

  toJson() => {
        'name': name,
        'lastname': lastname,
        'email': email,
      };

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
    );
  }
}
