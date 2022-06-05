import 'package:afyacare/domain/record/record_domain.dart';
import 'package:afyacare/infrastructure/record/record_data_provider.dart';
import 'package:afyacare/infrastructure/record/record_model.dart';

class RecordRepository {
  RecordRepository();
  RecordProvider recordProvider = RecordProvider();

  Future<List<RecordDomain>> getAllRecord() async {
    print("llllllllll2222222222222222222222222222222222222222222aaaaaaallla");
    List<RecordModel> list_of_record = await recordProvider.getAllRecord();

    final mapped = list_of_record
        .map((e) => RecordDomain(
            patientId: RecordPatientId(patientId: e.patientId),
            descrption: RecordDescrption(descrption: e.descrption.toString()),
            dateTime: RecordDate(dateTime: e.dateTime),
            medicine: RecordMedicine(medicine: e.medicine),
            id: RecordId(id: e.id.toString())))
        .toList();

    print("llllllllllllllalalalalalaaaaaaaaaaaaallla");
    print(mapped);

    return mapped;
  }

//   Future<void> deleteRecord(RecordId id) async {
//     await recordProvider.deleteRecord(id.toString());
//   }
// }
}
