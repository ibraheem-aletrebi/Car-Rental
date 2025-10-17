import 'package:car_rental/core/widgets/custom_text_icon_button.dart';
import 'package:flutter/material.dart';

class CustomTwoOptionSelector<T> extends StatefulWidget {
  final String title;
  final T? initialValue;
  final T firstValue;
  final T secondValue;
  final String firstLabel;
  final String secondLabel;
  final IconData firstIcon;
  final IconData secondIcon;
  final ValueChanged<T> onChanged;

  const CustomTwoOptionSelector({
    super.key,
    required this.title,
    required this.initialValue,
    required this.firstValue,
    required this.secondValue,
    required this.firstLabel,
    required this.secondLabel,
    required this.firstIcon,
    required this.secondIcon,
    required this.onChanged,
  });

  @override
  State<CustomTwoOptionSelector<T>> createState() => _CustomTwoOptionSelectorState<T>();
}

class _CustomTwoOptionSelectorState<T> extends State<CustomTwoOptionSelector<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  void _onSelect(T value) {
    setState(() {
      _selectedValue = value;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomTextIconButton(
                text: widget.firstLabel,
                icon: widget.firstIcon,
                isSelected: _selectedValue == widget.firstValue,
                onPressed: () => _onSelect(widget.firstValue),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomTextIconButton(
                text: widget.secondLabel,
                icon: widget.secondIcon,
                isSelected: _selectedValue == widget.secondValue,
                onPressed: () => _onSelect(widget.secondValue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
