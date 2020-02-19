class UserDetail {
  final String firstName;
  final String lastName;
  final int age;
  final String address;
  final String email;
  final String phone;
  final String userId;

  UserDetail({this.userId,
      this.firstName,
      this.lastName,
      this.address,
      this.age,
      this.phone,
      this.email});

  toJson() {
    return {
      "userId": userId,
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "age": age,
      "phone": phone,
      "email": email
    };
  }
}
