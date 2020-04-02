// import 'package:flutter/material.dart';
// import '../screens/categories_screen.dart';
// import '../screens/favourite_screen.dart';

// class TabScreen extends StatefulWidget {
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             unselectedLabelColor: Colors.grey[400],
//             labelColor: Colors.amber,
//             indicatorColor: Colors.amber,
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favourites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             CategoryScreen(),
//             FavouriteScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
