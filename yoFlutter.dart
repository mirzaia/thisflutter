// START
import 'dart:ffi';
// import 'dart:html';
import 'dart:io';
import 'dart:math';
// import 'animal.dart';
import 'dart:mirrors';

// START LEARNING DART //

// OOP
// Encapsulation = class tidak dapat diakses objek lain, tidak dapat dirubah propertinya secara langsung, kecuali dengan menambahkan method
// Abstraksi = hanya menampilkan properties sebuah class secara high level, tidak detail
// Inheritance = objek yang berbeda tetapi memiliki karakteristik yang sama / sifat turunan
// Polymorphism = implementasi / aplikasi yang berbeda dari suatu objek, contoh = objek hewan bernafas, tetapi bernafasnya ikan dan kucing tidak sama

// Attribute suatu objek = variabel
// Behaviour suatu objek = method/function

// ABSTRACT CLASS
abstract class bendaHidup {
  String punyaNama = '';
  bool hidupKah = true;
  void sifatHidup() {
    print('ini adalah makhluk hidup');
  }

  bendaHidup();
}

// CLASS
class arachniDae {
  String namaBinatang = '';
  int jumlahKaki = 0;
  arachniDae(String namaBinatang, int jumlahKaki) {
    this.namaBinatang = namaBinatang;
    this.jumlahKaki = jumlahKaki;
  }
}

class mammal {
  // properties harus diinisiasi
  String namaMammal = 'hewan';
  int umurMammal = 0;
  double beratMammal = 0;
  int kakiMammal = 0;
  String warnaKulit = '';
  String habitat = '';
  bool status = true;
  bool bergerak = false;

  // setiap class harus ada method
  void makan() {
    this.namaMammal = namaMammal;
    print('$namaMammal + sedang makan');
// beratMammal = beratMammal + 1;
  }

  void minum() {
    this.namaMammal = namaMammal;
    print('$namaMammal sedang minum');
// beratMammal = beratMammal + 1;
  }

  void poop() {
    print('$namaMammal sedang poop');
// beratMammal = beratMammal - 2;
  }

  void jalan() {
    bergerak = true;
    print(
        "$namaMammal sedang bergerak di $habitat dengan menggerakan $kakiMammal kakinya");
  }

  void berhenti() {
    bergerak = false;
    print('berhenti');
  }

  void tidur() {
    status = false;
    print('$namaMammal sedang tidur');
  }

  void bangunTidur() {
    status = true;
    print('$namaMammal sudah bangun');
  }

  mammal();
}
// PERHATIAN ! SETIAP CLASS HARUS DIINISASI DEFAULT CONSTRUCTOR
// var anjingA = mammal('Anjing', 5, 11, 4, 'coklat', 'darat',true, false) // INI ADALAH CONTOH CONSTRUCTOR
// or ..namaMammal = 'dog'; this is cascade notation example
// mammal.berhenti(); // or ..berhenti(); this is cascade notation example
// Instantiation = proses menyimpan objek kepada suatu variabel
// Dart tidak memiliki visibility modifier - protected, private, dll
// Caranya adalah menggunakan class sebagai library, lalu import

// INHERITANCE / CHILD CLASS
class seaMammal extends mammal {
  String skin = '';
  seaMammal() : super();
  void berenang() {
    print('kuliat basah');
  }
}

// IMPLICIT INTERFACE
// Buat class yang akan dijadian obje implemets
class diveDive {
  void goDive() {}
}

// Buat class yang akan diimplementasikan diveDive, dan jangan lupa lengkapi method implementasinya [method goDive diatas blm lengkap]
class reptilia extends mammal implements diveDive {
  String skinf = '';
  @override // melengkapi / mengganti method go dive diatas
  void goDive() {}
}

// ENUMERATED TYPES OR ENUMS
// Semaca kelas untuk menyimpan konstanta2
enum enviRonment { rock, leaf, wind, fire, water, air }
enum campaignStatus { completed, in_progress, forbidden }

