import 'package:afyacare/domain/Medicine/medicine_model.dart';
import 'package:afyacare/infrastructure/medicine/medicine_data_provider.dart';
import 'package:afyacare/infrastructure/medicine/medicine_model.dart';

class MedicineRepo {

  MedicineProvider medicineProvider = MedicineProvider();
  MedicineRepo();


  Future<void> createMedicine(MedicineDomain medicineDomain) async {
    MedicineModel medicineModel = MedicineModel(
        name: medicineDomain.name,
        descrption: medicineDomain.descrption,
        quantity: medicineDomain.quantity);

    medicineProvider.createMedicine(medicineModel);
    // return true;
  }



  Future<List<MedicineDomain>> getAllMedicine() async {
    
    List<MedicineModel> list_of_med = await medicineProvider.getAllMedicine();

    final mapped = list_of_med.map((e) => MedicineDomain(
        name: e.name, descrption: e.descrption, quantity: e.quantity)).toList();

    return mapped;
  }


  Future<MedicineDomain> getMedicine(String name) async {
    MedicineModel med = await medicineProvider.getMedicine(name);
    final MedicineDomain medicine = MedicineDomain(descrption: med.descrption, name: med.name, quantity: med.quantity);
    return medicine;
  }


  Future<void> deleteMedicine(String name) async {
    await medicineProvider.deleteMedicine(name);
  }


  Future<void> editMedicine(MedicineDomain medicineDomain) async {

    MedicineModel medicineModel = MedicineModel(
        name: medicineDomain.name,
        descrption: medicineDomain.descrption,
        quantity: medicineDomain.quantity);

    medicineProvider.editMedicine(medicineModel);

  }



}
