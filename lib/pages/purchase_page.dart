import 'package:flutter/material.dart';
import 'api_service.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  late Future<List<dynamic>> foodItems;

  @override
  void initState() {
    super.initState();
    foodItems = ApiService().fetchFoodItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mua hàng'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: foodItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Có lỗi xảy ra: ${snapshot.error}'));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]['name']),
                  subtitle: Text('${items[index]['price']} VNĐ'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
