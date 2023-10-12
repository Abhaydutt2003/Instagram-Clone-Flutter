import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:instagram_flutter/models/user.dart' as model;

// class MobileScreenLayout extends StatefulWidget {
//   const MobileScreenLayout({super.key});

//   @override
//   State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
// }

// class _MobileScreenLayoutState extends State<MobileScreenLayout> {
//   String username = "";

// //cannot make this async, will give errors
//   @override
//   void initState() {
//     super.initState();
//     getUsername();
//   }

//   void getUsername() async {
//     DocumentSnapshot snap = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     setState(() {
//       username = (snap.data() as Map<String,dynamic>)['username'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Text('$username'),
//     ));
//   }
// }

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(user.username),
      ),
    );
  }
}
