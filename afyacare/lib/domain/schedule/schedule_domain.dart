import 'package:afyacare/domain/schedule/schedule_date_time.dart';
import 'package:afyacare/domain/schedule/schedule_domain_helper.dart';
import 'package:afyacare/domain/schedule/schedule_id.dart';

class ScheduleDomain {
  ScheduleDate dateTime;
  UserHelper? userHelper;
  ScheduleId? id;

  ScheduleDomain({
    required this.dateTime,
    this.userHelper,
    this.id
  });
    
}


