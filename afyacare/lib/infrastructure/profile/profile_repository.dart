import 'package:afyacare/domain/profile/profile_domain.dart';
import 'package:afyacare/infrastructure/profile/profile_data_provider.dart';
import 'package:afyacare/infrastructure/profile/profile_model.dart';

class ProfileRepo {
  ProfileRepo();
  ProfileDataProvider profileDataProvider = ProfileDataProvider();
  
  Future<void> editPassword(ProfileDomain profileDomain) async {
    try {
      ProfileModel profileModel = ProfileModel(
          new_password: profileDomain.new_password.toString(),
          old_password: profileDomain.old_password.toString());

      var response = await profileDataProvider.editPassword(profileModel);
    } catch (e) {}
  }


  Future<void> deleteAccount() async {
    try {

      await profileDataProvider.delete();
      
    } catch (e) {
      print(e);
    }
  }

    Future<void> logout() async {
      try {
        await profileDataProvider.logout();
      } catch (e) {
        print(e);
      }
    }
  }

