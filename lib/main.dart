import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50),),
            Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170,
                height: 190,
              ),
            ),
            Form(child: Theme(
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 15.0
                    )
                  )
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0),
                  child: Column(

                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter "Dice"'
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Enter Password'
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(Colors.white)
                          ),
                          onPressed: () {},
                          child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 35,
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
            )
          ],
        ),
      ),
    );
  }
}

