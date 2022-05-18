import 'package:flutter/material.dart';
import 'package:social_demo_ui/data/data.dart';

import '../models/user_model.dart';

class FollowingUsers extends StatefulWidget {
  const FollowingUsers({Key? key}) : super(key: key);

  @override
  State<FollowingUsers> createState() => _FollowingUsersState();
}

class _FollowingUsersState extends State<FollowingUsers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        SizedBox(
          height: 80.0,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ],
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        )),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(user.profileImageUrl ?? ''),
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
