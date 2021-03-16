import 'package:floor/floor.dart';
import 'package:vet_app_mvvm/data/entity/payments.dart';

@dao
abstract class PaymentDao {
  @Query('SELECT * FROM Payment')
  Future<List<Payment>> fetchAllPayments();

  // @Query('SELECT * FROM Payment WHERE id = IS NOT NULL :id')
  // Stream<Payment> findPaymentById(int id);

  @insert
  Future<void> insertPayment(Payment payment);
}