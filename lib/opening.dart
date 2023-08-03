import 'package:animated_markers_map_app/beranda.dart';
import 'package:flutter/material.dart';

class Opening extends StatelessWidget {
  const Opening({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Opening.jpg"), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // RichText(
            //   text: TextSpan(
            //     style: Theme.of(context).textTheme.headline3,
            //     children: const [
            //       TextSpan(
            //         text: "- Welcome to -",
            //         style: TextStyle(
            //           color: Colors.cyan,
            //           fontSize: 24,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 5.0),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: const [
                  TextSpan(
                      text: "markers",
                      style: TextStyle(color: Color(0xff00E057))),
                  TextSpan(
                    text: "Map.",
                    style: TextStyle(
                        color: Color(0xff00E057), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Beranda(),
                    ),
                  );
                },
                child: TombolMasuk(
                  text: "Klik",
                  ukuranFont: 24,
                  verticalPadding: 14,
                  tekan: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TombolMasuk extends StatelessWidget {
  final String text;
  final Function tekan;
  final double verticalPadding;
  final double ukuranFont;

  const TombolMasuk({
    key,
    this.text,
    this.tekan,
    this.verticalPadding = 16,
    this.ukuranFont = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 15),
              blurRadius: 30,
              color: const Color(0xff00E057).withOpacity(.84)),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ukuranFont,
          fontWeight: FontWeight.bold,
          color: Color(0xff00E057),
        ),
      ),
    );
  }
}
