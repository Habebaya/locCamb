import 'package:flutter/material.dart';
import 'package:loccamb/module/home/domian/entities/user.dart';
class UserTile extends StatelessWidget {
  User user;
   UserTile({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueGrey,
          backgroundImage: AssetImage('assets/image/avatar.jpeg'),// Image radius

        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name,style: const TextStyle(
                color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700
            ),),
            Text(user.email,style: const TextStyle(
                color: Colors.grey,fontSize: 10
            ),),

          ],
        ),
      ],
    );
  }
}
