class Expert {
  int code;
  String message;
  Data data;

  Expert({this.code, this.message, this.data});

  Expert.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int totalRecords;
  int pageSize;
  int pageNumber;
  List<ExpertDto> data;

  Data({this.totalRecords, this.pageSize, this.pageNumber, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    totalRecords = json['TotalRecords'];
    pageSize = json['PageSize'];
    pageNumber = json['PageNumber'];
    if (json['Data'] != null) {
      data = new List<ExpertDto>();
      json['Data'].forEach((v) {
        data.add(new ExpertDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalRecords'] = this.totalRecords;
    data['PageSize'] = this.pageSize;
    data['PageNumber'] = this.pageNumber;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpertDto {
  int expertId;
  String expertTypeId;
  String expertName;
  int sortNo;
  String mtName;
  String avatar;
  int hiTrate;
  String inTro;
  int isEnable;
  int isTop;
  Null expertTypeTitle;
  Null expertGoodAt;
  int isDelete;
  Null detailed;
  Null expertLabel;
  String winningLabel1;
  String winningLabel2;
  bool isStatistics;
  int expertCount;
  List<ExpertTypeList> expertTypeList;
  List<MatchTypeList> matchTypeList;

  ExpertDto(
      {this.expertId,
        this.expertTypeId,
        this.expertName,
        this.sortNo,
        this.mtName,
        this.avatar,
        this.hiTrate,
        this.inTro,
        this.isEnable,
        this.isTop,
        this.expertTypeTitle,
        this.expertGoodAt,
        this.isDelete,
        this.detailed,
        this.expertLabel,
        this.winningLabel1,
        this.winningLabel2,
        this.isStatistics,
        this.expertCount,
        this.expertTypeList,
        this.matchTypeList});

  ExpertDto.fromJson(Map<String, dynamic> json) {
    expertId = json['ExpertId'];
    expertTypeId = json['ExpertTypeId'];
    expertName = json['ExpertName'];
    sortNo = json['SortNo'];
    mtName = json['MtName'];
    avatar = json['Avatar'];
    hiTrate = json['HiTrate'];
    inTro = json['InTro'];
    isEnable = json['IsEnable'];
    isTop = json['IsTop'];
    expertTypeTitle = json['ExpertTypeTitle'];
    expertGoodAt = json['ExpertGoodAt'];
    isDelete = json['IsDelete'];
    detailed = json['Detailed'];
    expertLabel = json['ExpertLabel'];
    winningLabel1 = json['WinningLabel1'];
    winningLabel2 = json['WinningLabel2'];
    isStatistics = json['IsStatistics'];
    expertCount = json['ExpertCount'];
    if (json['ExpertTypeList'] != null) {
      expertTypeList = new List<ExpertTypeList>();
      json['ExpertTypeList'].forEach((v) {
        expertTypeList.add(new ExpertTypeList.fromJson(v));
      });
    }
    if (json['MatchTypeList'] != null) {
      matchTypeList = new List<MatchTypeList>();
      json['MatchTypeList'].forEach((v) {
        matchTypeList.add(new MatchTypeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ExpertId'] = this.expertId;
    data['ExpertTypeId'] = this.expertTypeId;
    data['ExpertName'] = this.expertName;
    data['SortNo'] = this.sortNo;
    data['MtName'] = this.mtName;
    data['Avatar'] = this.avatar;
    data['HiTrate'] = this.hiTrate;
    data['InTro'] = this.inTro;
    data['IsEnable'] = this.isEnable;
    data['IsTop'] = this.isTop;
    data['ExpertTypeTitle'] = this.expertTypeTitle;
    data['ExpertGoodAt'] = this.expertGoodAt;
    data['IsDelete'] = this.isDelete;
    data['Detailed'] = this.detailed;
    data['ExpertLabel'] = this.expertLabel;
    data['WinningLabel1'] = this.winningLabel1;
    data['WinningLabel2'] = this.winningLabel2;
    data['IsStatistics'] = this.isStatistics;
    data['ExpertCount'] = this.expertCount;
    if (this.expertTypeList != null) {
      data['ExpertTypeList'] =
          this.expertTypeList.map((v) => v.toJson()).toList();
    }
    if (this.matchTypeList != null) {
      data['MatchTypeList'] =
          this.matchTypeList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpertTypeList {
  int id;
  String typeName;
  String sortNo;
  int isEnable;

  ExpertTypeList({this.id, this.typeName, this.sortNo, this.isEnable});

  ExpertTypeList.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    typeName = json['TypeName'];
    sortNo = json['SortNo'];
    isEnable = json['IsEnable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['TypeName'] = this.typeName;
    data['SortNo'] = this.sortNo;
    data['IsEnable'] = this.isEnable;
    return data;
  }
}

class MatchTypeList {
  String iD;
  String parentmtID;
  String matchName;
  int matchLevel;
  String type;
  int sort;
  int isVisible;

  MatchTypeList(
      {this.iD,
        this.parentmtID,
        this.matchName,
        this.matchLevel,
        this.type,
        this.sort,
        this.isVisible});

  MatchTypeList.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    parentmtID = json['ParentmtID'];
    matchName = json['MatchName'];
    matchLevel = json['MatchLevel'];
    type = json['Type'];
    sort = json['Sort'];
    isVisible = json['IsVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ParentmtID'] = this.parentmtID;
    data['MatchName'] = this.matchName;
    data['MatchLevel'] = this.matchLevel;
    data['Type'] = this.type;
    data['Sort'] = this.sort;
    data['IsVisible'] = this.isVisible;
    return data;
  }
}