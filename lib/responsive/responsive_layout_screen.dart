import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
//import 'package:flutter/rendering.dart';
import 'package:instagram_flutter/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  void initState(){
    super.initState();
    addData();
  }

  void addData() async{
    UserProvider userProvider = Provider.of(context,listen:false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //display web screen layout
        return widget.webScreenLayout;
      } else {
        //display a mobile screen layout
        return widget.mobileScreenLayout;
      }
    });
  }
}
