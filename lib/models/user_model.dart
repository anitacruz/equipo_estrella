class UserModel {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String altEmail;
  final String phone;
  final String gender;
  final String birthDate;
  final String imageUrl;
  final List<dynamic> favVolunteerings;
  String currVolunteering;

  UserModel({
    required this.id,
    required this.gender,
    required this.name,
    required this.lastname,
    required this.email,
    required this.altEmail,
    required this.phone,
    required this.imageUrl,
    required this.birthDate,
    required this.favVolunteerings,
    required this.currVolunteering,
  });

  toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'email': email,
        'altEmail': altEmail,
        'phone': phone,
        'birthDate': birthDate,
        'currVolunteering': currVolunteering,
        'favVolunteerings': favVolunteerings,
        'gender': gender,
        'imageUrl': imageUrl
      };

  factory UserModel.fromMap(Map<String, dynamic> map, String? id) {
    return UserModel(
      id: id ?? '',
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
      altEmail: map['altEmail'],
      phone: map['phone'],
      birthDate: map['birthDate'],
      favVolunteerings: map['favVolunteerings'],
      currVolunteering: map['currVolunteering'],
      gender: map['gender'],
      imageUrl: map['imageUrl'],
    );
  }

  UserModel copyWith(
      {required String newBirthDate,
      required String newPhone,
      required String newAltEmail,
      required String newImageUrl,
      required String newGender}) {
    return UserModel(
      id: id,
      name: name,
      imageUrl: newImageUrl,
      lastname: lastname,
      email: email,
      altEmail: newAltEmail,
      phone: newPhone,
      birthDate: newBirthDate,
      favVolunteerings: favVolunteerings,
      currVolunteering: currVolunteering,
      gender: newGender,
    );
  }
}
