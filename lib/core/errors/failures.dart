abstract class Failure {
  final String message;

  const Failure(this.message);
}
 class TaskNotFoundFailure extends Failure{
  TaskNotFoundFailure(super.message);

 }
 class TaskAlreadyExistsFailure extends Failure{
  TaskAlreadyExistsFailure(super.message);
}