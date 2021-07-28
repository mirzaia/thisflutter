import 'dart:html';
import 'package:flutter/material.dart';

import 'whileFlutter.dart'; 

// "NOW WHAT?"" MOBILE APP
// Application to maintain and control your daily schedule
// by Mirza Ichwanul Aziz

// DISCLAIMER!!
// Dikarenakan ada kendala teknis dalam instalasi Flutter [instalasi berjalan sangat lamban,
// sehingga flutter doctor tidak dapat berjalan dengan baik], maka hanya di submit kode nya saja
// dan belum dilengkapi framework Flutter


// START APP "NOW WHAT?"
void main() {
  runApp(MyApp()); // Method untuk menjalankan aplikasi
}


// "NOW WHAT?" APP STRUCTURE
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  // SCAFFOLD
    return MaterialApp(
      title: 'Mobile App: Now What?',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ), 
      home: FirstScreen(), SecondScreen()
    );
  }
}
     
// FirstPage
class FirstScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( // this is App Bar
        title: Text(),
        body: Column( 
          children: <Widget> [
            Container( 
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  column( // Home icon
                    children: <Widget> [
                      image: NetworkImage('https://icons8.com/icon/86527/home'),
                      SizedBox(height: 8.0) 
                    ]
                  ),
                  column( // Add icon
                    children: <Widget> [
                      image: NetworkImage('https://icons8.com/icon/85096/add'),
                      SizedBox(height: 8.0) 
                    ]
                  ),
                ],
              )
            )  
          ]
        )
        ,
      ),
      body: center( // app body
        title: Text(),
        body: Column( // First column
          children: <Widget> [
            Container( // Header 'Now What?'
              child: Text(
                'Now What?', style: TextStyle(
                  fontSize: 40,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              color: Colors.grey[50],
              width: double.infinity,
              height: 555,
              padding: EdgeInsets.all(11); 
              margin: EdgeInsets.all(1)
            )
          ]
        ),
        Column( // Second column
          mainAxisAlignment: mainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Container(
              child: Text( // Go to list of your hobbies
                'Work', style: TextStyle( 
                  fontSize: 18,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              color: Colors.grey[50],
              height: 25,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( 
              colors: Colors.indigoAccent[100],
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
            Container( // Go to list of your hobbies
              child: Text(
                'Hobbies', style: TextStyle(
                    fontSize: 18,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              color: Colors.grey[50],
              height: 25,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( // merupakan bagian dari container yg berfungsi untuk styling
              colors: Colors.indigoAccent[100],
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
          ]

        ),
        column( // Third column
          mainAxisAlignment: mainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Container( // Go to your list of excercises
              child: Text(
                'Excercise', style: TextStyle(
                  fontSize: 18,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
            ),
         ),
              color: Colors.grey[50],
              height: 25,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( 
              colors: Colors.red,
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
            Container( //  Go to your other list
              children: Text(
                'Others', style: TextStyle(
                  fontSize: 18,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              ),
            
              color: Colors.grey[50],
              height: 25,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( 
              colors: Colors.red,
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
          ]

        ),
      ) 

    );
  } 
}



// SecondPage
class SecondScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        child: Column(
          mainAxisAlignment: mainAxisAlignment.spaceEvenly(),
          children: <Widget> [
            container(
              child: Text(
                'Your Work', style: TextStyle( // This page show your list of work
                  fontSize: 40,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                 ),
               ),
              color: Colors.grey[50],
              width: double.infinity,
              height: 555,
              padding: EdgeInsets.all(11); 
              margin: EdgeInsets.all(1)
            ),
            margin: EdgeInsets.only(top: 16.0),
            child: Text('')
          ]
        ), 
      ),
      body: Center(
        title: Text(),
        body: Column(
          children: <Widget> [
            Container(
              child: Text( // No. 1
                'PT. A Company Interview', style: TextStyle( 
                  fontSize: 18,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              color: Colors.grey[50],
              height: 25,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( 
              colors: Colors.indigoAccent[100],
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
            Container(
              child: Text( // No. 2
                'PT. B Online Test', style: TextStyle( 
                  fontSize: 18,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              color: Colors.grey[50],
              height: 25,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( 
              colors: Colors.indigoAccent[100],
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
            Container(
              child: Text( // No. 3
                'Paper Deadline', style: TextStyle( 
                  fontSize: 18,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              color: Colors.grey[50],
              height: 25,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( 
              colors: Colors.indigoAccent[100],
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
            Container(
              child: Text( // No. 4
                'Team Meeting', style: TextStyle( 
                  fontSize: 18,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                     ),
                    ],
                  ),
                ),
              color: Colors.grey[50],
              height: 25,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration( 
              colors: Colors.indigoAccent[100],
              shape: BoxShape.square,
              border: Border.all(color: Colors.indigo),
              ),
            ),
          ] 
        ),
      ),
    );
  }

}



