import 'package:flutter/foundation.dart';
import 'package:vet_app_mvvm/data/database/database.dart';
import 'package:vet_app_mvvm/data/entity/payments.dart';

class PaymentsVM with ChangeNotifier, DiagnosticableTreeMixin {
  List<Payment> _payments  = [];

  List<Payment> get payments  => _payments;

  void fetchAllPayments() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final paymentsDao = database.paymentsDao;

    final results = await paymentsDao.fetchAllPayments();

    this._payments = results.map((item) => item).toList();

    notifyListeners();
  }

  void insertPlaceholderData() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final paymentsDao = database.paymentsDao;

    final payment1 = Payment(1, 1, 1200, 100001010, "cash");
    final payment2 = Payment(2, 2, 1200, 100001010, "cash");
    final payment3 = Payment(3, 3, 1200, 100001010, "mpesa");
    final payment4 = Payment(4, 4, 1200, 100001010, "cash");
    final payment5 = Payment(5, 5, 1200, 100001010, "cash");

    paymentsDao.insertPayment(payment1);
    paymentsDao.insertPayment(payment2);
    paymentsDao.insertPayment(payment3);
    paymentsDao.insertPayment(payment4);
    paymentsDao.insertPayment(payment5);

    // appointmentDao.insertAppointment(appointment2);
    // appointmentDao.insertAppointment(appointment3);
  }
}