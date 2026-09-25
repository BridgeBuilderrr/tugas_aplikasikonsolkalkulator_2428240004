class Kalkulator {
  /// Melakukan operasi penambahan
  double tambah(double a, double b) {
    return a + b;
  }

  /// Melakukan operasi pengurangan
  double kurang(double a, double b) {
    return a - b;
  }

  /// Melakukan operasi perkalian
  double kali(double a, double b) {
    return a * b;
  }

  /// Melakukan operasi pembagian
  /// Throws exception jika pembagi adalah 0
  double bagi(double a, double b) {
    if (b == 0) {
      throw Exception('Error: Tidak dapat membagi dengan nol!');
    }
    return a / b;
  }
}
