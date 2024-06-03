import 'package:flutter/material.dart';
import 'dice.dart';

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

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  // 추후, 메모리 낭비를 막기 위해 dispose 해주어야함.
  // 하지만 일단은 넘어갑니다.


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
      body: Builder(
        builder: (context) {
          return SingleChildScrollView (
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
                            controller: controller,
                            decoration: InputDecoration(
                                labelText: 'Enter "Dice"'
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: controller2,
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
                              onPressed: () {
                                if (controller.text == "dice" && controller2.text=='1234') {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Dice()));
                                }
                                else if (controller.text != "dice" && controller2.text=='1234') {
                                   showSnackBar2(context);
                                }
                                else if (controller.text == "dice" && controller2.text!='1234') {
                                    showSnackBar3(context);
                                }else {
                                  showSnackBar(context);
                                }
                              },
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
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
        '로그인 정보를 다시 확인하세요',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다.',
      textAlign: TextAlign.center,),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ),
  );
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      'dice의 철자를 확인하세요.',
      textAlign: TextAlign.center,),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ),
  );
}
