import 'package:floor/floor.dart';

@entity
class Appointment {
  @primaryKey
  final int id;

  // Add payment made field

  final String ownerName, phoneNumber, animalName,
      breed, animalSex, animalWeight, animalAge, appointmentType,
      location, appointmentStatus;

  final int dateTime;
  final bool isPaid;

  Appointment(this.id, this.ownerName, this.phoneNumber, this.animalName,
      this.breed, this.animalSex, this.animalWeight, this.animalAge,
      this.appointmentType, this.location, this.appointmentStatus, this.dateTime, this.isPaid);
}