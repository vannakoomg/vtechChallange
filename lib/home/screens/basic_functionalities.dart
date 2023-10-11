import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech_challenge/home/controllers/basic_controller.dart';

class BasicAndFucntionalitiesScreen extends StatefulWidget {
  const BasicAndFucntionalitiesScreen({super.key});

  @override
  State<BasicAndFucntionalitiesScreen> createState() =>
      _BasicAndFucntionalitiesScreenState();
}

class _BasicAndFucntionalitiesScreenState
    extends State<BasicAndFucntionalitiesScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BasicFunctionalController());
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Basic - Fucntionalities"),
          ),
          body: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.searchController.value,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      isDense: true,
                      border: OutlineInputBorder(),
                      hintText: "search",
                    ),
                    onChanged: (value) {
                      controller.searchText.value = value;
                    },
                  ),
                  Text(
                    controller.searchText.value,
                    style: const TextStyle(color: Colors.transparent),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.listOfFruit.length,
                      itemBuilder: (context, index) {
                        return controller.listOfFruit[index].name!
                                .toLowerCase()
                                .contains(
                                    controller.searchText.value.toLowerCase())
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding:
                                    const EdgeInsets.only(left: 0, right: 10),
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
                                  Checkbox(
                                    value: controller
                                        .listOfFruit[index].completed!,
                                    onChanged: (va) {
                                      controller.completed(index: index);
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.listOfFruit[index].name!,
                                      style: TextStyle(
                                          decoration: controller
                                                  .listOfFruit[index].completed!
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.edit(index: index);
                                      },
                                      icon: const Icon(Icons.edit)),
                                  Container(
                                    height: 30,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.delete(index: index);
                                      },
                                      icon: const Icon(Icons.delete))
                                ]),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.add();
                      },
                      child: const Text("Add"))
                ],
              ))),
    );
  }
}
