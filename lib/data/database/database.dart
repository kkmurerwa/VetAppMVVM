// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:vet_app_mvvm/data/dao/appointments_dao.dart';
import 'package:vet_app_mvvm/data/dao/payments_dao.dart';
import 'package:vet_app_mvvm/data/entity/appointments.dart';
import 'package:vet_app_mvvm/data/entity/payments.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Appointment, Payment])
abstract class AppDatabase extends FloorDatabase {
  AppointmentDao get appointmentsDao;
  PaymentDao get paymentDao;
}
// Run the code below to create the database
// flutter packages pub run build_runner watch
// or
// flutter packages pub run build_runner build