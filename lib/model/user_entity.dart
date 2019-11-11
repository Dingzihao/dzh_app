class UserEntity {
	String clientId;
	String companyType;
	int approvalState;
	String pic;
	String userName;
	int userId;
	String realName;
	int lastLoginTime;
	String picUrl;
	String rejectReason;
	String mobilephone;
	String idcard;
	String company;
	String email;

	UserEntity({this.clientId, this.companyType, this.approvalState, this.pic, this.userName, this.userId, this.realName, this.lastLoginTime, this.picUrl, this.rejectReason, this.mobilephone, this.idcard, this.company, this.email});

	UserEntity.fromJson(Map<String, dynamic> json) {
		clientId = json['clientId'];
		companyType = json['companyType'];
		approvalState = json['approvalState'];
		pic = json['pic'];
		userName = json['userName'];
		userId = json['userId'];
		realName = json['realName'];
		lastLoginTime = json['lastLoginTime'];
		picUrl = json['picUrl'];
		rejectReason = json['rejectReason'];
		mobilephone = json['mobilephone'];
		idcard = json['idcard'];
		company = json['company'];
		email = json['email'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['clientId'] = this.clientId;
		data['companyType'] = this.companyType;
		data['approvalState'] = this.approvalState;
		data['pic'] = this.pic;
		data['userName'] = this.userName;
		data['userId'] = this.userId;
		data['realName'] = this.realName;
		data['lastLoginTime'] = this.lastLoginTime;
		data['picUrl'] = this.picUrl;
		data['rejectReason'] = this.rejectReason;
		data['mobilephone'] = this.mobilephone;
		data['idcard'] = this.idcard;
		data['company'] = this.company;
		data['email'] = this.email;
		return data;
	}
}
