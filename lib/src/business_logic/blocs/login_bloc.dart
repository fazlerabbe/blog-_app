import 'package:blogapp/src/business_logic/blocs/login_event.dart';
import 'package:blogapp/src/business_logic/blocs/login_states.dart';
import 'package:blogapp/src/services/repository.dart';
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  Repository _repository = Repository();

  LoginBloc(LoginState initialState) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
    if (event is OnLoginEvent){
      yield LoginLoadingState();
      try {
        var _response = await _repository.userLogin(event.email, event.password);
        if (_response['error']){
          yield LoginFailedState(message: _response['status']);
        } else {
          SharedPrefServices.setInt('id', _response['id']);
          SharedPrefServices.setString('email', event.email);
          SharedPrefServices.setString('api_token', _response['api_token']);
          await Duration(seconds: 3000);
          yield LoginSuccessState();
        }
      } catch(_){
        yield LoginErrorState();
      }
    }
  }


}