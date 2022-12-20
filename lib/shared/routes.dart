class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyCPK7Uh9S-_4IXwuFhin78R8m4k4_PPGxA";

  String signIn() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }

  String signUp() {
    return authService + "accounts:signUp?key=" + apiKey;
  }
}