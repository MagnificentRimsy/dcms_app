
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up.freezed.dart';
part 'sign_up.g.dart';


@freezed
class SignupRequest with _$SignupRequest {
  const factory SignupRequest({
    required String password,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'userName') required String userName,
    @JsonKey(name: 'phoneNo') required String phoneNo,
    @JsonKey(name: 'userType') required String userType,
    @JsonKey(name: 'pcDomainName')required String pcDomainName,
    @JsonKey(name: 'pcIpAddress')required String pcIpAddress,
    @JsonKey(name: 'pcName')required String pcName,
    @JsonKey(name: 'pcUserName')required String pcUserName,

  }) = _SignupRequest;
  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);
}
