import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/image.svg",
            color: Colors.blue,
          ),
          // Image.asset("assets/images/asyncof2023.png"),
          const Text(
            "Asyncof 2023",
            style: TextStyle(
              fontSize: 42,
              fontFamily: "Poppins",
            ),
          ),
          const Text(
            "Salon virtuel de l'information. Du 05 au 29 août 2023",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          // ElevatedButton.icon(
          //   style: const ButtonStyle(
          //       padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
          //       backgroundColor: MaterialStatePropertyAll(Colors.green)),
          //   // ignore: avoid_print
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         PageRouteBuilder(
          //             pageBuilder: (
          //           _,
          //           __,
          //           ___,
          //         ) =>
          //                 const EventPage()));
          //   },
          //   label: const Text(
          //     "Afficher le planning",
          //     style: TextStyle(fontSize: 18),
          //   ),
          //   icon: const Icon(Icons.calendar_month),
          // ),
        ],
      ),
      // child: Text(
      //   "Asyncof 2023",
      //   style: TextStyle(
      //     fontSize: 42,
      //   ),
      // ),
    );
  }
}
