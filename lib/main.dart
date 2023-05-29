import 'package:elderly_squire_capstone/HomePage2.dart';
import 'package:elderly_squire_capstone/ReminderHome.dart';
import 'package:elderly_squire_capstone/chatapp3/ChatApp3Home.dart';
import 'package:elderly_squire_capstone/chatapp3/Login2.dart';
import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';
import 'package:elderly_squire_capstone/intro/intro_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Login.dart';
import 'HomePage.dart';
import 'package:provider/provider.dart';
import 'medicine_details.dart';
import 'todo_service.dart';
import 'global_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType=null;
//  final sharedPreferences = await SharedPreferences.getInstance();


  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  GlobalBloc globalBloc;
  TodoService toDoService;

  get email => null;

  void initState() {
    globalBloc = GlobalBloc();
    toDoService= TodoService();


    super.initState();
  }


//class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [
//        Provider<GlobalBloc>(create: (_) => GlobalBloc()),
//        Provider<TodoService>(create: (_) => TodoService()),
//      ],
//      child: MaterialApp(
////          home: LandingPage(),
//        home: StreamBuilder(
//          stream: AuthServices().onChangedUser,
//          builder: (context, snapshot){
//            return snapshot.data == null?Login2():ChatApp3Home();
//          },
//        ),
//
//        debugShowCheckedModeBanner: false,
//
//        ),
//    );
    return Provider<GlobalBloc>.value(
//      create: (context) => TodoService(),
    value: globalBloc,
      child: MaterialApp(
//          home: LandingPage()-----original
//      initialRoute: "/",
//          routes: {
//            '/medicinelog': (context) => ReminderHome(email: email),
//          },
          home: LaunchScreen()

      ),);
  }

}

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.blueGrey[900],
      seconds: 6,
//      backgroundColor: Colors.blueGrey[900],
      navigateAfterSeconds: new LandingPage(),
//      title: new Text('GeeksForGeeks',textScaleFactor: 2,),
      image: new Image.asset('assets/images/elderly_squire_logo_classic_icon.png'),
      loaderColor: Colors.blue,
//      loadingText: Text("\n Loading...",
//        style: TextStyle(
//        color: Colors.white,
//            fontSize: 15
//    ),),
    photoSize: 50.0,

    );
  }
}



class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: Center(
            child: Text("Error: ${snapshot.error}"),
          ));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                User user = snapshot.data;

                if (user == null) {
                  return Login();
                } else {
                  return Login();
                }
              });
        }
        return Scaffold(
            body: Center(
          child: Text("Checking Login....."),
        ));
      },
    );
  }
}

//
