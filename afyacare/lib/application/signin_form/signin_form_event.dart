import 'package:afyacare/domain/auth/login_user_domain.dart';
import 'package:afyacare/infrastructure/auth/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginDomain loginDomain;
  LoginEvent(this.loginDomain);
}

