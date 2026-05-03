import '../../../../core/network/network_helper.dart';
import '../../../../core/constants/api_constants.dart';

class AuthRepository {
  final NetworkHelper _networkHelper;

  AuthRepository({NetworkHelper? networkHelper}) : _networkHelper = networkHelper ?? NetworkHelper();

  Future<Map<String, dynamic>?> loginWithGoogle({
    required String token,
    required String deviceId,
  }) async {
    try {
      final response = await _networkHelper.post(
        ApiConstants.googleLogin,
        data: {
          'token': token,
          'device_id': deviceId,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
