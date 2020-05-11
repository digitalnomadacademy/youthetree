class UserO {
  final String email;
  final String name;
  final String phone;

  UserO({this.email, this.phone, this.name});


  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'name': this.name,
      'phone': this.phone,
    };
  }

  factory UserO.fromMap(Map<String, dynamic> map) {
    return UserO(
      email: map['email'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
    );
  }
}
