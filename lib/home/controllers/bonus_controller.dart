import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech_challenge/home/model/fruit_model.dart';

class BonusController extends GetxController {
  final updateText = ''.obs;
  final updateTextController = TextEditingController().obs;
  void edit({required FruitModel fruit}) {
    updateTextController.value.text = fruit.name!;
    Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 10),
      contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      title: "Fruit",
      content: Column(
        children: [
          TextFormField(
            controller: updateTextController.value,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                isDense: true,
                border: OutlineInputBorder(gapPadding: 0)),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              updateFruit(id: "${fruit.id}");
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  void updateFruit({required id}) {
    final fruit = FirebaseFirestore.instance.collection('fruit').doc(id);
    fruit.update({
      "name": updateTextController.value.text,
    });
    Get.back();
  }
}
