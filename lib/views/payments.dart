import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app_mvvm/data/entity/payments.dart';
import 'package:vet_app_mvvm/res/colors/colors.dart';
import 'package:vet_app_mvvm/res/decorations/neuromorphic_views.dart';
import 'package:vet_app_mvvm/viewmodels/payments_vm.dart';

class Payments extends StatelessWidget {

  const Payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Insert placeholder data
    // context.read<PaymentsVM>().insertPlaceholderData();

    // Initialize function to fetch payments from DB
    context.read<PaymentsVM>().fetchAllPayments();


    return Scaffold(
      body: PaymentList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: colorPrimary,
        child: Icon(
          Icons.add,
          color: colorText,
        ),
      ),
    );
  }
}

class PaymentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Payment> paymentList = context.watch<PaymentsVM>().payments;

    return ListView.builder(
      itemCount: paymentList.length,
      itemBuilder: (context, index) {

        Payment payment = paymentList[index];

        return GestureDetector(
          onTap: (){},
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.all(5),
              decoration: nMbox,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        payment.id.toString(),
                        style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        payment.amountPaid.toString(),
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                ],
              )
          ),
        );
      },
    );
  }
}

