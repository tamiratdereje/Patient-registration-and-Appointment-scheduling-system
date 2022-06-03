
import 'package:afyacare/domain/record/record_domain.dart';
import 'package:afyacare/infrastructure/record/record_data_provider.dart';
import 'package:afyacare/infrastructure/record/record_model.dart';

class RecordRepository{
  RecordRepository();
  RecordProvider recordProvider = RecordProvider();


  Future<void> createRecord(RecordDomain recordDomain) async{


    // await recordProvider.createRecord(
      
    //   );

  }
}