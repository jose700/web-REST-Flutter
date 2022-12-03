import 'package:example_asincronia/mockapi.dart';
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
      title: 'Asynchronous call',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Asynchronous call'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
 
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),     
        centerTitle: true,   
       
      ),
 
body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              FutureBuilder<int>(
                future: MockApi().getFerrariInteger(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: const TextStyle(fontSize: 20),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
             
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
                onPressed: () async {
                  var result = await MockApi().getFerrariInteger();
                  counter = result;
                  print('Ferrari: $result');
                },  
                child: const Icon(Icons.battery_charging_full_outlined, size: 50, textDirection: TextDirection.ltr, color: Colors.white, ),
              ),
               FutureBuilder<int>(
                future: MockApi().getHyundaiInteger(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: const TextStyle(fontSize: 20),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
                onPressed: () async {
                  var result = await MockApi().getHyundaiInteger();
                  setState(() {
                    counter = result;
                    print('Hyundai: $result');
                  });
                },
                child: const Icon(Icons.car_rental, size: 50),
              ),
              const SizedBox(height: 20),
               FutureBuilder<int>(
                future: MockApi().getFisherPriceInteger(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: const TextStyle(fontSize: 20),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
                onPressed: () async {
                  var result = await MockApi().getFisherPriceInteger();
                  setState(() {
                    counter = result;
                    print('Fisher Price: $result');
                  });
                },
                //person running
                child: const Icon(Icons.directions_run, size: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
        
   
}