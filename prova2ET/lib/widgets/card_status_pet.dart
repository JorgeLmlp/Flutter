import 'package:flutter/material.dart';
import 'package:jorge_luis/models/pet.dart';

class CardStatusPet extends StatefulWidget {
  const CardStatusPet({super.key});

  @override
  State<CardStatusPet> createState() => _CardStatusPetState();
}

class _CardStatusPetState extends State<CardStatusPet> {
   Pet pet = Pet();
  void brincar() {
    pet.brincar();
  }

  void alimentar() {
    pet.alimentar();
  }
  @override
  Widget build(BuildContext context) {
    Pet pet = Pet();

    return Card(
      child: Center(
        child: Column(
          children: [
            Text("Fome: ${pet.fome}"),
            const SizedBox(height: 30),
            Text("Energia: ${pet.energia}"),
            ElevatedButton(
              onPressed: () => setState(() {
                pet.brincar();
              }),
              child: Text("Brincar"),
            ),
            ElevatedButton(
                onPressed: () => setState(() {
                      pet.alimentar();
                    }),
                child: Text("Alimentar"))
          ],
        ),
      ),
    );
  }
}
