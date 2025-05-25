class ApiResponse<T> {
  final T? data;
  final String? error;
  final bool isLoading;

  ApiResponse.loading() : data = null, error = null, isLoading = true;
  ApiResponse.success(this.data) : error = null, isLoading = false;
  ApiResponse.error(this.error) : data = null, isLoading = false;
}
