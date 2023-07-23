import 'package:blogapp/src/business_logic/blocs/signup_event.dart';
import 'package:blogapp/src/business_logic/blocs/signup_states.dart';
import 'package:blogapp/src/services/repository.dart';
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  Repository _repository = Repository();
  SignUpBloc(SignUpState initialState) : super(initialState);

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async*{
    if (event is OnSignUpEvent){
      yield SignUpLoadingState();
      try {
        var _response = await _repository.userSignUp(event.name, event.email, event.password);
        if (_response['error']){
          yield SignUpFailedState(
            message: _response['status']
          );
        } else {
          yield SignUpSuccessState();
          SharedPrefServices.setInt('id', _response['id']);
          SharedPrefServices.setString('email', event.email);
          SharedPrefServices.setString('api_token', _response['api_token']);
        }
      } catch(_){
        yield SignUpErrorState();
      }
    }
  }

}