import 'package:flutter/material.dart';
import 'package:project/ui/orders/orders_screen.dart';

import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          )),
      home: const ProductOverviewScreen(),
      routes: {
        CartScreen.routeName: (ctx) => const CartScreen(),
        OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return ProductDetailScreen(
                ProductsManager().findById(productId),
              );
            },
          );
        }
        return null;
      },
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
