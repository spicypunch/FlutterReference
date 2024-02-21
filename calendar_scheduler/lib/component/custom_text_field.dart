import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  // true - 시간, false - 텍스트
  final bool isTime;

  const CustomTextField({required this.label, required this.isTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w600),
        ),
        if (isTime) renderTextField(),
        if (!isTime) Expanded(child: renderTextField())
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      // null이 return 되면 에러가 없다.
      // 에러가 있으면 에러를 string 값으로 리턴해준다.
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력해주세요';
        }

        if (isTime) {
          int time = int.parse(val);

          if (time < 0) {
            return '0 이상의 숫자를 입력해주세요.';
          }

          if (time > 24) {
            return '24 이하의 숫자를 입력해주세요.';
          }
        } else {

        }

        return null;
      },
      cursorColor: Colors.grey,
      maxLines: isTime ? 1 : null,
      expands: !isTime,
      // maxLength: 500,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
