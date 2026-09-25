import 'dart:io';
import 'package:tugas_aplikasikonsolkalkulator_2428240004/kalkulator.dart';

void main() {
  final kalkulator = Kalkulator();
  bool lanjut = true;

  print('========================================');
  print('   SELAMAT DATANG DI APLIKASI KALKULATOR'); 
  print('========================================\n');

  while (lanjut) {
    try {
      // Input bilangan pertama
      late double bilangan1;
      while (true) {
        try {
          stdout.write('Masukkan bilangan pertama: ');
          String? input1 = stdin.readLineSync();
          if (input1 == null || input1.isEmpty) {
            print('Error: Input tidak boleh kosong!');
            continue;
          }
          bilangan1 = double.parse(input1);
          break;
        } on FormatException {
          print('Error: Masukkan bilangan yang valid!');
        }
      }

      // Input bilangan kedua
      late double bilangan2;
      while (true) {
        try {
          stdout.write('Masukkan bilangan kedua: ');
          String? input2 = stdin.readLineSync();
          if (input2 == null || input2.isEmpty) {
            print('Error: Input tidak boleh kosong!');
            continue;
          }
          bilangan2 = double.parse(input2);
          break;
        } on FormatException {
          print('Error: Masukkan bilangan yang valid!');
        }
      }

      // Tampilkan menu operasi
      print('\n--- Menu Operasi ---');
      print('[1] Tambah');
      print('[2] Kurang');
      print('[3] Kali');
      print('[4] Bagi');

      // Input pilihan operasi
      late int pilihan;
      while (true) {
        try {
          stdout.write('Pilih operasi (1-4): ');
          String? inputPilihan = stdin.readLineSync();
          if (inputPilihan == null || inputPilihan.isEmpty) {
            print('Error: Input tidak boleh kosong!');
            continue;
          }
          pilihan = int.parse(inputPilihan);
          if (pilihan < 1 || pilihan > 4) {
            print('Error: Pilhan harus antara 1-4!');
            continue;
          }
          break;
        } on FormatException {
          print('Error: Masukkan angka 1-4!');
        }
      }

      // Lakukan perhitungan
      late double hasil;
      late String operasi;

      try {
        switch (pilihan) {
          case 1:
            hasil = kalkulator.tambah(bilangan1, bilangan2);
            operasi = 'Tambah';
          case 2:
            hasil = kalkulator.kurang(bilangan1, bilangan2);
            operasi = 'Kurang';
          case 3:
            hasil = kalkulator.kali(bilangan1, bilangan2);
            operasi = 'Kali';
          case 4:
            hasil = kalkulator.bagi(bilangan1, bilangan2);
            operasi = 'Bagi';
          default:
            operasi = 'Tidak diketahui';
        }

        // Tampilkan hasil
        print('\n--- Hasil Perhitungan ---');
        print('$bilangan1 $operasi $bilangan2 = $hasil\n');
      } on Exception catch (e) {
        print('Error: $e\n');
        continue;
      }

      // Tanya apakah ingin mengulang
      late bool inputValid = false;
      while (!inputValid) {
        stdout.write('Apakah Anda ingin melakukan perhitungan lagi? (Y/T): ');
        String? inputLanjut = stdin.readLineSync()?.toUpperCase();

        if (inputLanjut == 'Y') {
          lanjut = true;
          inputValid = true;
          print('');
        } else if (inputLanjut == 'T') {
          lanjut = false;
          inputValid = true;
        } else {
          print('Error: Masukkan Y atau T!');
        }
      }
    } catch (e) {
      print('Error yang tidak terduga: $e');
      print('Program akan dihentikan.');
      break;
    }
  }

  print('\n========================================');
  print('      TERIMA KASIH TELAH MENGGUNAKAN');
  print('        APLIKASI KALKULATOR KAMI');
  print('========================================');
}
