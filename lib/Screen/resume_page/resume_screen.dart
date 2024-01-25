
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:resume_app/Screen/Routes/screen_routes.dart';
import 'package:resume_app/Screen/resume_page/controller/resume_controller.dart';
import 'package:resume_app/utils/box.dart';
import 'package:resume_app/utils/resume_model.dart';
import 'package:resume_app/utils/size_utils.dart';

class ResumeScreen extends GetWidget<ResumeController> {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          title: const Text("Resume"),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            Get.offAllNamed(AppRoutes.onBoardingScreen);
            return;
          },
          child: ValueListenableBuilder<Box<NoteModel>>(
            valueListenable: Boxes.getdata().listenable(),
            builder: (context, box, _) {
              var data = box.values.toList().cast<NoteModel>();
              return box.isEmpty
                  ? const Center(
                    child: Text(
                        "No Data Found",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                  )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w(context, 10), vertical: h(context, 15)),
                      child: ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            showMyDialog(context,data[index]);
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            size: 30,
                                          )),
                                      SizedBox(
                                        width: w(context, 15),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                              AppRoutes.formFillScreen,
                                              arguments: data[index],
                                            );
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            size: 30,
                                          )),
                                    ],
                                  ),
                                  Text(
                                    data[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 20),
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                  Text(data[index].jobTitle.isNotEmpty?
                                    data[index].jobTitle.toString():"No Experience",
                                    style: TextStyle(
                                        fontSize: f(context, 17),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    data[index].email.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  Text(
                                    data[index].phone.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  Text(
                                    data[index].address.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  SizedBox(
                                    height: h(context, 20),
                                  ),
                                  Text(
                                    "Skills",
                                    style: TextStyle(
                                        fontSize: f(context, 16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Divider(),
                                  Text(
                                    data[index].skill.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  SizedBox(
                                    height: h(context, 20),
                                  ),
                                  Text(
                                    "Education",
                                    style: TextStyle(
                                        fontSize: f(context, 16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[index].year.toString(),
                                        style: TextStyle(
                                            fontSize: f(context, 14),
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].course.toString(),
                                            style: TextStyle(
                                                fontSize: f(context, 14),
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                          ),
                                          Text(
                                            data[index].school.toString(),
                                            style: TextStyle(
                                                fontSize: f(context, 13),
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: h(context, 20),
                                  ),
                                  Text(
                                    "Work History",
                                    style: TextStyle(
                                        fontSize: f(context, 16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Divider(),
                                  Text(
                                    "${data[index].startDate.isNotEmpty? data[index].startDate.toString():"No Experience"}  ${data[index].startDate.toString()}",
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  Text(
                                    data[index].jobTitle.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 14),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.9)),
                                  ),
                                  Text(
                                    data[index].cmpname.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  Text(
                                    data[index].eneterDetais.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  SizedBox(
                                    height: h(context, 20),
                                  ),
                                  Text(
                                    "Project",
                                    style: TextStyle(
                                        fontSize: f(context, 16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Divider(),
                                  Text(
                                    data[index].projectTitle.toString(),
                                    style: TextStyle(
                                        fontSize: f(context, 14),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.9)),
                                  ),
                                  Text(
                                    "Project Description:- \n${data[index].description.toString()}",
                                    style: TextStyle(
                                        fontSize: f(context, 13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ));
  }
  void showMyDialog(BuildContext context,NoteModel data) {
    Get.defaultDialog(
      title: "Delete Resume",
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: CupertinoColors.white,
      content: Container(),
      actions: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: w(context, 5),vertical: h(context, 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(
                        Colors.transparent)),
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: const Text(
                 "Cancel",
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor:
                  MaterialStatePropertyAll(Colors.cyan),
                ),
                onPressed: () {
                  // Handle the entered data (e.g., save it to Firestore)
                  delete(data);
                  Get.back();
                },
                child: const Text(
                 "Confirm",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void delete(NoteModel noteModel) async {
    await noteModel.delete();
  }
}
