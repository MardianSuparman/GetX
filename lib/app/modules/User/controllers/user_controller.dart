import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/app/data/user_model.dart';
import 'package:myapp/app/utils/api.dart';

class UserController extends GetxController {
  var UserList = <DataUser>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/user';

  @override
  void onInit() {
    fetchUseres();
    super.onInit();
  }

  // Fetch User
  void fetchUseres() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var user = User.fromJson(jsonResponse);
        UserList.value = user.data!;
      } else {
        Get.snackbar('Error', 'Failed to load User');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load User: $e');
    } finally {
      isLoading(false);
    }
  }

  // Add User
  Future<void> addUser(DataUser newUser) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newUser.toJson()),
      );
      if (response.statusCode == 201) {
        fetchUseres();
        Get.back();
        Get.snackbar('Success', 'User added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add User');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add User: $e');
    } finally {
      isLoading(false);
    }
  }

  // Update User
  Future<void> updateUser(int id, DataUser updatedUser) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedUser.toJson()),
      );
      if (response.statusCode == 200) {
        fetchUseres();
        Get.back();
        Get.snackbar('Success', 'User updated successfully');
      } else {
        Get.snackbar('Error', 'Failed to update User');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update User: $e');
    } finally {
      isLoading(false);
    }
  }

  // Delete User
  Future<void> deleteUser(int id) async {
    try {
    isLoading(true);
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      fetchUseres();
      Get.snackbar('Success', 'User deleted successfully');
    } else {
      Get.snackbar('Error', 'Failed to delete User');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to delete User: $e');
  } finally {
    isLoading(false);
    }
  }
}
