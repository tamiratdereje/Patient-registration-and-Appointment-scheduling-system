import 'package:afyacare/domain/record/record_domain.dart';
import 'package:afyacare/infrastructure/record/record_data_provider.dart';
import 'package:afyacare/infrastructure/record/record_model.dart';

class RecordRepository {
  RecordRepository();
  RecordProvider recordProvider = RecordProvider();

  Future<void> createRecord(RecordDomain recordDomain) async {
    final meds = recordDomain.medicine
        .map((e) => RecordMedicine(medicine: e.medicine))
        .toList();

    RecordModel recordModel = RecordModel(
        descrption: recordDomain.descrption.toString(),
        medicine: meds.map((e) => recordDomain.medicine.toString()).toList(),
        patientId: recordDomain.patientId.toString());
    await recordProvider.createRecord(recordModel);
  }

Future<void> editRecord(RecordDomain recordDomain) async {
    final meds = recordDomain.medicine
        .map((e) => RecordMedicine(medicine: e.medicine))
        .toList();

    RecordModel recordModel = RecordModel(

        descrption: recordDomain.descrption.toString(),
        medicine: meds.map((e) => recordDomain.medicine.toString()).toList(),
        id: recordDomain.id.toString());

    await recordProvider.editRecord(recordModel);

  }

  Future<RecordDomain> getRecordDetail(String id) async {
    RecordModel rec = await recordProvider.getRecord(id);
    final meds = rec.medicine.map((e) => RecordMedicine(medicine: e));

    final RecordDomain record = RecordDomain(
        descrption: RecordDescrption(descrption: rec.descrption.toString()),
        medicine: meds.toList(),
        id: RecordId(id: rec.id.toString()));

    return record;
  }


  Future<List<RecordDomain>> getAllRecord(String patientId) async {
      List<RecordModel> list_of_record = await recordProvider.getAllRecord(patientId);

      final mapped = list_of_record.map((e) => RecordDomain(

        descrption: RecordDescrption(descrption: e.descrption.toString()),

        medicine: e.medicine.map((strmed) => RecordMedicine(medicine: strmed)).toList(),
        id: RecordId(id: e.id.toString())
        )).toList();

  
      return mapped;
    }

    Future<void> deleteRecord(RecordId id) async {
    await recordProvider.deleteRecord(id.toString());
  }
  
}
