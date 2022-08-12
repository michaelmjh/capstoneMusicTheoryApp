import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  var users;
  final setSelectedProfile;

  Users(this.users, this.setSelectedProfile);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Profile"),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.person_add_alt_rounded),
        ],
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                ...(widget.users as List).map(
                  (user) {
                    return ElevatedButton(
                      onPressed: () {
                        widget.setSelectedProfile(user);
                        Navigator.pushNamed(context, "/profile");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.green[100],
                        child: Text(user),
                      ),
                    );
                  },
                ).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
