import 'package:pos_app/features/authentication/domain/entities/role.dart';
import 'package:pos_app/features/authentication/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.token
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'], 
      name:  json['name'], 
      email:  json['email'], 
      role:  UserRole.values.firstWhere((e) => e.name == json['role']), 
      token:  json['token']);
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id, 
      "name":  name, 
      "email":  email, 
      "role":  role.name, 
      "token":  token,
    };
  }
}