import 'package:flutter/material.dart';
import 'api.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'REST API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _amountTextCtrl = new TextEditingController();
  TextEditingController _nameTextCtrl = new TextEditingController();
  TextEditingController _idTextCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(

        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:10,),
            Center(child:
            Text(
              'SEND DATA TO API',
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38,),
              child: TextFormField(
                controller: _idTextCtrl,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your ID',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: TextFormField(
                controller: _nameTextCtrl,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your Name',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: TextFormField(
                controller: _amountTextCtrl,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your Money',
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'SUBMIT TO API NOW ',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.cyan,
                textColor: Colors.black,
                onPressed: () async {
               
                  await   Api().sendRequest(_idTextCtrl.text,_nameTextCtrl.text,_amountTextCtrl.text).then((res){

                    Map<String,dynamic> result = res;
                 //API RESPONSE
                    print(result);
                    final snackBar = SnackBar(content: Text(result.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  
                  });
                  print('You clicked Me!');
                  
                },
              ),
            ),      
            
            
          ],
        ),
      ),

    );
  }
}
