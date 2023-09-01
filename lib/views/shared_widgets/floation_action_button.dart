import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/style.dart';
import 'list_item_widget_of_floationgactionbutton.dart';

// ignore: must_be_immutable
class FloatingActionButtonWidget extends StatelessWidget {
  FloatingActionButtonWidget(
      {Key? key,
      required this.storeName,
      required this.storeNumber1,
      required this.storeNumber2})
      : super(key: key);
  String storeName;
  String storeNumber1;
  String storeNumber2;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.primaryColor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40.0),
            ),
          ),
          builder: (ctx) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                ListItemWidgetOfFloatingActionButton(
                  title: "اسم الفرع",
                  subTitle: "${storeName}",
                  icon: Icons.work,
                  iconColor: Colors.black54,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 1,
                    decoration: BoxDecoration(
                      color: MyColors.dashColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  onTap: () {
                    launch('tel:${storeNumber1}');
                  },
                  child: const ListItemWidgetOfFloatingActionButton(
                    title: "اتصل بخدمه العملاء 1",
                    subTitle: "إضغط هنا",
                    icon: Icons.phone,
                    iconColor: Colors.black54,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 1,
                    decoration: BoxDecoration(
                      color: MyColors.dashColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                storeNumber2 == ""
                    ? const SizedBox()
                    : InkWell(
                        highlightColor: Colors.transparent,
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        onTap: () {
                          launch('tel:${storeNumber2}');
                        },
                        child: const ListItemWidgetOfFloatingActionButton(
                         title: "اتصل بخدمه العملاء 2",
                          subTitle: "إضغط هنا ",
                          icon: Icons.phone,
                          iconColor: Colors.black54,
                        ),
                      ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 1,
                    decoration: BoxDecoration(
                      color: MyColors.dashColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          },
        );
      },
      child: const Icon(
        Icons.headset_mic_rounded,
        color: MyColors.whiteColor,
      ),
    );
  }
}
