abstract class LoginEvent{}

class LoginNormal extends LoginEvent{
 final String email;
 final String password;

 LoginNormal(this.email, this.password);
}

class LoginFacebook extends LoginEvent{}

class LoginGoogle extends LoginEvent{}
