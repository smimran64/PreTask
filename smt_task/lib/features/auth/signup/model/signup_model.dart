class SignUpModel {
  final String email;
  final String fullName;
  final String password;

  SignUpModel({
    required this.email,
    required this.fullName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'password': password,
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      password: json['password'] ?? '',
    );
  }

  SignUpModel copyWith({
    String? email,
    String? fullName,
    String? password,
  }) {
    return SignUpModel(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
    );
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  static String getPasswordStrength(String password) {
    if (password.isEmpty) return '';
    if (password.length < 8) return 'Weak';
    if (!password.contains(RegExp(r'[A-Za-z]')) || 
        !password.contains(RegExp(r'\d'))) {
      return 'Medium';
    }
    return 'Strong';
  }

  @override
  String toString() {
    return 'SignUpModel(email: $email, fullName: $fullName)';
  }
}