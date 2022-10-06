
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future <void> placeOrder(String orderId)  ()async{
//   try{
//     Map<String,dynamic> details={
//       'orderId':orderId,
//       'time': FieldValue.serverTimestamp(),
//     }
//     await _firebaseFirestore.collection('orders').add(details);
//   }catch (e){print(e.toString());}
// }