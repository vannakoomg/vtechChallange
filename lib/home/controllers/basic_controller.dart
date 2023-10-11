// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech_challenge/home/model/basic_model.dart';

class BasicFunctionalController extends GetxController {
  final listOfFruit = <BasicModel>[
    BasicModel(
      name: "Apple",
      completed: false,
    ),
    BasicModel(name: "Banana", completed: false),
  ].obs;
  final furitText = ''.obs;
  final isCompleted = false.obs;
  final isDuplicationList = false.obs;
  final furitTextController = TextEditingController().obs;
  final textUpdate = TextEditingController().obs;
  final searchText = ''.obs;
  final searchController = TextEditingController().obs;
  void add() {
    isDuplicationList.value = false;
    Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 10),
        contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        title: "Fruit",
        content: Obx(
          () => Column(
            children: [
              TextFormField(
                autofocus: true,
                onEditingComplete: () {
                  if (furitText.value != '') {
                    for (int i = 0; i < listOfFruit.length; ++i) {
                      if (listOfFruit[i].name == furitText.value) {
                        isDuplicationList.value = true;
                        debugPrint("Duplicaiton");
                      }
                    }
                    if (isDuplicationList.value == false) {
                      listOfFruit.add(
                        BasicModel(name: furitText.value, completed: false),
                      );
                      furitText.value = '';
                      furitTextController.value = TextEditingController();
                      Get.back();
                    }
                  }
                },
                onChanged: (value) {
                  furitText.value = value;
                },
                controller: furitTextController.value,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              isDuplicationList.value
                  ? const Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "This fruit is have already",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ));
  }

  void delete({required index}) {
    listOfFruit.removeAt(index);
  }

  void edit({required index}) {
    textUpdate.value.text = listOfFruit[index].name!;
    Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 10),
      contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      title: "Fruit",
      content: Column(
        children: [
          TextFormField(
            controller: textUpdate.value,
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
              listOfFruit[index] = BasicModel(
                name: textUpdate.value.text,
                completed: listOfFruit[index].completed!,
              );
              Get.back();
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  void completed({required index}) {
    debugPrint("index = $index");
    listOfFruit[index] = BasicModel(
      name: listOfFruit[index].name,
      completed: listOfFruit[index].completed! ? false : true,
    );
  }
}
