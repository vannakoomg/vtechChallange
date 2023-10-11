// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech_challenge/home/controllers/bonus_controller.dart';
import 'package:vtech_challenge/home/model/fruit_model.dart';

class BonusScreen extends StatelessWidget {
  const BonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BonusController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bonus with Firebase"),
        centerTitle: true,
      ),
      body: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Column(
            children: [
              StreamBuilder<List<FruitModel>>(
                  stream: FirebaseFirestore.instance
                      .collection('fruit')
                      .snapshots()
                      .map(
                        (snapshots) => snapshots.docs
                            .map((doc) => FruitModel.fromJson(doc.data()))
                            .toList(),
                      ),
                  builder: (context, snapshots) {
                    if (snapshots.hasData) {
                      return Expanded(
                          child: ListView.builder(
                        itemCount: snapshots.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        spreadRadius: 0.2)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: double.infinity,
                              child: Row(children: [
                                Expanded(
                                  child: Text("${snapshots.data![index].name}"),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        minimumSize: const Size(50, 25)),
                                    onPressed: () {
                                      controller.edit(
                                          fruit: snapshots.data![index]);
                                    },
                                    child: const Text("Edit"))
                              ]));
                        },
                      ));
                    } else {
                      return const Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.blue,
                        )),
                      );
                    }
                  }),
            ],
          )),
    );
  }
}
