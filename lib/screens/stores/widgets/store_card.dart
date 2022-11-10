import 'package:flutter/material.dart';
import 'package:scheduling_app/screens/services/services_screen.dart';

class StoreCard extends StatelessWidget {
  const StoreCard(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.phone,
      required this.address})
      : super(key: key);

  final String id;
  final String image;
  final String name;
  final String phone;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServicesScreen(
                  store: name,
                  storeId: id,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                child: Image.network(image, errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
                  return Image.asset('assets/images/nophoto.png',
                      height: 120, fit: BoxFit.contain);
                }, height: 120, fit: BoxFit.fitWidth),
              ),
              ListTile(
                isThreeLine: true,
                title: Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text('$phone \n$address',
                    style: const TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
