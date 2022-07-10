/*
Api Response  Takes a generic  [T]  which is an Instace of the data returned by the api 
If there is an error from the api ,there [T] is null and return hasError as [True] and a [List]
of Errors
*/

class ApiResponse<T> {
  // ignore: avoid_positional_boolean_parameters
  ApiResponse(this.data, this.hasError, this.errorMessage);
  final T data;
  final bool hasError;
  final List errorMessage; //can be string or List depending
}
