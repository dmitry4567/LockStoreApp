import 'package:bloc/bloc.dart';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/main.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginAuth>((event, emit) async {
      // emit(const LoginInitial());
      // ApiCallResponse login = await SignInCall.call(
      //   email: event.email,
      //   password: event.password,
      // );

      // if (login.statusCode == 201) {
      //   ffAppState.userAuthToken =
      //       getJsonField(login.jsonBody ?? '', r'''$.token''');
      //   emit(const LoginPass());
      // } else {
      //   emit(LoginError(
      //       getJsonField(login.jsonBody ?? '', r'''$.error''').toString()));
      // }

      emit(const LoginInitial());
      final response =
          await http.post(Uri.parse("$baseUrl/auth/login"), headers: {
        "Access-Control-Allow-Origin": "*",
        // 'Content-Type': 'application/json',
        'Accept': '*/*'
      }, body: {
        "email": event.email,
        "password": event.password,
      });

      if (response.statusCode == 201) {
        ffAppState.userAuthToken = jsonDecode(response.body)['token'];
        emit(const LoginPass());
      } else {
        emit(
            LoginError(getJsonField(response.body, r'''$.error''').toString()));
      }
    });
  }
}
