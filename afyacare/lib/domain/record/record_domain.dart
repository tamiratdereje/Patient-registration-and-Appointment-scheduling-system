class RecordDomain{
  
  RecordDate? dateTime;
  List<RecordMedicine> medicine;
  RecordDescrption descrption;
  RecordeId? id;
  RecordPatientId? patientId;


  RecordDomain({
    this.dateTime,
    required this.descrption,
    required this.medicine,
    required this.id,
    this.patientId
  });
}

class RecordMedicine {

  String medicine;
  RecordMedicine({required this.medicine});

  @override
  String toString() {
    return medicine;
  }
}


class RecordPatientId {

  String patientId;
  RecordPatientId({required this.patientId});
  
  
  @override
  String toString() {
    return patientId;
  }

}


class RecordDate {
  DateTime dateTime;
  RecordDate({required this.dateTime});

  @override
  String toString() {
    return dateTime.toString();
  }
}



class RecordDescrption {

  String descrption;
  RecordDescrption({required this.descrption});

  @override
  String toString() {
    return descrption;
  }

}

class RecordeId {
  String id;
  RecordeId({required this.id});

  @override
  String toString() {
    return id;
  }

}
