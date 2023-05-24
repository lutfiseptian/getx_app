import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final CounterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => OtherPage())),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(child: CountWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounterC.add();
        },
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return GetBuilder<CounterController>(builder: (c) => Text("Angka ${c.count}") );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class CounterController extends GetxController{
  var count = 0;

  void add(){
    count++;
    update();
  }

}
