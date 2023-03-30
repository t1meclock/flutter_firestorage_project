class MessageStatus {
  String? errorMessage;
  
  get isSuccess => errorMessage == null ? true : false; 

  MessageStatus({this.errorMessage});
}