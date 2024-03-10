import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/common_widgets/toast_widget.dart';
import 'package:flutterspod/constants/app_sizes.dart';
import 'package:flutterspod/provider/auth_provider.dart';
import 'package:flutterspod/shared/other_provider.dart';
import 'package:flutterspod/views/auth/sign_up_page.dart';
import 'package:flutterspod/views/main/home_page.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';






class LoginPage extends ConsumerStatefulWidget{
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();



  void dispose1(){
    ref.listenManual(authProvider, (previous, next) { }).close();
  }



  @override
  Widget build(BuildContext context) {

    final auth = ref.watch(authProvider);
  ref.listen(authProvider, (previous, next) {
      if(next.isError && !next.isLoading){
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('healksjdlskajsdasadlkj')));
         Toasts.showError(message: next.errMsg);
      }else if(next.isSuccess){
        Get.offAll(() => HomePage());
        Toasts.showSuccess(message: 'successfully login');
      }
    });


    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
             key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  _buildFormBuilderTextField(label: 'Email', name: 'email', isEmail: true,),
                  AppSizes.gapH10,
                  AppSizes.gapH10,
                  _buildFormBuilderTextField(label: 'Password', name: 'password', isPassword: true, isLast: true),
                 AppSizes.gapH10,
                 AppSizes.gapH10,
                 AppSizes.gapH10,
                  ElevatedButton(
                        onPressed: auth.isLoading ? null : () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
                            ref.read(authProvider.notifier).userLogin(
                                data: _formKey.currentState!.value);
                          } else {
                            ref.read(modeProvider.notifier).change();
                          }
                        },
                        child: auth.isLoading ? Center(
                            child: CircularProgressIndicator()) : const Text('Login'),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account'),
                      TextButton(onPressed: (){
                        dispose1();
                        Get.off(() => SignUpPage(), transition: Transition.leftToRight);
                      }, child: Text('Sign Up'))
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  Consumer _buildFormBuilderTextField({
     bool? isEmail,
     bool? isPassword,
    required String name,
    required String label,
    bool? isLast,
   }) {
    return Consumer(
      builder: (c, ref, child) {
        final mode = ref.watch(modeProvider);
        final toggle = ref.watch(toggleProvider);
        return FormBuilderTextField(
          textInputAction: isLast == null ? TextInputAction.next: TextInputAction.done,
          name: name,
         autovalidateMode: mode,
         obscureText: isPassword !=null ? toggle ? false: true  : false,
          decoration:  InputDecoration(
            labelText: label,
            suffixIcon: isPassword !=null ? IconButton(onPressed: (){
              ref.read(toggleProvider.notifier).change();
            }, icon: Icon(toggle ? Icons.check: Icons.close)) : null,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          if(isEmail !=null)  FormBuilderValidators.email(),
          ]),
        );
      }
    );
  }
}


