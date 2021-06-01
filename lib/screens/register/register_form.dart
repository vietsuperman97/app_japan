// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing_machine/bloc/blocs.dart';
import 'package:washing_machine/widgets/widgets.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:formz/formz.dart';

class WidgetRegisterForm extends StatefulWidget {
  @override
  _WidgetRegisterFormState createState() => _WidgetRegisterFormState();
}

class _WidgetRegisterFormState extends State<WidgetRegisterForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  String email = '';

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  late final blocRegister;

  @override
  void initState() {
    for(int index=1; index <= 100; index++){
      listAge.add(index.toString());
    }
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MESSAGES.MAIL_ADDRESS, style: AppStyle.DEFAULT_MEDIUM.copyWith(fontSize: 19, color: COLORS.TEXT_COLOR),),
            AppValue.vSpaceTiny,
            _buildTextFieldEmail(),
            AppValue.vSpaceTiny,
            Text(MESSAGES.PASSWORD, style: AppStyle.DEFAULT_MEDIUM.copyWith(fontSize: 19, color: COLORS.TEXT_COLOR),),
            AppValue.vSpaceTiny,
            _buildTextFieldPassword(),
            AppValue.vSpaceTiny,
            Text(MESSAGES.CONFIRM_PASSWORD, style: AppStyle.DEFAULT_MEDIUM.copyWith(fontSize: 19, color: COLORS.TEXT_COLOR),),
            AppValue.vSpaceTiny,
            _buildTextFieldConfirmPassword(),
            AppValue.vSpaceSmall,
            Text(MESSAGES.GENDER, style: AppStyle.DEFAULT_MEDIUM.copyWith(fontSize: 19, color: COLORS.TEXT_COLOR),),
            WidgetCheckGender(),
            AppValue.vSpaceSmall,
            Text(MESSAGES.AREA_SELECTION, style: AppStyle.DEFAULT_MEDIUM.copyWith(fontSize: 19, color: COLORS.TEXT_COLOR),),
            AppValue.vSpaceTiny,
            WidgetAreaSelect(
              item: listCity,
            ),
            AppValue.vSpaceSmall,
            Text(MESSAGES.AGE, style: AppStyle.DEFAULT_MEDIUM.copyWith(fontSize: 19, color: COLORS.TEXT_COLOR),),
            AppValue.vSpaceTiny,
            WidgetAreaSelect(
              item: listAge,
            ),
            AppValue.vSpaceSmall,
            _buildButtonRegister(),
          ],
        ),
      ),
    );
  }
  List<String> listCity = ['東京', '大阪', '広島', '京都', '札幌', '名古屋'];
  List<String> listAge = [];


  _buildButtonRegister() {
    return WidgetButton(
      onTap: () => null,
      enable: true,
      text: MESSAGES.REGISTER,
    );
  }

  _buildTextFieldEmail() {
    return WidgetInput(
      inputType: TextInputType.emailAddress,
      focusNode: _emailFocusNode,
      onChanged: (value) => null,
      hint: MESSAGES.MAIL_ADDRESS,
    );
  }


  _buildTextFieldPassword() {
    return WidgetInput(
      onChanged: (value) => null,
      hint: MESSAGES.PASSWORD_HINT,
      obscureText: obscurePassword,
      focusNode: _passwordFocusNode,
      endIcon: Button(
        onTap: () => setState(() => obscurePassword = !obscurePassword),
        child: Icon(
            obscurePassword
                ? CommunityMaterialIcons.eye_outline
                : CommunityMaterialIcons.eye_off_outline,
            color: COLORS.PRIMARY_COLOR,
            size: 20
        ),
      ),
    );
  }

  _buildTextFieldConfirmPassword() {
    return WidgetInput(
      onChanged: (value) => null,
      hint: MESSAGES.PASSWORD_HINT,
      obscureText: obscureConfirmPassword,
      focusNode: _confirmPasswordFocusNode,
      endIcon: Button(
        onTap: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
        child: Icon(
            obscureConfirmPassword
                ? CommunityMaterialIcons.eye_outline
                : CommunityMaterialIcons.eye_off_outline,
            color: COLORS.PRIMARY_COLOR,
            size: 20
        ),

      ),
    );
  }
}
