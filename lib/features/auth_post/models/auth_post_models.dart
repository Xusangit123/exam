class AuthPostModels {
  final String username;
  final String email;
  final String phone;
  final String fullName;
  final String region;
  final int birthYear;
  final String password;

  AuthPostModels({
    required this.username,
    required this.email,
    required this.phone,
    required this.fullName,
    required this.region,
    required this.birthYear,
    required this.password,
  });

  factory AuthPostModels.fromJson(Map<String, dynamic> json) {
    return AuthPostModels(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      fullName: json['full_name'] ?? '',
      region: json['region'] ?? '',
      birthYear: json['birth_year'] ?? 0,
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'full_name': fullName,
      'region': region,
      'birth_year': birthYear,
      'password': password,
    };
  }


  int get age => DateTime.now().year - birthYear;
}
