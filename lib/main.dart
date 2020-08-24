import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Basic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Tính toán cơ bản'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _numberOneController = TextEditingController();
  final TextEditingController _numberTwoController = TextEditingController();
  String showResult = '';
  bool _validate = false;
  static const int ADDITION = 0;
  static const int SUBTRACTION = 1;
  static const int MUlTIPLICATION = 2;
  static const int DIVISION = 3;

  void _calculator(int type){
    if(_numberOneController.text.isEmpty || _numberTwoController.text.isEmpty){
      _validate = true;
    } else {
      int numberOne = int.parse(_numberOneController.text);
      int numberTwo = int.parse(_numberTwoController.text);
      dynamic numberResult = 0;

      switch(type){
        case ADDITION:
          numberResult = numberOne + numberTwo;
          showResult = '$numberOne + $numberTwo = $numberResult';
          break;
        case SUBTRACTION:
          numberResult = numberOne - numberTwo;
          showResult = '$numberOne - $numberTwo = $numberResult';
          break;
        case MUlTIPLICATION:
          numberResult = numberOne * numberTwo;
          showResult = '$numberOne * $numberTwo = $numberResult';
          break;
        case DIVISION:
          if(numberTwo == 0) {
            showResult = 'Lỗi chia cho 0';
          } else {
            numberResult = (numberOne / numberTwo).toStringAsFixed(2);
            showResult = '$numberOne / $numberTwo = $numberResult';
          }
          break;
      }

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/ic_calculator.png',
              width: 150,
              height: 70,
            ),
            Row(
              children: <Widget>[
                Flexible().customFlexible(Container().customContainer(
                    TextField(decoration:
                    InputDecoration(
                      errorText: _validate ? 'Giá trị không để trống' : null,
                    ),).customTextField(
                        "Nhập số thứ nhất",
                        _numberOneController),
                  ),
                ),
                Flexible().customFlexible(Container().customContainer(
                    TextField(decoration:
                    InputDecoration(
                      errorText: _validate ? 'Giá trị không để trống' : null,
                    ),).customTextField(
                        "Nhập số thứ hai",
                        _numberTwoController)
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: RaisedButton(
                        onPressed: (){ _calculator(ADDITION);},
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Cộng', style: TextStyle(fontSize: 20),),
                      )
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: RaisedButton(
                        onPressed: (){ _calculator(SUBTRACTION);},
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Trừ', style: TextStyle(fontSize: 20),),
                      )
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: RaisedButton(
                        onPressed: (){ _calculator(MUlTIPLICATION);},
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Nhân', style: TextStyle(fontSize: 20),),
                      )
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: RaisedButton(
                        onPressed: (){ _calculator(DIVISION);},
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Chia', style: TextStyle(fontSize: 20),),
                      )
                  ),
                ),
//                Flexible().customFlexible(Container().customContainer(RaisedButton().customRaisedButton('Cộng'))),
//                Flexible().customFlexible(Container().customContainer(RaisedButton().customRaisedButton('Trừ'))),
//                Flexible().customFlexible(Container().customContainer(RaisedButton().customRaisedButton('Nhân'))),
//                Flexible().customFlexible(Container().customContainer(RaisedButton().customRaisedButton('Chia'))),
              ],
            ),

            Container(
              width: 360,
              height: 100,
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              child: Text(
                'Kết quả \n $showResult',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension ExtTextField on TextField{
  TextField customTextField(String titleText, TextEditingController tedController) => TextField(
    controller: tedController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      hintText: titleText,
      hintStyle: TextStyle(color: Colors.red),
      labelText: titleText,
    ),
  );
}

extension ExtContainer on Container{
  Container customContainer(Widget widget) => Container(
    padding: EdgeInsets.all(5),
    child: widget,
  );
}

extension ExtFlexible on Flexible{
  Flexible customFlexible(Widget widget) => Flexible(
    flex: 1,
    child: widget,
  );
}

//extension ExtRaisedButton on RaisedButton{
//  RaisedButton customRaisedButton(String titleText) => RaisedButton(
//    textColor: Colors.white,
//    color: Colors.blue,
//    child: Text(
//      titleText,
//      style: TextStyle(fontSize: 20),
//    ),
//  );
//}