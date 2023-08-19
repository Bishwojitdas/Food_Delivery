class SignUpModel {
  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.postCode,
    required this.districtId,
    required this.password,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String mobile;
  late final String address;
  late final int postCode;
  late final int districtId;
  late final String password;

  SignUpModel.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    postCode = json['post_code'];
    districtId = json['district_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['address'] = address;
    _data['post_code'] = postCode;
    _data['district_id'] = districtId;
    _data['password'] = password;
    return _data;

  }

  @override
  String toString() {
    return 'RegistrationModel{firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile, address: $address, postCode: $postCode, districtId: $districtId, password: $password}';
  }
}