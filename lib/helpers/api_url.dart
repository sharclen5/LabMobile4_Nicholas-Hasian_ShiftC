class ApiUrl {
  static const String baseUrl =
      'http://192.168.100.9:8080/';
  static const String login = baseUrl + '/login';
  static const String registrasi = baseUrl + '/registrasi';
  static const String listProduk = baseUrl + '/produk';
  static const String createProduk = baseUrl + '/produk';

  static String updateProduk(int id){
    return baseUrl + '/produk/' + id.toString();
  }

  static String showProduk(int id){
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProduk(int id){
    return baseUrl + '/produk/' + id.toString();
  }
}
