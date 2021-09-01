import 'package:firebase_database/firebase_database.dart';

class DatabaseMethods {
  Stream<DataSnapshot> getProductNameById(String id) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    Stream<DataSnapshot> snapshot =
        ref.child("product-name").child(id).get().asStream();

    return snapshot;
  }

  Stream<DataSnapshot> getProductPriceById(String id) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    Stream<DataSnapshot> snapshot =
        ref.child("product-price").child(id).get().asStream();
    return snapshot;
  }

  Stream<DataSnapshot> getProductImageById(String id) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    Stream<DataSnapshot> snapshot =
        ref.child("product-image").child(id).get().asStream();
    return snapshot;
  }

  Stream<DataSnapshot> getProductDescriptionById(String id) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    Stream<DataSnapshot> snapshot =
        ref.child("product-desc").child(id).get().asStream();
    return snapshot;
  }
}
