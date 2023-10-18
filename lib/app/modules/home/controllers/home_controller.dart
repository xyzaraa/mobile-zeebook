import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs; //for navbar
  final _image = Rx<XFile?>(null); //file image picker
  RxString imagePath = "".obs;

  //navbar logic
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  XFile? get image => _image.value;
  
  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image.value = XFile(image.path);
    }
  }

  Future<void> captureImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      _image.value = XFile(image.path);
    }
  }

}
 