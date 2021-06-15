import 'package:json_annotation/json_annotation.dart';

part 'kopo_model.g.dart';

@JsonSerializable()
class KopoModel {
  final String postcode;
  final String postcode1;
  final String postcode2;
  final String postcodeSeq;
  // 13494	국가기초구역번호. 2015년 8월 1일부터 시행될 새 우편번호.
  final String zonecode;
  // 경기 성남시 분당구 판교역로 235	기본 주소 (검색 결과에서 첫줄에 나오는 주소, 검색어의 타입(지번/도로명)에 따라 달라집니다.)
  final String address;
  // 235 Pangyoyeok-ro, Bundang-gu, Seongnam-si, Gyeonggi-do, korea	기본 영문 주소
  final String addressEnglish;
  final String addressType;
  final String bcode;
  final String bname;
  final String bname1;
  final String bname2;
  final String sido;
  final String sigungu;
  final String sigunguCode;
  final String userLanguageType;
  final String query;
  final String buildingName;
  final String buildingCode;
  final String apartment;
  final String jibunAddress;
  final String jibunAddressEnglish;
  final String roadAddress;
  final String roadAddressEnglish;
  final String autoRoadAddress;
  final String autoRoadAddressEnglish;
  final String autoJibunAddress;
  final String autoJibunAddressEnglish;
  final String userSelectedType;
  final String noSelected;
  final String hname;
  final String roadnameCode;
  final String roadname;

  const KopoModel(
      {required this.postcode,
      required this.postcode1,
      required this.postcode2,
      required this.postcodeSeq,
      required this.zonecode,
      required this.address,
      required this.addressEnglish,
      required this.addressType,
      required this.bcode,
      required this.bname,
      required this.bname1,
      required this.bname2,
      required this.sido,
      required this.sigungu,
      required this.sigunguCode,
      required this.userLanguageType,
      required this.query,
      required this.buildingName,
      required this.buildingCode,
      required this.apartment,
      required this.jibunAddress,
      required this.jibunAddressEnglish,
      required this.roadAddress,
      required this.roadAddressEnglish,
      required this.autoRoadAddress,
      required this.autoRoadAddressEnglish,
      required this.autoJibunAddress,
      required this.autoJibunAddressEnglish,
      required this.userSelectedType,
      required this.noSelected,
      required this.hname,
      required this.roadnameCode,
      required this.roadname});

  factory KopoModel.fromJson(Map<String, dynamic> json) =>
      _$KopoModelFromJson(json);

  Map<String, dynamic> toJson() => _$KopoModelToJson(this);
}