// MIXIN
// Salah satu jenis class
// Merupakan jenis yang hanya ada di Dart, karena dart tidak dapat multiple inheritance
// Bisa dipanggil di class dengan menambahkan 'with'
mixin sick {
  void iamSick() {
    print('saya sedang sakit');
  }
}
mixin perawatan {
  void inBed() {
    print('saya masih dirawat');
  }
}

class injMammal extends mammal with perawatan {}

class healthMammal extends mammal {}

class isOkMammal extends mammal {}

// Konsep mixin ini dibuat untuk mengatasi masalah multiple inheritance pada bahasa OOP lain
// Konsep mixin dalam aplikasinya akan menerapkan stack, yaitu urutan dari yang paling umum [paling atas] hingga
// paling spesifik [paling bawah], sehingga method yang digunakan adalah yang milik yang paling spesifik

// EXTENSION
// Fungsi extension adalah untuk memodifikasi library yang kita buat ataupun yang sudah ada di Dart, yang tidak mendukung
// kebutuhan kita

// MAIN BODY
void main() {
  var firstnumber = 1;
  var secondnumber = 2.1;
  print(firstnumber + secondnumber);
  // ENUMS application
  print(enviRonment.values);
  print(enviRonment.wind.index);

  var taskStatus = campaignStatus.in_progress;
  switch (taskStatus) {
    case campaignStatus.completed:
      print('Task is still already completed');
      break;
    case campaignStatus.in_progress:
      print('Task is in progress');
      break;
    case campaignStatus.forbidden:
      print('Finish your previous mission first');
      break;
  }

  // APLIKASI CLASS
  // Perbedaan constructor dengan function / method biasa
  // Constructor otomatis dipanggil ketika sebuah objek dibuat
  // Default constructor akan otomatis dibuat apabila kita tidak membuat constructor
  // Tidak memiliki nilai kembalian - return
  // INI ADALAH CONTOH CONSTRUCTOR
  var anjingB = mammal();
  anjingB.warnaKulit = 'hitam';
  anjingB.umurMammal = 6;
  anjingB.namaMammal = 'Anjing';
  anjingB.status = true;
  anjingB.bergerak = false;
  anjingB.habitat = 'darat';
  anjingB.beratMammal = 25;
  anjingB.kakiMammal = 4;
  anjingB.makan();

  mammal anjingC = new mammal();

  arachniDae labaLaba = new arachniDae('Laba - laba', 8);

// APLIKASI CHILD CLASS
  var lumbaLumba = seaMammal();
  lumbaLumba.namaMammal = 'Lumba';
  lumbaLumba.berenang();
  lumbaLumba.poop();

  // IMPLICIT INTERFACE
  // Instruksi yang bisa diaplikasikan kepada object
  // Implicit interface adalah istilah khusus di Dart, karena disini tidak memiliki syntax untuk
  // deklarasi interface seperti OOP lain
  // CONTOHNYA SEPERTI TOMBOL DI REMOTE

  // MULAI DART
  print("[FIRST EXAMPLE]");
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
  print(" ");

// COMMENT
// single line comment
/*
multi
line
comment
 */

// DOCUMENTATION COMMENT
/* import 'package:Belajar_Dart/Belajar_Dart.dart' as Belajar_Dart;

/// Fungsi [main] akan menampilkan 2 output
/// Output pertama menampilkan teks dan output kedua menampilkan hasil perkalian pada library [Belajar_Dart]
void main(List<String> arguments) {
  // Mencetak Hello Dart! Dart is great. pada konsol
  print('Hello Dart! Dart is great.');
  // Testing documentation comment with [].
  print('6 * 7 = ${Belajar_Dart.calculate()}');
}
*/

/*
  output:
    Hello Dart! Dart is great.
    6 * 7 = 42
 */

// VARIABLES
  // Type Inference
  print("[VARIABLES]");
  var variabelpertama = 'hellodart';
  print('halo $variabelpertama!');
  print(variabelpertama);
  var variabelkedua = 2200000;
  print(variabelkedua);
  var myAge;
  print(myAge);
  String gender = 'male';
  print(gender);
  double angka = 234.546;
  print(angka);
  bool benar = true;
  bool salah = false;
  print(benar);
  print(salah);
  print(" ");

// DYNAMIC VARIABLE
  print("[DYNAMIC VARIABLES]");
  var contohDynamic;
  contohDynamic = 7680;
  print(contohDynamic);
  contohDynamic = true;
  print(contohDynamic);
  print(" ");

// MENERIMA INPUT
/* var namasaya = 'mirza';
print(namasaya);
/// [stdout.write] tidak melanjutkan ke baris baru, sementara [print] menampilkan baris baru
stdout.write('Nama saya adalah');
String namanya = stdin.readLineSync()!; // ! berfungsi untuk mencegah agar tidak mengembalikan nilai null
stdout.write('Usia saya adalah');
int usia = int.parse(stdin.readLineSync()!); // int parse berfungsi untuk mengubah string menjadi int
*/

// NUMBERS
  print("[OBJECT]");
  int angka1 = 6;
  int angka2 = 3;
  int angka3 = 2;
  double angka4 = 7.5;
  double angka5 = 2.5;
  double angka6 = 15;
  double angka7 = -8.7;
  print(" ");

// MATH OPERATION
  print("[MATH OPERATION]");
  var ceilingg = angka5.ceil();
  print(ceilingg); // dibulatkan keatas
  var absolut = angka7.abs();
  print(absolut); // minus menjadi plus
  print(" ");

// CONVERSION
  print("[CONVERSION]");
// String -> int
  var eleven = int.parse('11');
// String -> double
  var elevenPointTwo = double.parse('11.2');
// int -> String
  var elevenAsString = 11.toString();
// double -> String
  var piAsString = 3.14159.toStringAsFixed(2); // String piAsString = '3.14'
  print(" ");

  // STRING
  print("[STRING]");
  // Escape String
  String escapeString = 'Ladies and gentlemen it\'s the woman';
  /* \ adalah escape string */

// String Interpolation
  var stringInterpolation = 'Phil Foden';
  print(
      'A goal from $stringInterpolation'); // menambahkan variabel tanpa '+' hanya butuh '$'

// Mengabaikan interpolation
  print(
      r'The price reach as high as $1111'); // r untuk mengabaikan interpolation
  print(" ");

  // EXCEPTION
  print("[EXCEPTION]");
  /*try {
  var z = 7;
  var x = 0;
  print(z ~/ x);
} on IntegerDivisionByZeroException {
  print("[EXCEPTION]error bre");
  }
  */
  try {
    var z = 7;
    var x = 0;
    print(z ~/ x);
  } catch (e, s) {
    print("EXCEPTION HAPPENED: $e");
    print("LOCATION: $s");
  }
  print(" ");

// OPERATORS
  print("[OPERATORS]");
// Operator di Dart berfungsi untuk memerintah komputer melakukan suatu operasi
  var g = 1;
  var h = 71;
  g++;
  h--;
  print(g);
  print(h);
  var k = 89;
  var l = 97;
  k += 5;
  l += 3;
  print(k);
  print(l);
  var oj = 767;
  var jo = 999;
  oj -= 5;
  jo *= 8;
  print(oj);
  print(jo);

  print(angka6 ~/ angka5); // mengembalikan angka int nya (menjadi tidak koma

  if (1 < 2 && 2 > 1) {
    print('BENAR');
  } else {
    print('SALAH');
  }
  print(" ");

  // TEMP CONVERSION
  /*
  print("TEMP CONVERSION");
   stdout.write("Masukan nilai farenheit");
  var farenheit = num.parse(stdin.readLineSync()!);
var celsius = (farenheit - 32) * 5 / 9;
double discc = double.parse((celsius).toStringAsFixed(2));
var kelvin = ((farenheit - 32) * 5 / 9) + 273.15;
  double disck = double.parse((kelvin).toStringAsFixed(2));
var reamur = ((farenheit - 32) * 4 / 9);
  double discr = double.parse((reamur).toStringAsFixed(2));
print("$farenheit \u00B0F = $discc \u00B0C");
  print("$farenheit \u00B0F = $disck K");
  print("$farenheit \u00B0F = $discr \u00B0R"); */
  print(" ");

// FUNCTION
/* print("[FUNCTION]");
void fungsiBaru(zx, xc){};

void pengalamanKerja(String perusahaan, num tahunKerja){
  print("Perusahaan: $perusahaan dengan lama kerja $tahunKerja tahun");
}
pengalamanKerja('Pertamina', 2);

try {
  double pengalaman(int prs1, int prs2) {
    var prs1;
    var prs2;
    return (prs1 + prs2);
  }

  var perusahaan1 = 7;
  var perusahaan2 = 8;

  print("Total lama bekerja adalah ${pengalaman(perusahaan1, perusahaan2)}");
} on NoSuchMethodError {
  print("EXCEPTION: $NoSuchMethodError");
  }

// Named optional parameter tambahkan {}
/*  try{
void greetNewUser({String userName, int userAge, bool isVerified}){
/*  if (isVerified == true){
    print('aktif');
  }
  else { print('belum aktivasi');} */
  print("Akun atas nama $userName dengan umur $userAge memiliki status akun $isVerified");
};
  greetNewUser(userName: 'Jane',userAge: 26, isVerified: true);
  } catch (e,s){
  print('EXCEPTIONS: $e');
  print('LOCATION: $s');
  }
