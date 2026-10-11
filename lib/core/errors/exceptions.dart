

abstract class TaskException implements Exception {
  final String message;

  const TaskException(this.message);
}

class TaskNotFoundException extends TaskException {
  const TaskNotFoundException()
      : super('المهمة غير موجودة');
}

class TaskAlreadyExistsException extends TaskException {
  const TaskAlreadyExistsException()
      : super('المهمة موجودة مسبقاً');
}



class TaskStorageException extends TaskException {
  final Object originalError;

  const TaskStorageException(this.originalError)
      : super('حدث خطأ أثناء التعامل مع التخزين المحلي');
}