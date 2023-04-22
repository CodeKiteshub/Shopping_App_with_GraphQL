class initiateUserRegistration__app {
    String temporaryUserId;
    

    initiateUserRegistration__app({required this.temporaryUserId});

    factory initiateUserRegistration__app.fromJson(Map<String, dynamic> json) {
        return initiateUserRegistration__app(
            temporaryUserId: json['temporaryUserId'], 
           
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['temporaryUserId'] = this.temporaryUserId;
       
        return data;
    }
}