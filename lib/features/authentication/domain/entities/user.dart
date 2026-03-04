import 'package:pos_app/features/authentication/domain/entities/role.dart';

class User{
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.token = ''
  });

  bool get isAdmin => role == UserRole.admin;
}