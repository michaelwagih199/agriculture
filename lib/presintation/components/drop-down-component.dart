import 'package:flutter/material.dart';

class GovernoratesDropDownMenu extends StatelessWidget {

  const GovernoratesDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {

    String dropdownvalue = 'المحافظات';

    var governorates = [

      'المحافظات',
      ' القاهرة',
      'الجيزة',
      'الأسكندرية',
      'الدقهلية',
      ' الشرقية',
      ' المنوفية',
      'القليوبية',
      ' الغربية',
      'بور سعيد',
      'دمياط',
      'الإسماعلية',
      'السويس',
      'دمياط',
      'كفر الشيخ',
      'الفيوم',
      'بني سويف ',
      'مطروح',
      'شمال سيناء',
      'جنوب سيناء',
      'المنيا',
      'أسيوط',
      'سوهاج',
      'قنا',
      'البحر الأحمر',
      'الأقصر',
      'أسوان',
      'الواحات',
      'الوادي الجديد'

    ];

    return Container(
      child: DropdownButton(
        value: dropdownvalue,
        items: governorates.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {

        },
      ),
    );
  }
}
