import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
    final String inputValue;
    final String label;
    final TextInputType inputType;
    final bool isObscureText;
    final Function validator;
    final Function onInputChanged;

    AuthInput({
        this.inputValue,
        this.label,
        this.inputType = TextInputType.text,
        this.isObscureText = false,
        this.validator,
        this.onInputChanged,
    });

    @override
    Widget build(BuildContext context) {
        return TextFormField(
            controller: TextEditingController(
                text: inputValue,
            ),
            decoration: InputDecoration(
                labelText: label,
                filled: true,
                fillColor: Colors.white,
            ),
            keyboardType: inputType,
            obscureText: isObscureText,
            validator: validator,
            onSaved: onInputChanged,
        );
    }
}
