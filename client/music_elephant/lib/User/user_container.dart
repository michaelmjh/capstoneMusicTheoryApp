import 'package:flutter/material.dart';
import 'package:music_elephant/User/specific_profile.dart';
import 'users.dart';

class UserContainer extends StatefulWidget {
  var users;
  final setSelectedProfile;

  UserContainer(this.users, this.setSelectedProfile);

  @override
  State<UserContainer> createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  var profileSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: profileSelected == ""
          ? Users(widget.users, widget.setSelectedProfile)
          : SpecificProfile(profileSelected),
    );
  }
}
