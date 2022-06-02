import 'package:afyacare/domain/schedule/schedule_domain.dart';
import 'package:afyacare/infrastructure/schedule/schedule_data_provider.dart';
import 'package:afyacare/infrastructure/schedule/schedule_model.dart';


class ScheduleRepo {

  ScheduleProvider scheduleProvider = ScheduleProvider();
  ScheduleRepo();

  Future<void> createSchedule(ScheduleDomain scheduleDomain) async {
    ScheduleModel scheduleModel = ScheduleModel(
        token: scheduleDomain.token,
        selected_date: scheduleDomain.dateTime,
        );
    scheduleProvider.createSchedule(scheduleModel);

    // return true;
  }

// todo 
  Future<List<ScheduleDomain>> getSchedule(String token) async {
    
    List<ScheduleModel> list_of_sche = await scheduleProvider.getSchedule(token);

    final mapped = list_of_sche.map((e) => ScheduleDomain(
        token: e.token, dateTime: e.selected_date
        )).toList();

    return mapped;
  }


  Future<void> deleteSchedule(String id) async {
    await scheduleProvider.deleteSchedule(id);
  }     
  
  // Future<void> editSchedule(ScheduleDomain scheduleDomain) async {
  //   ScheduleModel scheduleModel = ScheduleModel(
  //       token: scheduleDomain.token,
  //       selected_date: scheduleDomain.dateTime
  //       );
  //   scheduleProvider.editSchedule(scheduleModel);
  // }     
}
