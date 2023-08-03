import 'package:animated_markers_map_app/beranda.dart';
import 'package:animated_markers_map_app/screens/CallScreen/components/profile_pic_widget.dart';
import 'package:animated_markers_map_app/utils/sized_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Hallo, \n Anda sedang berbicara dengan Chef Nadia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff00E057),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45),
            // getar dering
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height /
                    3.5, //SizeConfig.heightMultiplier * 30,
                width: 250, //SizeConfig.widthMultiplier * 100,
                child: const ProfilePicWidget(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Chef Nadia Silvia",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 19,
                  color: Color(0xff00E057),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Berdering...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol tutup telpon
                GestureDetector(
                  onTap: () {
                    //Get.back();
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Beranda(),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(4, 8),
                          color: Colors.black26,
                          blurRadius: 8)
                    ], shape: BoxShape.circle, color: Color(0xff00E057)),
                    child: const Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                GestureDetector(
                  onTap: () {
                    //Get.back();
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Beranda(),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(4, 8),
                          color: Colors.black26,
                          blurRadius: 8)
                    ], shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      MdiIcons.foodForkDrink,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 0 * .15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
