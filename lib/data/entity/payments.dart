import 'package:floor/floor.dart';

@entity
class Payment {
  @primaryKey
  final int id;

  final String appointmentId;
  final int amountPaid;
  final int date;

  Payment(this.id, this.appointmentId, this.amountPaid, this.date);
}