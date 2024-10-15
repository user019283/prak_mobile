import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../data/models/articles.dart';

class HomeController extends GetxController {
  var isPasswordHidden = true.obs;
  final count = 0.obs;
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'aaa803a13aec4f1b9cf73e5ffa1c1279';
  static const String _category = 'business';
  static const String _country = 'us';
  RxList<ArticleElement> articles = RxList<ArticleElement>([]);
  // RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  // Data for the overview
  var totalExpense = 298.16.obs;
  var monthlyBalance = 3389.22.obs;

  // Image picker controller
  var selectedImagePath = ''.obs; // Observable for the selected image path

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path; // Update with the selected image path
    } else {
      Get.snackbar("Error", "No image selected");
    }
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Simple login method
  void login(String username, String password) {
    if (username == "admin" && password == "admin") {
      Get.snackbar("Login Success", "Welcome back!");
    } else {
      Get.snackbar("Login Failed", "Invalid credentials");
    }
  }

  Future<void> fetchArticles() async {
    try {
      isLoading(true); // Set loading to true
      print('Fetching articles...'); // Debug print to track the fetch operation
      final response = await http.get(Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));

      // Print the status code of the response for debugging
      print('Response Status Code: ${response.statusCode}');

      // Print the response body for debugging
      print('Response Body: ${response.body}');

      // Check if the response is valid JSON
      if (response.statusCode == 200) {
        try {
          var data = jsonDecode(response.body); // Decode the JSON response
          if (data is Map<String, dynamic>) {
            print('Parsed JSON Data: $data'); // Log parsed data

            var articlesResult = Article.fromJson(data);
            articles.value = articlesResult.articles;

            // Print the articles list after parsing
            print('Articles: ${articlesResult.articles}');
          } else {
            print('Unexpected data format: Expected Map<String, dynamic>');
          }
        } catch (e) {
          print('Error decoding JSON: $e');
        }
      } else {
        print('Failed to load articles. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e'); // Catch and print any error that occurs
    } finally {
      isLoading(false); // Set loading to false
    }
  }

}
