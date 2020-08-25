

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.token,
        this.expires,
        this.user,
        this.menu,
        this.exam,
    });

    String token;
    int expires;
    User user;
    List<Menu> menu;
    List<Exam> exam;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        expires: json["expires"],
        user: User.fromJson(json["user"]),
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
        exam: List<Exam>.from(json["exam"].map((x) => Exam.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires,
        "user": user.toJson(),
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
        "exam": List<dynamic>.from(exam.map((x) => x.toJson())),
    };
}

class Exam {
    Exam({
        this.id,
        this.code,
        this.title,
        this.shortTitle,
        this.degreeCode,
        this.degreeGroupCode,
        this.courseCode,
        this.duration,
        this.oldCode,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String code;
    String title;
    String shortTitle;
    String degreeCode;
    dynamic degreeGroupCode;
    dynamic courseCode;
    String duration;
    dynamic oldCode;
    String status;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    DateTime createdAt;
    DateTime updatedAt;

    factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["id"],
        code: json["code"],
        title: json["title"],
        shortTitle: json["short_title"],
        degreeCode: json["degree_code"],
        degreeGroupCode: json["degree_group_code"],
        courseCode: json["course_code"],
        duration: json["duration"],
        oldCode: json["old_code"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "title": title,
        "short_title": shortTitle,
        "degree_code": degreeCode,
        "degree_group_code": degreeGroupCode,
        "course_code": courseCode,
        "duration": duration,
        "old_code": oldCode,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Menu {
    Menu({
        this.name,
        this.link,
        this.icon,
        this.slNo,
        this.children,
    });

    String name;
    String link;
    Icon icon;
    String slNo;
    List<Menu> children;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        name: json["name"],
        link: json["link"] == null ? null : json["link"],
        icon: iconValues.map[json["icon"]],
        slNo: json["sl_no"],
        children: json["children"] == null ? null : List<Menu>.from(json["children"].map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "link": link == null ? null : link,
        "icon": iconValues.reverse[icon],
        "sl_no": slNo,
        "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
    };
}

enum Icon { SUPERVISOR_ACCOUNT, LIST, DASHBOARD, LIST_ALT }

final iconValues = EnumValues({
    "dashboard": Icon.DASHBOARD,
    "list": Icon.LIST,
    "list_alt": Icon.LIST_ALT,
    "supervisor_account": Icon.SUPERVISOR_ACCOUNT
});

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.userType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.username,
        this.type,
        this.examInitiates,
        this.examiner,
    });

    int id;
    String name;
    String email;
    DateTime emailVerifiedAt;
    String userType;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String username;
    String type;
    List<ExamInitiate> examInitiates;
    Examiner examiner;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        userType: json["user_type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        username: json["username"],
        type: json["type"],
        examInitiates: List<ExamInitiate>.from(json["exam_initiates"].map((x) => ExamInitiate.fromJson(x))),
        examiner: Examiner.fromJson(json["examiner"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "user_type": userType,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "username": username,
        "type": type,
        "exam_initiates": List<dynamic>.from(examInitiates.map((x) => x.toJson())),
        "examiner": examiner.toJson(),
    };
}

class ExamInitiate {
    ExamInitiate({
        this.id,
        this.examCode,
        this.year,
        this.examType,
        this.session,
        this.notice,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.examName,
        this.examIncode,
    });

    int id;
    String examCode;
    String year;
    String examType;
    String session;
    dynamic notice;
    String status;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;
    String examName;
    String examIncode;

    factory ExamInitiate.fromJson(Map<String, dynamic> json) => ExamInitiate(
        id: json["id"],
        examCode: json["exam_code"],
        year: json["year"],
        examType: json["exam_type"],
        session: json["session"],
        notice: json["notice"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        examName: json["exam_name"],
        examIncode: json["exam_incode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "exam_code": examCode,
        "year": year,
        "exam_type": examType,
        "session": session,
        "notice": notice,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "exam_name": examName,
        "exam_incode": examIncode,
    };
}

class Examiner {
    Examiner({
        this.id,
        this.timsId,
        this.examinerName,
        this.examinerCode,
        this.examinerType,
        this.examinerUsername,
        this.examinerEmail,
        this.examinerPassword,
        this.userId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.verificationCode,
        this.parentId,
        this.examInitiateId,
        this.examCode,
        this.year,
    });

    int id;
    String timsId;
    String examinerName;
    String examinerCode;
    String examinerType;
    String examinerUsername;
    String examinerEmail;
    String examinerPassword;
    String userId;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    String verificationCode;
    String parentId;
    String examInitiateId;
    String examCode;
    String year;

    factory Examiner.fromJson(Map<String, dynamic> json) => Examiner(
        id: json["id"],
        timsId: json["tims_id"],
        examinerName: json["examiner_name"],
        examinerCode: json["examiner_code"],
        examinerType: json["examiner_type"],
        examinerUsername: json["examiner_username"],
        examinerEmail: json["examiner_email"],
        examinerPassword: json["examiner_password"],
        userId: json["user_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        verificationCode: json["verification_code"],
        parentId: json["parent_id"],
        examInitiateId: json["exam_initiate_id"],
        examCode: json["exam_code"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tims_id": timsId,
        "examiner_name": examinerName,
        "examiner_code": examinerCode,
        "examiner_type": examinerType,
        "examiner_username": examinerUsername,
        "examiner_email": examinerEmail,
        "examiner_password": examinerPassword,
        "user_id": userId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "verification_code": verificationCode,
        "parent_id": parentId,
        "exam_initiate_id": examInitiateId,
        "exam_code": examCode,
        "year": year,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}


// To parse this JSON data, do

//     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//     UserModel({
//         this.success,
//     });

//     String success;

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         success: json["success"],
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//     };
// }

