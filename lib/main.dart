import 'package:flutter/material.dart';

// Mulai dari membuat aplikasi Flutter
void main() {
  runApp(const MyApp());
}

// stl = digunakan untuk membuat stateless langsung tanpa 
//mengetik satu persatu code yang dibutuhkan

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title Aplikasi", // Judul Aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange
          ),
        ),
      home: const HomePage(title: 'Latihan Flutter jejen jaenudin 1125170031'), // arahkan ke halaman HomePage
    );
  }
}

// Halaman utama aplikasi
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title; //inial title (static saat kontruktor dipanggil)
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _currentTitle = ''; //state title yang akan berubah
  int _newsIndex = 0; // index berita yang sedang tampil

  final List<String> dataNews = [
    "Berita tentang sepak bola",
    "Berita tentang open trip mancing",
    "Berita tentang teknologi AI",
    "Berita tentang hacker",
  ];

  @override
  void initState(){
  super.initState();
   _currentTitle = dataNews[_newsIndex]; // tampilkan berita pertama saat mulai
  }

void _incrementCounter() {
  setState((){
  _counter++;
  //ubah title setiap kali tombol ditekan
  _newsIndex = (_newsIndex + 1) % dataNews.length;
    // Ubah title sesuai berita
 _currentTitle = dataNews[_newsIndex];
  });
  }


@override
Widget build (BuildContext context){
  return Scaffold(
  appBar:AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(_currentTitle), //gunakan title dinamis
    ),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Tombol ditekan sebanyak:'),
            Text(
            '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Tambah',
        child: const Icon(Icons.add),
        ),
    );
    }
    
}