*/

// Optional parameter, tambahkan []
  try{
void greetNewOfficer([String offname, int offage, bool isoffVerified]){
};
  greetNewOfficer('Ulrich', 47, false);
  } catch (e,s){
    print('EXCEPTION: $e');
    print('LOKASI: $s');
  }
*/

// CONSTANTS
  const num pi = 3.14;
  final num heatConstant = 678.76;

// NULLABLE SAFETY
// add ?

// CONTROL FLOW
// IF
/*  stdout.write('Nilai Matematika anda adalah = ');
var isiData = stdin.readLineSync();
var scoree = num.tryParse(isiData   ??"");

try {
  calculateScore(scoree) {
    if (90 <= scoree && scoree <= 100) {
      print('Konversi nilai = A');
    }
    else if (80 <= scoree && scoree < 90) {
      print('Konversi nilai = B');
    }
    else if (75 <= scoree && scoree < 80) {
      print('Konversi nilai = C');
    }
    else if (65 <= scoree && scoree < 75) {
      print('Konversi nilai = D');
    }
    else if (0 <= scoree && scoree < 65) {
      print('Konversi nilai = E');
    }
    else if (scoree == null) {
      print('Anda belum memasukan nilai');
    }
    else {
      print('Nilai tidak valid');
    }
  }
  print('${calculateScore(scoree)}');
}
catch (e,s){
  print('EXCEPTIONS = $e');
  print('LOCATION = $s');
}

stdout.write('Berapa?');
  var isijumlah = stdin.readLineSync();
  var sumEggs = num.tryParse(isijumlah   ??"");
  var statEggs = sumEggs;

buyBeli(statEggs){
  if (0 < statEggs){
    print('Beli satu susu dan $sumEggs telur');
  }
  else {
    print('Beli satu susu');
  }
}
  print('${buyBeli(statEggs)}');
*/

