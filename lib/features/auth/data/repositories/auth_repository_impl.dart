import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  Future<Map<String, dynamic>?> sendRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final uri = Uri.parse(url);
    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      log("Token: ${getIt<CacheHelper>().getToken().toString()}");

      if (response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        await getIt<CacheHelper>()
            .setToken(token: responseBody['data']['access_token']);
        log(responseBody.toString());
        return responseBody;
      } else if (response.statusCode == 400) {
        getIt<CacheHelper>().resetToken();
        throw Exception('Invalid request. Please check your input.');
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized. Please check your credentials.');
      } else {
        throw Exception('Unexpected error occurred. Please try again later.');
      }
    } catch (e) {
      log('Error occurred during request: $e');
      throw Exception('Failed to complete request. Please try again later.');
    }
  }

  @override
  Future<Map<String, dynamic>?> signIn({
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    return sendRequest(
      url: ApiConstants.SIGN_IN_URL,
      body: {
        'phone_number': phoneNumber,
        'email': email,
        'auth_method': 'phone',
        'password': password,
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> signUp({
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    return sendRequest(
      url: ApiConstants.SIGN_UP_URL,
      body: {
        'phone_number': phoneNumber,
        'email': email,
        'auth_method': 'phone',
        'password': password,
      },
    );
  }
}
