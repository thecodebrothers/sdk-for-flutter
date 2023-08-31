part of appwrite;

/// The Functions Service allows you view, create and manage your Cloud
/// Functions.
class Functions extends Service {
    /// Initializes a [Functions] service
    Functions(super.client);

    /// List Executions
    ///
    /// Get a list of all the current user function execution logs. You can use the
    /// query params to filter your results.
    Future<models.ExecutionList> listExecutions({required String functionId, List<String>? queries, String? search}) async {
        final String apiPath = '/functions/{functionId}/executions'.replaceAll('{functionId}', functionId);

        final Map<String, dynamic> params = {
            'queries': queries,
            'search': search,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.get, path: apiPath, params: params, headers: headers);

        return models.ExecutionList.fromMap(res.data);

    }

    /// Create Execution
    ///
    /// Trigger a function execution. The returned object will return you the
    /// current execution status. You can ping the `Get Execution` endpoint to get
    /// updates on the current execution status. Once this endpoint is called, your
    /// function execution process will start asynchronously.
    Future<models.Execution> createExecution({required String functionId, String? body, bool? xasync, String? path, String? method, Map? headers}) async {
        final String apiPath = '/functions/{functionId}/executions'.replaceAll('{functionId}', functionId);

        final Map<String, dynamic> params = {
            'body': body,
            'async': xasync,
            'path': path,
            'method': method,
            'headers': headers,
        };

        final Map<String, String> apiHeaders = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: apiPath, params: params, headers: apiHeaders);

        return models.Execution.fromMap(res.data);

    }

    /// Get Execution
    ///
    /// Get a function execution log by its unique ID.
    Future<models.Execution> getExecution({required String functionId, required String executionId}) async {
        final String apiPath = '/functions/{functionId}/executions/{executionId}'.replaceAll('{functionId}', functionId).replaceAll('{executionId}', executionId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.get, path: apiPath, params: params, headers: headers);

        return models.Execution.fromMap(res.data);

    }
}
