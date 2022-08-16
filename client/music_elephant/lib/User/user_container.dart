import 'package:flutter/material.dart';
import 'package:music_elephant/User/specific_profile.dart';
import 'users.dart';

class UserContainer extends StatefulWidget {
  var users;
  final setSelectedProfile;
  final getLevels;
  final setTimelineLessonList;
  final deleteUser;
  final setUserProgress;
  

  UserContainer(this.users, this.setSelectedProfile, this.getLevels,
      this.setTimelineLessonList, this.deleteUser, this.setUserProgress);

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
          : SpecificProfile(
              profileSelected,
              widget.getLevels,
              widget.setTimelineLessonList,
              widget.deleteUser,
              widget.setUserProgress),
    );
  }
}
