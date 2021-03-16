import 'package:flutter/foundation.dart';
import 'package:vet_app_mvvm/data/database/database.dart';
import 'package:vet_app_mvvm/data/entity/appointments.dart';

class AppointmentsVM with ChangeNotifier, DiagnosticableTreeMixin {
  List<Appointment> _appointments  = [];

  int _number = 0;

  List<Appointment> get appointments => _appointments;

  int get number => _number;

  void fetchAllAppointments() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final appointmentDao = database.appointmentsDao;

    final results = await appointmentDao.findAllAppointments();

    this._appointments = results.map((item) => item).toList();

    print(this._appointments.toString());

    notifyListeners();
  }

  void insertPlaceholderData() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final appointmentDao = database.appointmentsDao;
    final appointment1 = Appointment(2, "John", "0705352411", "Cat", "Persian",
        "Female", "13", "2", "visit", "clinic", "pending", 101010101, false);

    final appointment2 = Appointment(3, "Caleb", "0705352411", "Cow", "Friesian",
        "Female", "142", "5", "visit", "clinic", "pending", 101010101, false);

    final appointment3 = Appointment(4, "Isaac", "0705352411", "Dog", "Chihuahua",
        "Male", "22", "3", "visit", "clinic", "pending", 101010101, false);

    appointmentDao.insertAppointment(appointment2);
    appointmentDao.insertAppointment(appointment3);
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('count', count));
  // }
}