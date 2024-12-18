import 'package:animate_do/animate_do.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:click_to_food/services/utils/utils.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_themes/app_colors.dart';
import '../../../../core/reusable_widgets/buttons/primary_button_single_icon.dart';
import '../../../../core/reusable_widgets/input_fields/custom_password_field.dart';
import '../../../../core/reusable_widgets/input_fields/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen(
      {super.key, required this.userEmail, required this.userotp});
  final String userEmail;
  final String userotp;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _registrationForm = GlobalKey<FormState>();
  bool isObscure = true;

  final countryPicker =
      const FlCountryCodePicker(); // Initialize the country picker
  CountryCode? _selectedCountry; // Holds the selected country
  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Utils.hideKeyboard();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _registrationForm,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Information",
                    style: TStyle.title(color: AppColor.titleTextColor),
                  ),

                  Text(
                    'Please provide us your information to continue',
                    style: TStyle.subTitle2(color: AppColor.subTitleColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: CustomTextField(
                      controller: _fullNameController,
                      type: TextInputType.text,
                      labelText: 'Type your full name',
                      hintText: 'Name',
                      onChanged: (String value) {},
                      preIcon: Icons.person,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: CustomTextField(
                      controller: _emailController,
                      type: TextInputType.text,
                      labelText: widget.userEmail,
                      hintText: 'example@mail.com',
                      onChanged: (String value) {},
                      preIcon: Icons.email_outlined,
                    ),
                  ),

                  ///phone number section===============
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Enter phone number',
                        hintStyle: TextStyle(
                          color: AppColor.subTitleColor,
                        ),
                        prefixIcon: GestureDetector(
                          onTap: () async {
                            // Open the country picker dialog
                            final country = await countryPicker.showPicker(
                                context: context);
                            if (country != null) {
                              setState(() {
                                _selectedCountry = country;
                              });
                            }
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_selectedCountry != null) ...[
                                  Text(
                                    _selectedCountry!
                                        .dialCode, // Display country code
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.titleTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ] else
                                  const Text(
                                    '+',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: CustomPasswordField(
                      controller: _passwordController,
                      labelText: 'Type your password',
                      hintText: 'password',
                      onChanged: (String value) {},
                      isObscure: isObscure,
                      suffixIcon:
                          isObscure ? Icons.visibility_off : Icons.visibility,
                      textInputAction: TextInputAction.done,
                      press: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: CustomPasswordField(
                      controller: _passwordController,
                      labelText: 'Confirm password',
                      hintText: 'Confirm password',
                      onChanged: (String value) {},
                      isObscure: isObscure,
                      suffixIcon:
                          isObscure ? Icons.visibility_off : Icons.visibility,
                      textInputAction: TextInputAction.done,
                      press: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),

                  SizedBox(
                    height: sHeight * .4,
                  ),

                  primaryButtonSingleIcon(
                      width: sWidth,
                      backgroundColor: AppColor.primaryButtonColor,
                      press: () {},
                      buttonName: 'Continue',
                      postFixIcon: 'assets/icons/mail-01.svg'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Shows the Country Code Picker dialog
}
