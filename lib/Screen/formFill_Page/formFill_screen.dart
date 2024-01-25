import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_app/Screen/formFill_Page/controller/formFill_controller.dart';
import 'package:resume_app/utils/size_utils.dart';

class FormFillScreen extends GetWidget<FormFillController> {
  const FormFillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.cyan,
        title: const Text("Fill The Form"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: w(context, 15), vertical: h(context, 8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Details",
                  style: TextStyle(
                      fontSize: f(context, 20), fontWeight: FontWeight.w600),
                ),
                const Divider(),
                _customTextFormField(
                    controller: controller.nameController,
                    context: context,
                    textInputType:  TextInputType.name,
                    textInputAction: TextInputAction.next,
                    titleText: "Enter Name",
                    hintText: "Enter Name"),
                _customTextFormField(
                    controller: controller.addresseController,
                    context: context,
                    textInputType:  TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                    titleText: "Enter Address",
                    hintText: "Enter Address"),
                _customTextFormField(
                    controller: controller.emailController,
                    context: context,
                    textInputType:  TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    titleText: "Enter Email",
                    hintText: "Enter Email"),
                _customTextFormField(
                    controller: controller.phoneController,
                    context: context,
                    textInputType:  TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    titleText: "Enter Phone",
                    hintText: "Enter Phone"),
                SizedBox(
                  height: h(context, 50),
                ),
                Text(
                  "Education Details",
                  style: TextStyle(
                      fontSize: f(context, 20), fontWeight: FontWeight.w600),
                ),
                const Divider(),
                _customTextFormField(
                    textInputType:  TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: controller.courseDegreeController,
                    context: context,
                    titleText: "Enter Course/Degree",
                    hintText: "Enter Course/Degree"),
                _customTextFormField(
                    textInputType:  TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: controller.schoolController,
                    context: context,
                    titleText: "Enter School / University",
                    hintText: "Enter School / University"),
                _customTextFormField(
                    controller: controller.gradeController,
                    context: context,
                    textInputType:  TextInputType.text,
                    textInputAction: TextInputAction.next,
                    titleText: "Enter Grade /Score",
                    hintText: "Enter Grade /Score"),
                _customTextFormField(
                    textInputType:  TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: controller.yearsController,
                    context: context,
                    titleText: "Enter Years",
                    hintText: "Enter Years"),
                SizedBox(
                  height: h(context, 50),
                ),
                Obx(
                  () => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "are you Experience",
                            style: TextStyle(
                                fontSize: f(context, 18),
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all()),
                            child: TextButton(
                                onPressed: () {
                                  controller.updateExperienceStatus(true);
                                },
                                child: const Text("Yes")),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all()),
                            child: TextButton(
                                onPressed: () {
                                  controller.updateExperienceStatus(false);
                                },
                                child: const Text("No")),
                          ),
                        ],
                      ),
                      if (controller.hasExperience.isTrue)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Experience",
                              style: TextStyle(
                                  fontSize: f(context, 20),
                                  fontWeight: FontWeight.w600),
                            ),
                            const Divider(),
                            _customTextFormField(
                                controller: controller.companyNameController,
                                textInputType:  TextInputType.text,
                                textInputAction: TextInputAction.next,
                                context: context,
                                titleText: "Enter Company Name",
                                hintText: "Enter Company Name"),
                            _customTextFormField(
                                textInputType:  TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: controller.jobTitleController,
                                context: context,
                                titleText: "Enter Job Title",
                                hintText: "Enter Job Title"),
                            SizedBox(
                              height: h(context, 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Start Date",
                                        style: TextStyle(
                                            fontSize: f(context, 16),
                                            fontWeight: FontWeight.w600)),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.selectDateTime(
                                            context, true);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: TextFormField(
                                          controller:
                                              controller.startDateController,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: w(context, 10)),
                                              enabled: false,
                                              hintText: "start date",
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("End Date",
                                        style: TextStyle(
                                            fontSize: f(context, 16),
                                            fontWeight: FontWeight.w600)),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.selectDateTime(
                                            context, false);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: TextFormField(
                                          controller:
                                              controller.endDateController,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: w(context, 10)),
                                              enabled: false,
                                              hintText: "End date",
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            _customTextFormField(
                                controller: controller.detailsController,
                                context: context,
                                isMaxLine: 4,
                                height: h(context, 95),
                                titleText: "Enter Details",
                                hintText: "Enter Details"),
                            SizedBox(
                              height: h(context, 50),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Text(
                  "Skills",
                  style: TextStyle(
                      fontSize: f(context, 20), fontWeight: FontWeight.w600),
                ),
                const Divider(),
                _customTextFormField(
                    controller: controller.skillsController,
                    textInputType:  TextInputType.text,
                    textInputAction: TextInputAction.next,
                    context: context,
                    titleText: "Enter Skills",
                    hintText: "Enter Skills"),
                SizedBox(
                  height: h(context, 50),
                ),
                Text(
                  "Projects",
                  style: TextStyle(
                      fontSize: f(context, 20), fontWeight: FontWeight.w600),
                ),
                const Divider(),
                _customTextFormField(
                    controller: controller.projectTitleController,
                    textInputType:  TextInputType.text,
                    textInputAction: TextInputAction.next,
                    context: context,
                    titleText: "Enter Project Title",
                    hintText: "Enter Project Title"),
                _customTextFormField(
                    controller: controller.descriptionController,
                    context: context,
                    isMaxLine: 5,
                    height: h(context, 120),
                    titleText: "Project Description",
                    hintText: "Project Description"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h(context, 15)),
                  child: GestureDetector(
                    onTap: () {
                      controller.data == null
                          ? controller.isFill()
                          : controller.updateData();
                    },
                    child: Container(
                   padding: EdgeInsets.symmetric(vertical: h(context, 12)),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        controller.data == null ? "Submit" : "Update",
                        style: TextStyle(
                            fontSize: f(context, 16),
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTextFormField({
    int? isMaxLine,
    required BuildContext context,
    required String titleText,
    required String hintText,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
    double? height,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h(context, 10),
        ),
        Text(
          titleText,
          style:
              TextStyle(fontSize: f(context, 16), fontWeight: FontWeight.w600),
        ),
        Container(
          width: double.infinity,
         // height: height ?? h(context, 45),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: TextFormField(
              textInputAction: textInputAction?? TextInputAction.none,
              keyboardType: textInputType?? TextInputType.text,
              maxLines: isMaxLine ?? 1,
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: w(context, 10)),
                  hintStyle: TextStyle(
                      fontSize: f(context, 12),
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                  hintText: hintText),
            ),
          ),
        ),
      ],
    );
  }
}
