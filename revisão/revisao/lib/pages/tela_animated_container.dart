import 'package:flutter/material.dart';

class TelaAnimatedContainer extends StatefulWidget {
  const TelaAnimatedContainer({super.key});

  @override
  State<TelaAnimatedContainer> createState() {
    return _TelaAnimatedContainerState();
  }
}

class _TelaAnimatedContainerState extends State<TelaAnimatedContainer> {
  bool expandido = false;

  void animated() {
    setState(() {
      expandido = !expandido;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: SafeArea(
  
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  width: expandido ? 300 : 100,
                  height: expandido ? 300 : 100,
                  color: Colors.blue,
                  duration: const Duration(milliseconds: 900),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: animated,
                  child: const Text('Animar'),
                )
                
              ],
            ),
          ),
        ),
  
    );
  }
}