// FOR LOOPS
// PYRAMID
  var ms, mi, mj;
  var mn = 9;
  // mn = jumlah baris
  // mi = for index
  // ms = for space
  // mj = for star

  for (mi = 1; mi <= mn; mi++) {
//for loop for displaying space
    for (ms = mi; ms < mn; ms++) {
      stdout.write(" ");
    }
//for loop to display star equal to row number
    for (mj = 1; mj <= 2 * mi /*(2 * mi - 1)*/; mj++) {
      stdout.write("*");
    }
// ending line after each row
    print("\r\n");
  }

// HALF PYRAMID
  secondPy() {
    var zero = 0;
    var ki, kj;
    var kn = 8;
    for (ki = 1; ki <= kn; ki++) {
      for (kj = 1; kj <= ki; kj++) {
        stdout.write('* ');
      }
      print('');
    }
  }

  secondPy();
  print('\r');

// WHILE
  var oo = 1;
  while (oo < 11) {
    print('dor');
    oo++; // penting agar tidak terjadi infinite loops
  }
  print('\r\n');

// DO WHILE
// Validasi user
/*
  String username;
bool notValid = false;

do {
stdout.write('Masukan username anda');
var username = stdin.readLineSync()!;
  if(username.length < 6){
    notValid = true;
    print('Username tidak boleh kurang dari 6 karakter');
  }
  else {
    print('masukan password anda');
  }
}
while(notValid);
*/

