part of 'admin_bloc.dart';


abstract class AdminEvent {}
class AdminRegisterUser extends AdminEvent{
  final AddDoctorDomainRequest addDoctorDomainRequest;
  AdminRegisterUser(this.addDoctorDomainRequest);

}