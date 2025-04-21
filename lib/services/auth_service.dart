import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = 'http://192.168.1.197:8000/api'; // 若用模擬器記得換成你的電腦 IP
  String? _fakeToken;

  Future<bool> login(String username, String password) async {
    final res = await http.post(
      Uri.parse('$_baseUrl/login/'),
      body: {'username': username, 'password': password},
    );

    if (res.statusCode == 200) {
      final token = jsonDecode(res.body)['token'];
      _fakeToken = token;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String username, String password) async {
    final res = await http.post(
      Uri.parse('$_baseUrl/register/'),
      body: {'username': username, 'password': password},
    );

      if (res.statusCode == 200) {
    final token = jsonDecode(res.body)['token'];
    _fakeToken = token;
    return true;
  } else {
    print('❌ 註冊失敗：${res.statusCode}');
    print('❗ 錯誤訊息內容：${res.body}');
    return false;
  }
}

  Future<void> logout() async {
    final res = await http.post(
      Uri.parse('$_baseUrl/logout/'),
      headers: {'Authorization': 'Token $_fakeToken'},
    );

    _fakeToken = null;
  }

  Future<bool> isLoggedIn() async {
    return _fakeToken != null;
  }

  Future<String?> getToken() async {
    return _fakeToken;
  }
}
