
import 'package:afyacare/domain/schedule/schedule_date_time.dart';
import 'package:afyacare/domain/schedule/schedule_domain.dart';
import 'package:afyacare/domain/schedule/schedule_domain_helper.dart';
import 'package:afyacare/domain/schedule/schedule_id.dart';
import 'package:afyacare/infrastructure/Schedule/schedule_data_provider.dart';
import 'package:afyacare/infrastructure/Schedule/update_schedule_domain.dart';

class ScheduleRepoistory {
  
  ScheduleRepoistory();
  ScheduleProvider scheduleProvider = ScheduleProvider();

  Future<void> createSchedule(ScheduleDate dateTime) async {
    await scheduleProvider.createSchedule(dateTime.dateTime);
  }

  Future<void> deleteSchedule(ScheduleId scheduleId) async {
    await scheduleProvider.deleteSchedule(scheduleId.schedule_id.toString());
  }
  
  Future<void> editSchedule(ScheduleDomain scheduleDomain) async {
    UpdateScheduleDomain updateSchedule =  UpdateScheduleDomain(dateTime: scheduleDomain.dateTime.dateTime, id: scheduleDomain.id!.schedule_id.toString());
    await scheduleProvider.editSchedule(updateSchedule);
  }


  Future<List<ScheduleDomain>> getDoctorSchedules() async {

    final schedules = await scheduleProvider.getDoctorSchedules();

    final sche = schedules.map((e) => ScheduleDomain(dateTime: ScheduleDate(dateTime: e.dateTime),
    userHelper: UserHelper(name: e.user!.patient_name, userId: e.user!.patientId)
    
    )).toList();
    print("111111111111111111111111111111111111111111111111111111");
    print(sche);

    
    return sche;
  }

  Future<List<ScheduleDomain>> getPatientSchedules() async {
    final schedules = await scheduleProvider.getPatientSchedules();

    final sche = schedules.map((e) => ScheduleDomain(dateTime: ScheduleDate(dateTime: e.dateTime),
    userHelper: UserHelper(name: e.user!.doctor_name, userId: e.user!.doctorId)
    )).toList();
    print("111111111111111111111111111111111111111111111111111111");
    print(sche);
    return sche;
  }
}