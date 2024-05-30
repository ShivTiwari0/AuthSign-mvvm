import 'package:flutter/material.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';

class BusinessHoursSelector extends StatefulWidget {
  final Function(Map<String, List<String>>) onHoursChanged;

  const BusinessHoursSelector({
    super.key,
    required this.onHoursChanged,
  });

  @override
  _BusinessHoursSelectorState createState() => _BusinessHoursSelectorState();
}

class _BusinessHoursSelectorState extends State<BusinessHoursSelector> {
  final Map<String, List<String>> businessHours = {
    "mon": [],
    "tue": [],
    "wed": [],
    "thu": [],
    "fri": [],
    "sat": [],
    "sun": []
  };

  final List<String> businessTimings = [
    "8:00am - 10:00am",
    "10:00am - 1:00pm",
    "1:00pm - 4:00pm",
    "4:00pm - 7:00pm",
    "7:00pm - 10:00pm"
  ];

  String? selectedDay;
  List<String> selectedTimings = [];

  bool isDaySelected(String day) {
    return selectedDay == day;
  }

  bool isTimingSelected(String timing) {
    return selectedTimings.contains(timing);
  }

  void toggleDaySelection(String day) {
    setState(() {
      if (selectedDay == day) {
        selectedDay = null;
        selectedTimings = [];
      } else {
        selectedDay = day;
        selectedTimings = businessHours[day]!;
      }
    });
  }

  void toggleTimingSelection(String timing) {
    setState(() {
      if (selectedTimings.contains(timing)) {
        selectedTimings.remove(timing);
      } else {
        selectedTimings.add(timing);
      }

      if (selectedDay != null) {
        businessHours[selectedDay!] = List.from(selectedTimings);
        widget.onHoursChanged(businessHours);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Wrap(
          spacing: 5.0,
          children: businessHours.keys.map((day) {
            return ChoiceChip(
              label: Text(day.toUpperCase()),
              selected: isDaySelected(day),
              showCheckmark: false,
              onSelected: (selected) {
                toggleDaySelection(day);
              },
              selectedColor: pred,
              backgroundColor: Colors.grey[300],
              labelStyle: TextStyle(
                color: isDaySelected(day) ? Colors.white : Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: height(context, 0.06)),
        Wrap(
          spacing: 30.0,
          children: businessTimings.map((timing) {
            return ChoiceChip(
              label: Text(timing),
              selected: isTimingSelected(timing),
              showCheckmark: false,
              onSelected: (selected) {
                toggleTimingSelection(timing);
              },
              selectedColor: const Color(0xFFF8C569),
              backgroundColor: Colors.grey[300],
              labelStyle: TextStyle(
                color: isTimingSelected(timing) ? Colors.white : Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
