import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class CallMobile extends StatelessWidget {
  const CallMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      color: const Color(0xffF2F8FF),
      height: 384,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Мы Вам перезвоним",
            style: TextStyle(
              color: Color(0xff161C24),
              fontSize: 22,
              fontFamily: "SF",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Если у вас возникли какие-то вопросы или\nпроблемы, заполните форму и мы Вам\nперезвоним.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff454F5B),
              fontSize: 14,
              fontFamily: "SF",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Ваше имя',
                    hintStyle: TextStyle(
                      color: const Color(0xff252B37).withOpacity(0.2),
                      fontSize: 16,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff4295E4),
                        width: 1,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF14343),
                        width: 1,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(0xff161C24).withOpacity(0.04),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
                  ),
                  style: const TextStyle(
                    fontFamily: 'SF',
                    color: Color(0xFF454F5B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Ваш Email',
                    hintStyle: TextStyle(
                      color: const Color(0xff252B37).withOpacity(0.2),
                      fontSize: 16,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff4295E4),
                        width: 1,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF14343),
                        width: 1,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(0xff161C24).withOpacity(0.04),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
                  ),
                  style: const TextStyle(
                    fontFamily: 'SF',
                    color: Color(0xFF454F5B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                child: FFButtonWidget(
                  onPressed: () async {},
                  text: 'Отправить',
                  options: const FFButtonOptions(
                    color: Color(0xff4295E4),
                    elevation: 0,
                    textStyle: TextStyle(
                      fontFamily: 'SF',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
