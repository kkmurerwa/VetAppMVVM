import 'package:flutter/foundation.dart';
import 'package:vet_app_mvvm/data/database/database.dart';
import 'package:vet_app_mvvm/data/entity/appointments.dart';


class AppointmentsWatcher with ChangeNotifier, DiagnosticableTreeMixin {
  List<Appointment> _appointments  = [];

  int _number = 0;

  List<Appointment> get appointments => _appointments;

  int get number => _number;

  Future<List<Appointment>> fetchAllAppointments() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final appointmentDao = database.appointmentsDao;

    final results = await appointmentDao.findAllAppointments();

    this._appointments = results.map((item) => item).toList();

    notifyListeners();

    print(this._appointments.toString());

    return appointments;
  }

  Future<void> createNewAppointment() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final appointmentDao = database.appointmentsDao;
    final appointment = Appointment(1, "Kenneth", "0705352411", "Dog", "German Shepherd",
        "Male", "27", "3", "visit", "clinic", "pending", 101010101, false);
    notifyListeners();
  }
}