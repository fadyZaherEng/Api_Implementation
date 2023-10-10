// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_encashment_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LeaveEncashmentApiService implements LeaveEncashmentApiService {
  _LeaveEncashmentApiService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<TalentLinkResponse<List<RemoteLeaveEncashmentTypes>>>>
      leaveEncashmentTypes(TalentLinkHrRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<TalentLinkResponse<List<RemoteLeaveEncashmentTypes>>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/RequestsList/GetLeaveEncashmentTypeList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = TalentLinkResponse<List<RemoteLeaveEncashmentTypes>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteLeaveEncashmentTypes>((i) =>
                  RemoteLeaveEncashmentTypes.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<TalentLinkResponse<dynamic>>> insertLeaveEncashment(
    String requestBody,
    List<MultipartFile> file,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'requestbody',
      requestBody,
    ));
    _data.files.addAll(file.map((i) => MapEntry('Files', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TalentLinkResponse<dynamic>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Mobile/RequestsList/InsertLeaveEncashment',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = TalentLinkResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<
          HttpResponse<
              TalentLinkResponse<
                  List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>>>
      getEmployeePolicyProfileLeaveEncashmentDetails(
          TalentLinkHrRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<
                TalentLinkResponse<
                    List<
                        RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/MyRequests/GetEmployeePolicyProfileLeaveEncashmentDetails',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = TalentLinkResponse<
        List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>((i) =>
                  RemoteGetEmployeePolicyProfileLeaveEncashmentDetails.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<TalentLinkResponse<RemoteCalculateInCaseLeaveEncashment>>>
      calculateInCaseLeaveEncashment(
          TalentLinkHrRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<
            TalentLinkResponse<RemoteCalculateInCaseLeaveEncashment>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/MyRequests/CalculateInCaseLeaveEncashment',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        TalentLinkResponse<RemoteCalculateInCaseLeaveEncashment>.fromJson(
      _result.data!,
      (json) => RemoteCalculateInCaseLeaveEncashment.fromJson(
          json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