// CONTINUE
  var kok;
  for (kok = 1; kok <= 11; kok++) {
    if (kok % 3 == 0) {
      continue;
    }
    print('$kok');
  }
  print('\r\n');
// BREAK

// SWITCH
// pengganti If
/*
  thisisSwitch() {
    stdout.write('Masukan angka yang diinginkan');
    var contSw = stdin.readLineSync()!;
    var contSwInt = int.parse(contSw);
    if (contSwInt < 2) {
      switch (contSwInt) {
        case 0:
          print('anda benar');
          break;
        case 1:
          print('anda salah');
          break;
        default:
          print('tidak ditemukan');
          break;
      }
    }
    else {
      print('error');}
  }
thisisSwitch();
*/

  // LIST
  List daftarMobil = [
    'avanzaa',
    'xenia',
    'fortuner',
    'agya',
    'pajero',
    'crown',
    'corolla',
    true,
    false,
    false,
    true,
    'hilux',
    'land cruiser'
  ];
  print(daftarMobil[1]);
  var y;
  for (y = 0; y < 4; y++) {
    print(daftarMobil[y]);
  }
  print('\r\n');
  daftarMobil.forEach((x) => print(x));
  print('\r\n');
  daftarMobil.add('type 86');
  daftarMobil.insert(0, 'camry');
  daftarMobil.remove('crown');
  daftarMobil.removeAt(5);
  daftarMobil.removeLast();
  daftarMobil.removeRange(6, 8);
  print('\r\n');
  daftarMobil.forEach((x) => print(x));
  List daftarMotor = [
    'tiger',
    'vario',
    'beat',
    'verza',
    'scoopy',
    'revo',
    'mio'
  ];
  List namaKendaran = [daftarMobil, daftarMotor];
  print('\r\n');
  daftarMotor.forEach((c) => print(c));
  print('\r\n');
  namaKendaran.forEach((b) => print(b));
  print('\r\n');
  var namaKendaraan2 = [...daftarMotor, ...daftarMobil];
  namaKendaraan2.forEach((v) => print(v));

  // SET - tidak ada anggota yang duplikasi
  print('\r\n');
  var nomorPunggung = {1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12};
  nomorPunggung.forEach((v) => print(v));
  print('\r\n');
  Set pemainBaru = new Set.from([1, 12, 11, 11, 8, 8]);
  pemainBaru.forEach((b) => print(b));
  pemainBaru.add(9);
  pemainBaru.addAll({15, 16, 17});
  pemainBaru.elementAt(3);

  var nomorBaru = {1, 3, 5, 7};
  var nomorLama = {1, 2, 4, 6, 8};

  var unionBl = nomorBaru.union(nomorLama);
  var intersectBl = nomorBaru.intersection(nomorLama);

  print(unionBl);
  print(intersectBl);

  // MAP
  print('\r\n');
  var worldCity = {
    'New York': 'USA',
    'Tokyo': 'Japan',
    'New Delhi': 'India',
    'Berlin': 'Germany',
    'London': 'UK',
  };
  print(worldCity['New York']);
  print('\r\n');
  var showKeys = worldCity.keys;
  print(showKeys);
  print('\r\n');

  // VISIBILITY METHOD

  // CASCADE NOTATION '..' OR '..?'

  // INHERITANCE aka extends

  // MULTIPARADIGM

  // Functional programming = fungsi matematika murni

  // PURE FUNCTION
  // Sebuah fungsi bergantung pada parameter atau argumen yang dimasukan
  int sum(int num1, int num2) {
    return num1 + num2;
  }

  // RECURSION
  // Functional tidak memiliki konsep 'for' atau 'while'
  // untuk melakukan iterasi, dilakukan recursion atau pemanggilan
  // fungsi itu sendiri
  int thisFibonacci(hn) {
    if (hn <= 0) {
      return 0;
    } else if (hn == 1) {
      return 1;
    } else {
      return thisFibonacci(hn - 1) + thisFibonacci(hn - 2);
    }
  }
  // IMMUTABLE VARIABLE
  // Variabel yang diinisialisasi tidak dapat dirubah
  // CONTOH = var x = 5;
  // x = x + 1; // Contoh variable yang tidak immutable
  // Dalam functional programming, fungsi adalah first class citizen
  // Act as all other components
  // It can be inserted into variable, or become parameter of other function called
  // higher order function

  // LAMBDA
  // Is a nameless function
  (int num1, int num2) {
    return num1 + num2;
  };
  var contLamb = (int exe1, int exe2) {
    return exe1 + exe2;
  };
  Function contLamb2 = () {
    print("ini adalah contoh lambda");
  };
  contLamb2();
  contLamb(1, 2);

  // HIGH ORDER FUNCTION
  // MENGAMBIL FUNGSI LAIN SEBAGAI PARAMETER
  var theFunction = (int aha1, int aha2) {
    return aha1 + aha2;
  };
  void myHigherOrderFunction(String printout, Function theFunction) {
    print(printout);
    print(theFunction(5, 5));
  }

  void otherHigherOrderFunction(
      String justPrint, Function(int aha1, int aha2) theFunction) {
    print(justPrint);
    print(theFunction(5, 5));
  }

  var fibonacci = [1, 2, 4, 7, 11, 16, 22, 29];
  fibonacci.forEach((zz) {
    print(zz);
  });

  // CLOSURES
  // Fungsi yang berada didalam fungsi lain (nested function) dapat mengakses
  // variabel yang berada didalam fungsi induknya
  Function calculate(base) {
    var count = 1;
    return () => print("Value is ${base + count++}");
  }

  var closureExample = calculate(2);
  closureExample();
  closureExample();

  // DART TYPE SYSTEM
  // Type system adalah seperangkat aturan yang dibuat untuk menetapkan properti
  // kepada berbagai sebuah program, seperti sebuah standart
  // Dart menyebutnya sebagai sound type system
  /* Manfaat dari sound type system ini, antara lain:

Mengungkap bug terkait tipe pada saat compile time.
Sound type system memaksa kode untuk tidak ambigu tentang tipenya, sehingga bug terkait tipe yang mungkin sulit ditemukan saat runtime, bisa ditemukan pada waktu kompilasi.
Kode lebih mudah dibaca.
Kode menjadi lebih mudah dibaca karena Anda dapat mengandalkan nilai yang benar-benar memiliki tipe yang ditentukan. Tipe pada Dart tidak bisa berbohong.
Kode lebih mudah dikelola.
Ketika Anda mengubah satu bagian kode, type system dapat memperingatkan Anda tentang bagian kode mana yang baru saja rusak.
Kompilasi ahead of time (AOT) yang lebih baik.
Kode yang dihasilkan saat kompilasi AOT menjadi jauh lebih efisien. */

  // GENERIC
  // Konsep yang digunakan untuk menetapkan tipe data yang digunakan
  // dinyatakan dalam <> Cont = List <int>
  // BERIKUT INI ADALAH CONTOH YANG DIDASARKAN PADA CLASS DIATAS
  List<mammal> weAreMammal = [isOkMammal(), healthMammal(), seaMammal()];

  // TYPE INTERFACE
  mammal guessIsMammal = seaMammal();
