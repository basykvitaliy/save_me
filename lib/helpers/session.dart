
class Session {
  static Session _instance = Session._internal();
  static String? authToken;
  static String? uId;
  static String? imageUrl;
  
  
  factory Session() => _instance;

  Session._internal() {
    _instance = this;
  }

  factory Session.create(String token,  String uId, String shopId) {
    authToken = token;
    uId = uId;
    shopId = shopId;
    return _instance;
  }

  factory Session.fromMap(Map<String, dynamic> m) {
    authToken = m['authToken'] as String;
    uId = m['uId'] as String;
    imageUrl = m['imageUrl'] as String;
    return _instance;
  }

  static bool get hasAuthToken => authToken != null;
  static bool get hasUId => uId != null;
  static bool get hasImageUrl => imageUrl != null;

  static Map<String, Object> toMap() {
    return {
      'authToken': authToken as String,
      'uId': uId as String,
      'imageUrl': imageUrl as String,
    };
  }
}
