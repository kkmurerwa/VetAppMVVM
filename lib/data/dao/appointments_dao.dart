import 'package:floor/floor.dart';
import 'package:vet_app_mvvm/data/entity/appointments.dart';

@dao
abstract class AppointmentDao {
  @Query('SELECT * FROM Appointment')
  Future<List<Appointment>> findAllAppointments();

  // @Query('SELECT * FROM Appointment WHERE id = :id')
  // Stream<Appointment> findAppointmentById(int id);

  @insert
  Future<void> insertAppointment(Appointment appointment);
}