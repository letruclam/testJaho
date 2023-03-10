
class SpinnerModel {
  int? id;
  String? text;
  String value;
  int? idValue;
  bool? status;
  dynamic data;

  SpinnerModel( this.id, this.text, {this.idValue = -1, this.value = "", this.data, this.status = false});
}