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
        title: Text(
          "Select a Profile",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        foregroundColor: Color(0xffffecb4),
        backgroundColor: Color(0xffe5771e),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/addProfile');
            },
          )
        ],
      ),
      body: Container(
        color: Color(0xffffecb4),
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
                crossAxisCount: 2,
                children: <Widget>[
                  ...(widget.users as List<List<String>>).map(
                    (user) {
                      return Container(
                        child: FlatButton(
                          onPressed: () {
                            widget.setSelectedProfile(user[1]);
                            Navigator.pushNamed(context, "/profile");
                          },
                          child: Material(
                            color: Color(0xffe5771e),
                            elevation: 10,
                            borderRadius: BorderRadius.circular(28),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Color(0xffe5771e),
                                    width: 6,
                                  ),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Ink.image(
                                      image: AssetImage(
                                        user[0],
                                      ),
                                      height: 315,
                                      width: 315,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      user[1],
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: Color(0xffffecb4),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Container(
//                         decoration: BoxDecoration(
//                           color: Colors.transparent,
//                           border: Border.all(
//                             color: Color(0xffe5771e),
//                             width: 3,
//                           ),
//                         ),
//                         child: Material(
//                           color: Color(0xffe5771e),
//                           elevation: 10,
//                           child: FlatButton(
//                             onPressed: () {
//                               widget.setSelectedProfile(user[1]);
//                               Navigator.pushNamed(context, "/profile");
//                             },
//                             child: ConstrainedBox(
//                               constraints: const BoxConstraints.expand(),
//                               child: InkWell(
//                                 child: Stack(
//                                   children: [
//                                     Image.asset(
//                                       user[0],
//                                     ),
//                                     const SizedBox(
//                                       height: 6,
//                                     ),
//                                     DecoratedBox(
//                                       decoration: const BoxDecoration(
//                                         color: Color(0xffe5771e),
//                                       ),
//                                       child: Text(
//                                         user[1],
//                                         style: TextStyle(
//                                           fontSize: 32,
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xffffecb4),
//                                           backgroundColor: Color(0xffe5771e),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 6,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );

                      // Center(
                      //   child: Material(
                      //     color: Color(0xffe5771e),
                      //     elevation: 10,
                      //     child: ElevatedButton(
                            
                      //       child: InkWell(
                      //         child: Column(
                      //           children: [
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                 color: Colors.transparent,
                      //                 border: Border.all(
                      //                   color: Color(0xffe5771e),
                      //                   width: 3,
                      //                 ),
                      //               ),
                      //               child: Ink.image(
                      //                 image: AssetImage(user[0]),
                      //                 height: 325,
                      //                 width: 325,
                      //                 fit: BoxFit.cover,
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 6,
                      //             ),
                      //             Text(
                      //               user[1],
                      //               style: TextStyle(
                      //                 fontSize: 26,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 6,
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );