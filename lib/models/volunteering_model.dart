class VolunteeringModel {
  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final String subtitle;
  final String body;
  final String requirements;
  final String location;
  final String availability;
  final int vacancies;
  final List<dynamic> subscribed;
  final List<dynamic> pending;

  VolunteeringModel({
    required this.id,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.body,
    required this.requirements,
    required this.location,
    required this.availability,
    required this.vacancies,
    required this.subscribed,
    required this.pending,
  });

  toJson() => {
        'id': id,
        'category': category,
        'title': title,
        'imageUrl': imageUrl,
        'subtitle': subtitle,
        'body': body,
        'requirements': requirements,
        'location': location,
        'availability': availability,
        'vacancies': vacancies,
        'subscribed': subscribed,
        'pending': pending,
      };

  factory VolunteeringModel.fromMap(Map<String, dynamic> map, String? id) {
    return VolunteeringModel(
      id: id ?? '',
      category: map['category'] ?? '',
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      subtitle: map['subtitle'] ?? '',
      body: map['body'] ?? '',
      requirements: map['requirements'] ?? '',
      location: map['location'] ?? '',
      availability: map['availability'] ?? '',
      vacancies: map['vacancies'] ?? 0,
      subscribed: map['subscribed'] ?? [],
      pending: map['pending'] ?? [],
    );
  }
}
