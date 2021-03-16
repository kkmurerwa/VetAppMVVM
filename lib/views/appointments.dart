import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app_mvvm/data/entity/appointments.dart';
import 'package:vet_app_mvvm/res/colors/colors.dart';
import 'package:vet_app_mvvm/res/decorations/neuromorphic_views.dart';
import 'package:vet_app_mvvm/viewmodels/appointments_vm.dart';
import 'package:vet_app_mvvm/util/config.dart';


class Appointments extends StatelessWidget {

  const Appointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Insert placeholder
    context.read<AppointmentsVM>().insertPlaceholderData();

    // Initialize function to fetch appointments from DB
    context.read<AppointmentsVM>().fetchAllAppointments();

    return Scaffold(
      body: AppointmentList(),
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

class AppointmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Appointment> appointmentList = context.watch<AppointmentsVM>().appointments;

    return ListView.builder(
      itemCount: appointmentList.length,
      itemBuilder: (context, index) {

        Appointment appointment = appointmentList[index];

        return GestureDetector(
          onTap: (){},
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.all(5),
              decoration: nMbox,
              child: Row(
                children: [
                  InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/icons/${Config.returnAnimalIcon(appointment.animalName)}",
                                    ),
                                    fit: BoxFit.scaleDown
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              appointment.ownerName,
                              style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              appointment.animalName.substring(0,1).toUpperCase() +
                                  appointment.animalName.substring(1),
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
          ),
        );
      },
    );
  }
}


