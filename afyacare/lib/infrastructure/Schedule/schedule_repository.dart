import 'package:afyacare/domain/schedule/schedule_date_time.dart';
import 'package:afyacare/domain/schedule/schedule_domain.dart';
import 'package:afyacare/domain/schedule/schedule_domain_helper.dart';
import 'package:afyacare/domain/schedule/schedule_id.dart';
import 'package:afyacare/infrastructure/Schedule/patient_schedule_model_response.dart';
import 'package:afyacare/infrastructure/Schedule/schedule_data_provider.dart';
import 'package:afyacare/infrastructure/Schedule/update_schedule_domain.dart';

class ScheduleRepoistory {
  ScheduleRepoistory();
  ScheduleProvider scheduleProvider = ScheduleProvider();

  Future<void> createSchedule(ScheduleDate dateTime) async {
    print("helllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
    print(dateTime.dateTime);
    await scheduleProvider.createSchedule(dateTime.dateTime);
  }

  Future<void> deleteSchedule(ScheduleId scheduleId) async {
    await scheduleProvider.deleteSchedule(scheduleId.schedule_id.toString());
  }

  Future<void> editSchedule(DateTime time, String id) async {
    UpdateScheduleModel updateSchedule =
        UpdateScheduleModel(date: time, id: id);
    await scheduleProvider.editSchedule(updateSchedule);
  }

  Future<List<ScheduleDomain>> getDoctorSchedules() async {
    print("8888888888888888888888");
    final schedules = await scheduleProvider.getDoctorSchedules();

    final sche = schedules
        .map((e) => ScheduleDomain(
              dateTime: ScheduleDate(dateTime: e.dateTime),
              userHelper:
                  UserHelper(name: e.user.doctor_name, userId: e.user.doctorId),
              id: ScheduleId(schedule_id: e.scheduleId),
            ))
        .toList();

    return sche;
  }

  Future<List<ScheduleDomain>> getPatientSchedules() async {
    final schedules = await scheduleProvider.getPatientSchedules();

    final sche = schedules
        .map((e) => ScheduleDomain(
            dateTime: ScheduleDate(dateTime: e.dateTime),
            id: ScheduleId(schedule_id: e.scheduleId),
            userHelper:
                UserHelper(name: e.user.doctor_name, userId: e.user.doctorId)))
        .toList();
    print("111111111111111111111111111111111111111111111111111111");
    print(sche);
    return sche;
  }
}
