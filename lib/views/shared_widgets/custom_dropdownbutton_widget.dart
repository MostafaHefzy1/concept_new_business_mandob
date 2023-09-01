// ToDo Custom DropDownButton

import 'package:flutter/material.dart';

import '../../utils/style.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    Key? key,
    required this.initialValue,
    required this.itemList,
    required this.onChange,
  }) : super(key: key);

  String initialValue;
  List<String> itemList;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          color: MyColors.whiteColor,
          border: Border.all(color: MyColors.primaryColor, width: 1.5)),
      padding: const EdgeInsets.only(
        right: 40,
        left: 40,
      ),
      width: double.infinity,
      child: DropdownButton(
          value: initialValue,
          isExpanded: true,
          iconSize: 30,
          dropdownColor: MyColors.whiteColor,
          items: itemList
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ))
              .toList(),
          underline: const SizedBox(),
          onChanged: (String? value) {
            onChange(value);
          }),
    );
  }
}
