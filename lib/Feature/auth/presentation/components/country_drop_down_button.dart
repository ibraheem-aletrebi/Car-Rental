import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryDropDownButton extends StatefulWidget {
  const CountryDropDownButton({super.key});

  @override
  State<CountryDropDownButton> createState() => _CountryDropDownButtonState();
}

class _CountryDropDownButtonState extends State<CountryDropDownButton> {
  String dropdownValue = 'One';
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: double.infinity,

      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.kWhiteColor),
        elevation: const WidgetStatePropertyAll(0), // shadow
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // rounded menu
            side: BorderSide(color: AppColors.kStokeColor, width: 2), // border
          ),
        ),
        maximumSize: const WidgetStatePropertyAll(
          Size(double.infinity, 250),
        ), // max height
        alignment: Alignment.bottomCenter, // align popup
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.kWhiteColor,
        prefixIconConstraints: BoxConstraints(minWidth: 22, minHeight: 40),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        border: buidBorder(),
        enabledBorder: buidBorder(),
        focusedBorder: buidBorder(),
      ),
      leadingIcon: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0), // customize here
        child: Icon(Icons.public, color: AppColors.kSecondaryColor),
      ),

      hintText: 'Country',
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          leadingIcon: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ), // customize here
            child: SvgPicture.asset(Assets.imagesFlag),
          ),
        );
      }).toList(),
    );
  }

  OutlineInputBorder buidBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), // rounded border
      borderSide: BorderSide(color: color ?? AppColors.kStokeColor, width: 2),
    );
  }
}
