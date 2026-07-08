import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Color? fillColor;
  final Color? styleColor;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final bool isSuccess;
  // Flutter-ning standart validator funksiyasi qo'shildi
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.isSuccess = false,
    this.validator,
    this.controller,
    this.fillColor,
    this.styleColor,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Parol holatini boshqarish uchun ichki o'zgaruvchi
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = Colors.green;
    final successColor = Colors.green;
    final errorColor = Colors.red;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
        ],

        TextFormField(
          controller: widget.controller,
          obscureText: _isObscure,
          validator: widget.validator, // Validatsiya shu yerda ulanadi
          style:TextStyle(color:widget.styleColor,),
          cursorColor: widget.isSuccess ? successColor : activeColor,

          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: widget.fillColor,

    
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : widget.isSuccess
                ? Icon(Icons.check_circle_outline, color: successColor)
                : null, 

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: widget.isSuccess ? successColor : Colors.grey[700]!,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: widget.isSuccess ? successColor : activeColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: errorColor, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: errorColor, width: 1.5),
            ),
            errorStyle: TextStyle(color: errorColor),
          ),
        ),

        if (widget.isSuccess) ...[
          const SizedBox(height: 6),
          Text(
            "Muvaffaqiyatli bajarildi",
            style: TextStyle(color: successColor, fontSize: 12),
          ),
        ],
      ],
    );
  }
}
