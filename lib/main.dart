import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'providers/user_profile_provider.dart';
import 'screens/item_list_screen.dart';
import 'screens/edit_item_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: ItemListScreen.routeName, //Start ItemListScreen Page
      routes: {
        ItemListScreen.routeName: (context) => const ItemListScreen(),
        EditItemScreen.routeName: (context) => const EditItemScreen(),
      },
    );
  }
}
