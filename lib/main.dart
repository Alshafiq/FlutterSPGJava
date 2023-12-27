import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SPG',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter SPG Java'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String data = "MDAwMDY0gAoSGPG4EU3IGGOw4v92k0psBW5Xp/ns5fEpPROCcF5cDn3kuOfdn5sSMACiimEzt+daZPisTp2w1UX8saltTId2UFMLStBryQUgeJoz4r0MAS3IEtkVKzMMHuSaevxN4Wr0bYmIRMs+AMNG8JxlnyFvB4rlZNVmZdLfK/uGvNSeeZ1I1v6L6/TJvXib/BTTpGHn+5hj8o0sBAMXVLwCGDj32p/ImEtS9ao6ef86h1RdDO1FS2R8eGjH+OCVbKDlCqE0SpXbKwpbmbUtDrUkFPEnaQwa+Ntuw3OTuLzSZvxtfcRInZpveDICnoDmIX6oOb5GA/XVpHyqHe5xegzGOzPWSh6Pl4Q62Qt0aS0vMlijuibdDXOSqv9EQCfQc54eGx05pAghEzVAtRsnzLsv3+mr8bVpyM8bIpiHD4vFiNEErlVL1riM4u7NJNzxQlwyeeLGWpdp+x2OvlC1xyHL2eJ2uKkCuoTxkWdn+fRSuuc+sziEQt2kLPYiTv47j/kvHMkI4XHvZIR3ckAeGLVR07AmhIrFwJ3fdvYzmK9QyySxkxTFqfk95d0vCdHLemyb4cG7qyw7g4PER1uMjVPy4bIRjUNYOQc7NwK03y0cA/u+tLXQuRd8aLuo0U5g0U+kA7pYe76mjHbzCKMi7iFNutZKnlCpEbU55eRp40m0A7YVJgrlQZDls2OAsgqkWgX8WcWdnkAqKZvHZyQi5EYUb+LVD8ICkDiDq/Gel/2D6HYeKZ7ljjUFAXE2+9l4JzHHe13MltrYpZ85ozyHmt6cHsXwBRg+HcZBRiu4R/rqYX9N1Io/hEgJmwy2wleVQmVkNoBHRt8dUPMNKnIhNvqTYKFzbCvBTCTbYZLB5IFOpShcG5deReRcM7DL1K6K2RV7ihw8lbW6smlxr6R/MUXVwKlo5FEAOgh/4FZC97auYicy5/qLMXA2rbnMrFIRfMb/8WRdAeCCC8XjtRlb33L3dawvf8Tof87ImwDb/ctZrDg9U0vD5lR+M27ApWXuqWNgHmBBqCeG721VRjoc9Xeyal85dzN01TmhP6dFO89uImbAY1p+TEwgkt/w9XPkUTFZzSu8ZXVOOtWvcP1RTsloBtaWzBptXK1alB+dcngJQD7Iwb6ZErJckV3MHTNPAl1gggANc8uTJpiMpZARx2r466JF1G77J8/PXYqtNgYG80HIrRLPqhIb+Rb0+eCSf7tm4BScpmoXcUkUnGDOzNWWpPAxOD/j938O2l7tSsx7584vh4GaH8R2LHMaE9kDgPQMD/ZI7ow5Dn4TT1NPZOYv5FNnQDvhvTJzFAVK2AxRtnwjitYQFlzNUwoZnjGKEOgX6RnJNNVhLbfeCJEjq9ys2tpO9qoa+ZJZ";

  //for ANDROID
  static const platform = MethodChannel('com.example.flutter_spg_java/main');

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      var sendMap = <String, dynamic>{
        'dataString': data
      };
      platform.invokeMethod('spayPlaceOrder', sendMap);

      //for IOS
      // const url = 'sarawakpay://merchantappscheme?data';
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   throw 'Could not launch $url';
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Encrypted Data',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
