import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/features/menu/models/menu_item_model.dart';


class MenuRepo {
  final FirebaseFirestore firestore;

  MenuRepo(this.firestore);
  Future<List<MenuItem>> getMenuItems() async {
    try {
      final snapshot = await firestore.collection('menu').get();
      final List<MenuItem> menu = snapshot.docs
          .map((doc) => MenuItem.fromMap(doc.id, doc.data()))
          .toList();
          return menu;
    } catch (e) {
     throw Exception('Error fetching menu items: $e');
   
    }
  }
}
