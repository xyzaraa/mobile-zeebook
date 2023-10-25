import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_process/app/modules/home/models/profile_models.dart'; // Import the UserProfile model

class HomeController extends GetxController {
  var selectedIndex = 0.obs; // for navbar
  final _image = Rx<XFile?>(null); // file image picker
  RxString imagePath = "".obs;

  // Add a variable to store the user's profile
  var userProfile = UserProfile(
    username: "User", // Initial username
    profilePicture: "assets/profile.jpg", // Initial profile picture
  ).obs;

  // Navbar logic
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
