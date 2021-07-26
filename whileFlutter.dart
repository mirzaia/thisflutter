import 'package:flutter/material.dart'; // Memanggil dari berkas flutter yang lain
// Import kode dari library


// STRUKTUR FLUTTER

// 1. class myapp merupakan dasar dari aplikasi tersebut (harus ada), dan semua class
// yang dibuat dipanggil disini

// 2. class lainnya yang kita buat sendiri
// 3. badan utama, yaitu void main() 

// WIDGET
class MyApp extends StatelessWidget {
  // This widget is the root of the app
  @override
  Widget build(BuildContext context) {
    // materialapp adalah bawaan widget flutter untuk material design
    // mengatur theme, main interface, page navigation, dll
    // digunakan sekali saja
    // ibarat rumah, materialapp adalah alasnya
    return MaterialApp(
      title: 'This is FLutter',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ), // scaffold adalah struktur layout dasar
      // untuk mengatur App bar, Floating action, Button, Drawer, dll
      // scaffold adalah tembok atau bangunan rumah itu sendiri
      
      home: FirstScreen( // memanggil widget scaffold bernama "FirstScreen" yang baru dibuat
        appBar: AppBar(
          title: Text('Thw world is burning!'),
        ),
        body: Center(
          child: Heading('Lets kill batman!'), // memanggil stateless widget 'Heading' yg baru dibuat
        ),
      ),
    );
  }
}



// WIDGET
// State - data yang ada pada widget
// State adalah properti dari suatu class

// NOTED = Learn about @override again!


// Stateless widget
class letsWidget extends StatelessWidget{
  // Karena stateless, harus dibuat final
  final String _text

  Heading({this._text});

  @override
  Widget build(BuildContext context){
    return Text(text, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,));
  }
}

// APLIKASI STATELESS WIDGET


// Stateful widget
class ContohStateful extends StatefulWidget {
  final String parameterWidget; // ini parameter widget, tidak wajib ada
 
    ContohStateful({this.parameterWidget});
 
    @override
    _ContohStatefulState createState() => _ContohStatefulState();

}

class ContohStatefulState extends Status<ContohStateful> {
  String _datastate; // ini merupakan contoh state / properti dari stateful widget

  @override 
  Widget build(BuildContext context){
    // isi widget
  }
}

// APLIKASI STATEFUL DAN STATEFUL WIDGET
class BiggerText extends StatefulWidget {
  final String text;
  const BiggerText({this.text});
  @override
  _BiggerTextState createState() => _BiggerTextState();
}


// contoh struktur class pada Flutter
class _BiggerTextState extends State<BiggerText> {
  // 1. deklarasi properti 
  double _textSize = 16.0;

  @override // 2. terdapat @override
  // 3. diikuti method / constructornya, which is a widget
  Widget build(BuildContext context) {
    // 4. Isi method / widgetnya
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
          child: Text("Perbesar"),
          onPressed: () {
            setState(() {
              _textSize = 32.0;
            });
          },
        )
      ],
    );
  }
}



// SCAFFOLD
// Membuat kerangka / tampilan dasar dari app
// Biasanya app memiliki tiga kerangka utama, yaitu AppBar, Body dan FloatingActionButton

// memanggil scaffold
class FirstScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( // this is AppBar
        leading: IconButton(// add icon menu on appbar
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text('This is app bar'),
        actions: <Widget>[
          IconButton( // add icon search on appbar
            icon: Icon(
              Icons.search, 
              color: Colors.white
              ),
            ),
          ],
        ),
        body: Center( // this is Body
          child: Text('This is body!'),
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        ),
      );
  } // selain text, bisa juga ditambahkan text field atau fitur lain seperti button, icon, dll
}



// AppBar
// Bar yang berada paling atas di app [header] atau toolbar
// menambahkan appbar pada scaffold di line 133



// Body
// Bagian utama aplikasi
// ditambahkan di line 149



// FloatingActionButton
// Sebuah tombol aksi / utama yang biasanya terletak dibawah tengah / kanan, terlihat
// melayang / floating



// Container

void main() {
  runApp(MyApp()); // Method untuk menjalankan aplikasi
  // dari library
}
