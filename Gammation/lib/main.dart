import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gammation/login.dart';
import 'package:gammation/userprofile.dart';
import 'package:provider/provider.dart';
import './favorite.dart';
import './home.dart';
import './report.dart';

Future<void> main() async {
  //Initialized from firebase before run app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Gameprovider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gammation',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const List<Widget> _widgetOptions = <Widget>[
    FavoritePage(),
    Home(),
    ReportScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //to check user authentication
  userAuth(){
    final user = FirebaseAuth.instance.currentUser;
    // Check that user login to our application
    if (user != null) {
      final email = user.email;
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              userprofilePage(userEmail: email.toString()),
          )
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
            LoginPage(),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      appBar: AppBar(
        title: Text("Gammation", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromRGBO(255, 238, 173, 1),
        centerTitle: true,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: const Icon(
              Icons.perm_identity,
              size: 35,
            ),
            onPressed: () => userAuth(),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(255, 238, 173, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.redAccent,
      ),
    );
  }
}
