import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech_challenge/home/screens/basic_functionalities.dart';
import 'package:vtech_challenge/home/screens/bonus_challenges%20.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VTech - Coding Challenge"),
        centerTitle: true,
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      minimumSize: const Size(200, 40)),
                  onPressed: () {
                    Get.to(() => const BasicAndFucntionalitiesScreen());
                  },
                  child: const Text("Basic Fucntionalities")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 208, 167, 44),
                      padding: const EdgeInsets.all(0),
                      minimumSize: const Size(200, 40)),
                  onPressed: () {
                    Get.to(() => const BonusScreen());
                  },
                  child: const Text("Bonus")),
            ],
          )),
    );
  }
}
