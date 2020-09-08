class Api {
  //users/login
  static String base_url = 'https://naya-oraan.herokuapp.com';

  static String get login {
    return base_url + '/users/login';
  }

  static String get savings {
    return base_url + "/installment/get-by-userid";
  }
}
