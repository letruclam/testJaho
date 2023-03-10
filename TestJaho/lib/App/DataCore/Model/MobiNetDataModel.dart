

class MobiNetDataModel {
  int? id;
  String? text;
  String value;
  int? idValue;
  bool? status;
  dynamic data;

  MobiNetDataModel( this.id, this.text, {this.idValue = -1, this.value = "", this.data, this.status = false});
}