/* Seperti yang kita tahu Dart mendukung type inference. Dart memiliki
analyzer yang dapat menentukan menyimpulkan tipe untuk field, method,
variabel lokal, dan beberapa tipe argumen generic. Ketika analyzer tidak
memiliki informasi yang cukup untuk menyimpulkan tipe tertentu, maka tipe dynamic akan digunakan.*/

  var ajsixteen = 3;
  ajsixteen = 4;
  num ajeighteen = 5;
  ajeighteen = 5.1;
  num ajfourteen = 14;
  ajfourteen = 13;
  var stringStrong = 'HAHA';
  var numbNumb = 2.2;
  print(stringStrong + numbNumb);

// DART FUTURES
// Synchronous vs Asynchronous
// Synchronous = program ditulis secara beurutran dari atas kebawah
// Asynchronous = kode setelahnya dapat diproses terlebih dulu, berguna untuk
// program yang besar dan berat dan memerlukan waktu yang lama
// CONT = API
// untuk melakukan asynchronous programming pada Dart, memerlukan Dart future
// Dalam Dart future, perlu menuliskan tiga skenario yang mungkin terjadi
// COMPELETED WITH DATA, COMPLETED WITH ERROR, WHEN COMPLETE

  // UNCOMPLETED
  // Menggunakan keyword delayed
  /*Future<String> getOrder() {
    return Future.delayed(Duration(seconds: 3), () {
      return 'Coffee Boba';
    });
  }*/

  // COMPLETED WITH DATA
  /*getOrder().then((value) {
    print('You order: $value');
  });
  print('Getting your order...');*/

  // COMPLETED WITH ERROR

  /* getOrder().then((value) {
    print('You order: $value');
  })
      .catchError((error) {
    print('Sorry. $error');
  });
  print('Getting your order...');

  Future<String> getOrder() {
    return Future.delayed(Duration(seconds: 3), () {
      var isStockAvailable = false;
      if (isStockAvailable) {
        return 'Coffee Boba';
      } else {
        throw 'Our stock is not enough.';
      }
    });

  }
*/

