import 'package:floor/floor.dart';

@entity
class Payment {
  @primaryKey
  final int id, appointmentId, amountPaid, date;

  final String paymentMethod;

  Payment(this.id, this.appointmentId, this.amountPaid, this.date, this.paymentMethod);
}