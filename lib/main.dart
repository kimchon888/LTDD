import 'package:flutter/material.dart';
import 'pages/cart_page.dart';
import 'pages/purchase_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng dụng bán đồ ăn',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cart': (context) => CartPage(),
        '/purchase': (context) => PurchasePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Text('Giỏ hàng'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/purchase');
              },
              child: Text('Mua hàng'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Đăng nhập'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}
