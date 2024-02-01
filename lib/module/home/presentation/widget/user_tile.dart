import 'package:flutter/material.dart';
import 'package:loccamb/module/home/domian/entities/user.dart';
import 'package:map_launcher/map_launcher.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueGrey,
              backgroundImage:
                  AssetImage('assets/image/avatar.jpeg'), // Image radius
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    user.email,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          onPressed: () async {
                            final availableMaps =
                                await MapLauncher.installedMaps;
                            print(
                                availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                            await availableMaps.first.showMarker(
                              coords: Coords(
                                  double.parse(user.addressModel.geoModel.lat),
                                  double.parse(
                                      user.addressModel.geoModel.long)),
                              title: "you are here",
                            );
                          },
                          icon: const Icon(Icons.map)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
