import 'package:afyacare/domain/Medicine/medicine_Domain.dart';
import 'package:afyacare/domain/Medicine/medicine_description.dart';
import 'package:afyacare/domain/Medicine/medicine_name.dart';
import 'package:afyacare/domain/Medicine/medicine_quantity.dart';
import 'package:afyacare/infrastructure/medicine/medicine_data_provider.dart';
import 'package:afyacare/infrastructure/medicine/medicine_model.dart';

class MedicineRepo {
  MedicineProvider medicineProvider = MedicineProvider();
  MedicineRepo();

  Future<void> createMedicine(MedicineDomain medicineDomain) async {
    MedicineModel medicineModel = MedicineModel(
        name: medicineDomain.name.toString(),
        descrption: medicineDomain.descrption.toString(),
        quantity: int.parse(medicineDomain.quantity.toString()));

    medicineProvider.createMedicine(medicineModel);
  }

//  done medicine edit
  Future<void> editMedicine(MedicineDomain medicineDomain) async {
    MedicineModel medicineModel = MedicineModel(
        name: medicineDomain.name.toString(),
        descrption: medicineDomain.descrption.toString(),
        quantity: int.parse(medicineDomain.quantity.toString()),
        id: medicineDomain.id.toString());

    medicineProvider.editMedicine(medicineModel);
  }

  Future<List<MedicineDomain>> getAllMedicine() async {
    List<MedicineModel> list_of_med = await medicineProvider.getAllMedicine();
    print(MedicineName(medicineName: list_of_med[0].name));
    try {
      final mapped = list_of_med
          .map((e) => MedicineDomain(
              name: MedicineName(medicineName: e.name),
              descrption:
                  MedicineDescription(medicineDescription: e.descrption),
              quantity: MedicineQuantity(medicineQuantity: e.quantity),
              id: MedicineId(id: e.id!)))
          .toList();
      return mapped;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<MedicineDomain>> getMedicineDetail(String id) async {
    MedicineModel med = await medicineProvider.getMedicine(id);

    final MedicineDomain medicine = MedicineDomain(
        descrption:
            MedicineDescription(medicineDescription: med.descrption.toString()),
        name: MedicineName(medicineName: med.name.toString()),
        quantity: MedicineQuantity(
            medicineQuantity: int.parse(med.quantity.toString())),
        id: MedicineId(id: med.id.toString()));

    return [medicine];
  }

  Future<void> deleteMedicine(MedicineId id) async {
    await medicineProvider.deleteMedicine(id.toString());
  }

  Future<MedicineModel> searchMedicine(String medicineName) async {
    print("bonssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaa");
    final response = await medicineProvider.searchMedicine(medicineName);
    return response;
  }
}
