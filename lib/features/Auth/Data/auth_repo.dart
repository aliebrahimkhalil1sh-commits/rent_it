import 'package:rent_it/core/Networks/api_error.dart';
import 'package:rent_it/core/Networks/api_services.dart';
import 'package:rent_it/core/utils/pref_Helpers.dart';
import 'package:rent_it/features/Auth/Data/User_Model.dart';
import 'package:rent_it/features/Auth/Data/registerresult.dart';

class AuthRepo {
  final ApiService apiService = ApiService();
  bool isGuest = false;
  // ignore: unused_field
  UserModel? _currentUser;

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post('/auth/login', {
        'email': email,
        'password': password,
      });

      if (response is! Map<String, dynamic>) {
        throw ApiError(message: 'Unexpected response from server');
      }

      final success = response['success'] == true;
      final message = response['message']?.toString() ?? 'Login failed';
      final accessToken = response['accessToken']?.toString();
      if (!success) {
        throw ApiError(message: message);
      }

      if (accessToken == null || accessToken.isEmpty) {
        throw ApiError(message: message);
      }

      await PrefHelper.saveToken(accessToken);

      final user = UserModel(
        name: '',
        email: email,
        token: accessToken,
        image: null,
        address: null,
        visa: null,
      );

      isGuest = false;
      _currentUser = user;

      return user;
    } on ApiError {
      rethrow;
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<RegisterResult> register(
    String name,
    String email,
    String password,
    String confirmpassword,
  ) async {
    try {
      final response = await apiService.post('/auth/register', {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmpassword,
      });

      if (response is! Map<String, dynamic>) {
        throw ApiError(message: "Unexpected response format from server");
      }

      final success = response["success"] == true;
      final message = response["message"]?.toString() ?? "Signup failed";



      if (!success) {
        throw ApiError(message: message);

      }


      return RegisterResult(email: email ,password: password);
    } on ApiError {
      rethrow;
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
