import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ResumeController extends GetxController{
  RxString imagePath = ''.obs;
  RxString name="".obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    } else {
      print('No image selected.');
    }
  }
}