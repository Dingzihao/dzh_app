import 'package:dzh_app/model/user_entity.dart';

class LoginRspEntity {
	UserEntity userInfo;
	String message;

	LoginRspEntity({this.userInfo, this.message});

	LoginRspEntity.fromJson(Map<String, dynamic> json) {
		userInfo = json['userInfo'] != null ? new UserEntity.fromJson(json['userInfo']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
		data['message'] = this.message;
		return data;
	}
}

