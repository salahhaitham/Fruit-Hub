abstract class Failure{
  String errormessage;

  Failure(this.errormessage);
}

class Serverfailure extends Failure{
  Serverfailure(super.errormessage);


}