// EFFECTIVE DART AKA DART NAMING CONVENTION
/*  Panduan Effective Dart
  Guidelines dari Effective Dart dibagi menjadi empat bagian sesuai dengan fungsinya.

  Style guide. Mendefinisikan aturan untuk meletakkan dan mengatur kode. Panduan ini juga menentukan bagaimana format penamaan sebuah identifier, apakah menggunakan camelCase, _underscore, dll.
  Documentation guide. Panduan ini terkait tentang apa yang boleh dan tidak ada di dalam komentar. Baik itu komentar dokumentasi atau komentar biasa.
  Usage guide. Panduan ini mengajarkan bagaimana memanfaatkan fitur bahasa secara terbaik untuk menerapkan perilaku. Penggunaan statement atau expression akan dibahas di sini.
  Design guide. Ini adalah panduan dengan cakupan terluas namun paling tidak mengikat. Panduan ini mencakup bagaimana mendesain API library yang konsisten dan bisa digunakan.

  Effective Dart memiliki banyak rules. Masing-masing aturan akan diawali dengan kata kunci untuk menentukan bagaimana sifat dari aturan tersebut. Lima kata kunci tersebut, antara lain:

  DO. Ketika aturan diawali dengan DO maka praktik tersebut harus selalu diikuti.
  DON’T. Sebaliknya, aturan yang diawali dengan DON’T bukan merupakan hal yang baik untuk diterapkan.
  PREFER. Ini adalah praktik yang harus diikuti. Namun, mungkin ada keadaan di mana lebih masuk akal untuk melakukan sebaliknya. Pastikan Anda memahami konsekuensi ketika Anda mengabaikan aturan ini.
  AVOID. Ini adalah kebalikan dari PREFER. Panduan ini menjelaskan hal-hal yang tidak boleh dilakukan, namun kemungkinan ada alasan bagus untuk melakukannya pada beberapa kejadian.
  CONSIDER. Panduan ini adalah praktik yang bisa Anda ikuti atau tidak Anda ikuti, tergantung pada keadaan dan preferensi Anda sendiri.

*/

/*
DO name types using UpperCamelCase.
Class, enum, typedef, dan type parameter harus menggunakan huruf kapital pada huruf pertama dari setiap kata termasuk kata pertama.
 */

