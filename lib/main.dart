import 'package:flutter/material.dart';
import 'dart:math'; //untuk fungsi random

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
  String _currentNews = ''; //state title yang akan berubah
  final Random _random = Random(); //objek random

  final List<String> dataNews = [
    "Berita tentang sepak bola",
    "Berita tentang open trip mancing",
    "Berita tentang teknologi AI",
    "Berita tentang hacker",
    "Berita timnas gagal masuk ke round5",
    "Berita Jobfair di selenggarakan di tangerang"
    "Berita Belajar flutter"
  ];

  @override
  void initState(){
  super.initState();
   _currentNews = dataNews[_random.nextInt(dataNews.length)];// tampilkan berita pertama saat mulai
  }

void _incrementCounter() {
  setState((){
  _counter++;
  //ubah title setiap kali tombol ditekan
  int randomIndex = _random.nextInt(dataNews.length);
    // Ubah title sesuai berita
 _currentNews = dataNews[randomIndex];
  });
  }


@override
Widget build (BuildContext context){
  return Scaffold(
  appBar:AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     title: Text(widget.title), //gunakan title dinamis
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
              const SizedBox(height: 30),
            const Text(
              'Berita Terbaru:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
               Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _currentNews,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
       
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Tampilan Berita Acak',
        child: const Icon(Icons.shuffle),
        ),
    );
    }
    
}

