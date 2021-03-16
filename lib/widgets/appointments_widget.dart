import 'package:flutter/material.dart';
import 'package:vet_app_mvvm/data/entity/appointments.dart';

class AppointmentsWidget extends StatelessWidget {
  final List<Appointment> appointments;


  AppointmentsWidget({required this.appointments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.appointments.length,
      itemBuilder: (context, index) {

        final appointment = this.appointments[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(appointment.ownerName),
        );
      },
    );
  }
}