/*
DON’T use prefix letters.
Karena Dart dapat memberitahu Anda tipe, cakupan, dan properti lain pada sebuah deklarasi, maka tidak ada alasan untuk menambahkan prefix pada sebuah identifier.
 */

/*
PREFER starting function or method comments with third-person verbs.
Sebuah komentar dokumentasi harus fokus menjelaskan apa yang dilakukan kode tersebut. Menambahkan kata kerja dari sudut pandang orang ketiga di awal komentar adalah salah satu cara melakukannya.

 */

/*
PREFER a noun phrase for a non-boolean property or variable.
Seorang developer yang membaca kode kita akan fokus pada apa yang ada pada property. Jika mereka lebih peduli tentang bagaimana suatu property ditentukan, maka lebih baik dibuat menjadi method dengan nama menggunakan kata kerja.

 */

/*
Sementara untuk variabel atau property booleans PREFER gunakan kata kerja non-imperative, seperti:
list.isEmpty
dialog.isOpen
 */

/*
DO use ?? to convert null to a boolean value.
Aturan ini berlaku ketika sebuah expression dapat mengevaluasi nilai true, false, atau null dan Anda perlu meneruskan hasilnya ke sesuatu yang tidak menerima nilai null.
 */

/*
if(stock?.isEnough) {
  print('Making you a cup of coffee...');
}
Kode di atas akan menghasilkan exception ketik stock-nya null. Untuk mengatasinya kita perlu memberikan nilai default ketika nilai awalnya null. Sehingga kodenya akan menjadi seperti berikut:

stock?.isEnough ?? false;

 */

/*
AVOID using curly braces in interpolation when not needed.
Seperti yang kita tahu, Dart dilengkapi dengan fitur string interpolation untuk menggabungkan nilai string dengan nilai lain secara lebih mudah.

print('Hi, ${name}, You are ${thisYear - birthYear} years old.');
Namun jika Anda menginterpolasi identifier sederhana, maka curly braces ({}) tidak perlu ditulis.

print('Hi, $name, You are ${thisYear - birthYear} years old.');
 */

/*
PREFER async/await over using raw futures.
Kode asynchronous bisa jadi sangat sulit untuk dibaca dan di-debug, bahkan ketika menggunakan abstraksi yang bagus seperti Future. Sintaks async-await memungkinkan Anda menuliskan kode asynchronous dengan gaya synchronous sehingga memudahkan membaca kode.
// raw future
void main() {
  getOrder().then((value) {
    print('You order: $value');
  })
  .catchError((error) {
    print('Sorry. $error');
  });
  print('Getting your order...');
}


// async-await
void main() async {
  print('Getting your order...');
  try {
    var order = await getOrder();
    print('You order: $order');
  } catch (error) {
    print('Sorry. $error');
  }
}

 */

/*
CONSIDER making the code read like a sentence.
Penamaan dalam kode baik itu nama variabel, fungsi, maupun lainnya adalah hal yang sangat penting namun juga tidak mudah. Sebagai solusi kita bisa membayangkannya seolah sedang membuat kalimat.

// “If store is open ...”
If (store.isOpen)

// “hey garfield, eat!”
garfield.eat();

// Bad example
// Ambigu apakah memerintahkan toko untuk tutup atau mendapatkan status dari toko
If (store.close)
 */

/*
// “If store is open ...”
If (store.isOpen)

// “hey garfield, eat!”
garfield.eat();

// Bad example
// Ambigu apakah memerintahkan toko untuk tutup atau mendapatkan status dari toko
If (store.close)
 */

/*
CONSIDER using function type syntax for parameters.
Dart memiliki sintaks khusus untuk mendefinisikan parameter yang tipenya adalah fungsi. Caranya yaitu dengan menuliskan tipe kembalian sebelum nama parameter kemudian parameter dari fungsi setelahnya.

List filter(bool predicate(item)) { }
Sejak Dart versi 2, terdapat notasi umum untuk tipe fungsi sehingga bisa digunakan untuk parameter berupa fungsi.

List filter(Function predicate) { }  // function type syntax
 */
}
