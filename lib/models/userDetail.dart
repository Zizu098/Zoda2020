class UserDetail {
  String firstName;
  String lastName;
  String age;
  String address;
  String email;
  String phone;
  String userId;
  String imgUrl;
  String status;

  UserDetail({
      this.userId,
      this.firstName,
      this.lastName,
      this.address,
      this.age,
      this.phone,
      this.email,
      this.imgUrl,
      this.status
      });


  UserDetail.fromMap(Map snapshot, String id):

    userId = id ?? '',
    firstName = snapshot['firstName'] ?? '',
    lastName = snapshot['lastName'] ?? '',
    age = snapshot['age'] ?? '',
    address = snapshot['address'] ?? '',
    email = snapshot['email'] ?? '',
    phone = snapshot['phone'] ?? '',
      
    status = snapshot['status'] ?? '';


  toJson() {
    return {
      "userId": userId,
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "age": age,
      "phone": phone,
      "email": email,
      "imgUrl": imgUrl,
      "status": status
    };
  }
}
