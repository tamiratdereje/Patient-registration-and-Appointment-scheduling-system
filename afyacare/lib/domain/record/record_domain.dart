class RecordDomain{
  
  RecordDate dateTime;
  RecordMedicine medicine;
  RecordDescrption descrption;
  RecordId id;
  RecordPatientId patientId;


  RecordDomain({
    required this.dateTime,
    required this.descrption,
    required this.medicine,
    required this.id,
    required this.patientId
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
  

  

}


class RecordDate {
  String dateTime;
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

class RecordId {
  String id;
  RecordId({required this.id});

  @override
  String toString() {
    return id;
  }

}
