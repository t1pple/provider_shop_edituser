import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../providers/user_profile_provider.dart';
import '../screens/edit_item_screen.dart';
import 'edit_username_screen.dart';

class ItemListScreen extends StatelessWidget {
  static const routeName = '/';

  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserProfileProvider>(
          builder: (context, userProfile, _) {
            return Text("รายการสินค้า (User: ${userProfile.username})");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditUsernameScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemprovider, child) {
          return ListView.builder(
            itemCount: itemprovider.items.length,
            itemBuilder: (context, index) {
              final item = itemprovider.items[index];
              return ListTile(
                title: Text('สินค้า : ${item.name}'),
                subtitle: Text('รายละเอียด : ${item.description}'),
                trailing: Text('${item.price}'),
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(EditItemScreen.routeName, arguments: item.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}
