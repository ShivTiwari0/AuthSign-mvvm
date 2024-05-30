import 'package:flutter/material.dart';
import 'package:softlab_project/utils/colors.dart';

class CustomDropdownField extends StatefulWidget {
  final List<String> items;
  final IconData icon;
  final String hintText;
  final String? selectedItem;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownField({
    Key? key,
    required this.items,
    required this.icon,
    required this.hintText,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedState;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      padding: const EdgeInsets.only(right: 10, top: 5, left: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey[200],
      ),
      child: DropdownButtonFormField<String>(
        value: widget.selectedItem,
        isExpanded: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        items: widget.items.map((
          String item,
        ) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item,
                style: const TextStyle(
                    color: blackColor, overflow: TextOverflow.ellipsis)),
          );
        }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
