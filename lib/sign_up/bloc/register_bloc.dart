import 'package:bloc/bloc.dart';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/main.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial()) {
    on<RegisterAuth>((event, emit) async {
      // emit(const RegisterInitial());
      // ApiCallResponse register = await SignUpCall.call(
      //   email: event.email,
      //   password: event.password,
      // );

      // if (register.statusCode == 200) {
      //   print(register.jsonBody);
      //   ffAppState.userAuthToken =
      //       getJsonField(register.jsonBody ?? '', r'''$.token''');
      //   emit(const RegisterPass());
      // } else {
      //   emit(RegisterError(
      //       getJsonField(register.jsonBody ?? '', r'''$.error''').toString()));
      // }

      emit(const RegisterInitial());
      final response =
          await http.post(Uri.parse("$baseUrl/auth/register"), headers: {
        "Access-Control-Allow-Origin": "*",
        // 'Content-Type': 'application/json',
        'Accept': '*/*'
      }, body: {
        "email": event.email,
        "password": event.password,
      });

      if (response.statusCode == 201) {
        ffAppState.userAuthToken = jsonDecode(response.body)['token'];
        emit(const RegisterPass());
      } else {
        emit(RegisterError(jsonDecode(response.body)['message'][0]));
      }
    });
  }
}
