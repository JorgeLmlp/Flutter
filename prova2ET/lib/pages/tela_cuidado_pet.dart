import 'package:flutter/material.dart';
import 'package:jorge_luis/widgets/card_status_pet.dart';

class CuidadoPet extends StatelessWidget {
  const CuidadoPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "home",
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [CardStatusPet()],
          )),
        ));
  }
}
