import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:resume_app/Screen/Routes/screen_routes.dart';
import 'package:resume_app/utils/box.dart';
import 'package:resume_app/utils/resume_model.dart';
import 'package:resume_app/widget/custom_snackBar.dart';

class FormFillController extends GetxController {
  RxBool hasExperience = false.obs;
  RxBool isLoading = false.obs;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addresseController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController courseDegreeController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController projectTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  RxString imagePath = ''.obs;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    courseDegreeController.dispose();
    addresseController.dispose();
    phoneController.dispose();
    emailController.dispose();
    endDateController.dispose();
    jobTitleController.dispose();
    companyNameController.dispose();
    detailsController.dispose();
    gradeController.dispose();
    projectTitleController.dispose();
    schoolController.dispose();
    skillsController.dispose();
    yearsController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
  void updateExperienceStatus(bool value) {
    hasExperience.value = value;
  }
  Future<void> selectDateTime(BuildContext context, bool isStartDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate.value: endDate.value,
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orange,
            // Head background
            splashColor: Colors.orange.withOpacity(0.4),
            // Touch ripple color
            colorScheme: const ColorScheme.light(primary: Colors.orange),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogBackgroundColor: Colors.white, // Background color
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      if (isStartDate) {
        startDate.value = picked;
        startDateController.text = DateFormat("dd-MM-yyyy").format(picked);
      } else {
        endDate.value = picked;
        endDateController.text = DateFormat("dd-MM-yyyy").format(picked);
      }
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }

  Future<void> isFill() async {
    if (nameController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Name");
    } else if (addresseController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Address");
    } else if (emailController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Email");
    } else if (phoneController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Number");
    } else if (courseDegreeController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Course/Degree");
    } else if (schoolController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter School/University");
    } else if (gradeController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Grade/Score");
    } else if (yearsController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Years");
    } else if (companyNameController.text.isEmpty&&hasExperience.isTrue) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Company Name");
    } else if (jobTitleController.text.isEmpty&&hasExperience.isTrue) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Job Title");
    } else if (startDateController.text.isEmpty&&hasExperience.isTrue) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Start Date");
    } else if (endDateController.text.isEmpty&&hasExperience.isTrue) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter End Date");
    } else if (detailsController.text.isEmpty&&hasExperience.isTrue) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Details");
    } else if (skillsController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Skills");
    } else if (projectTitleController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Project Title");
    } else if (descriptionController.text.isEmpty) {
      CustomSnackBar.showSnackBar(
          headerText: "Error", bodyText: " Please Enter Description");
    } else {
      final data = NoteModel(
          nameController.text,
          descriptionController.text,
          courseDegreeController.text,
          addresseController.text,
          phoneController.text,
          emailController.text,
          endDateController.text,
          startDateController.text,
          jobTitleController.text,
          companyNameController.text,
          detailsController.text,
          gradeController.text,
          projectTitleController.text,
          schoolController.text,
          skillsController.text,
          imagePath.value,
          yearsController.text);
      final box = Boxes.getdata();
      box.add(data);
      data.save();
      CustomSnackBar.showSnackBar(headerText: "Success",bodyText: "Add Resume Success");
      Get.offNamed(AppRoutes.onBoardingScreen);
    }
  }

  NoteModel? data;

  @override
  onInit() {
    // TODO: implement onInit
    super.onInit();
    data = Get.arguments;
    if (data != null) {
      // Bind the TextEditingController values to the NoteModel properties
      nameController.text = data!.name;
      descriptionController.text = data!.description;
      courseDegreeController.text = data!.course;
      addresseController.text = data!.address;
      phoneController.text = data!.phone;
      emailController.text = data!.email;
      endDateController.text = data!.endDate;
      startDateController.text = data!.startDate;
      jobTitleController.text = data!.jobTitle;
      companyNameController.text = data!.cmpname;
      detailsController.text = data!.eneterDetais;
      gradeController.text = data!.grade;
      projectTitleController.text = data!.projectTitle;
      schoolController.text = data!.school;
      skillsController.text = data!.skill;
      yearsController.text = data!.year;
      // Bind other properties...
    }
  }
//
void updateData() {
  if (data != null) {
    // Update the NoteModel properties with the new values from TextEditingControllers
    data!.name = nameController.text;
    data!.description = descriptionController.text;
    data!.course = courseDegreeController.text;
    data!.phone = phoneController.text;
    data!.email = emailController.text;
    data!.endDate = endDateController.text;
    data!.startDate = startDateController.text;
    data!.jobTitle = jobTitleController.text;
    data!.cmpname = companyNameController.text;
    data!.eneterDetais = detailsController.text;
    data!.grade = gradeController.text;
    data!.projectTitle = projectTitleController.text;
    data!.school = schoolController.text;
    data!.skill = skillsController.text;
    data!.year = yearsController.text;
    data!.save();
    CustomSnackBar.showSnackBar(headerText: "Success",bodyText: "UpdateData Success");
    Get.offNamed(AppRoutes.resumeScreen);
    // Update other properties...
  }
}
}
