import 'package:pos_app/features/authentication/domain/entities/role.dart';

class RolePermissions{
  static bool canAccessReports(UserRole role){
    return role == UserRole.admin;
  }

  static bool canCreateSale(UserRole role){
    return role == UserRole.admin || role == UserRole.caisse || role == UserRole.serveur;
  }
}