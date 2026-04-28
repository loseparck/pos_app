import 'package:pos_app/features/authentication/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'], 
      name:  json['name'], 
      email:  json['email'], 
      role:  json['role']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id, 
      "name":  name, 
      "email":  email, 
      "role":  name,
    };
  }
}