class UserModel {
  final String id;
  final String name;
  final String lastname;
  final String city;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.city,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      lastname: json['lastname'] ?? '',
      city: json['city'] ?? '',
      image: json['image'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'city': city,
      'image': image,
    };
  }
}