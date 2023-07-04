import 'package:gsheets/gsheets.dart';

class GoogleSheetApi {
  static const _creadentials = r'''
{
  "type": "service_account",
  "project_id": "expensiya-391819",
  "private_key_id": "534de78e127b9e55e6671d222d1685f9f500f50c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC7cINMu6S8wRM+\nE5B2qlIVnGvl1oFlP7yJdzZa5SoEO3Vq57lGjtsOzk7Tg3HpbBSQa4TKJqmqqtco\nOI0sZvrT0jR2TLfWudmsFH19L77McMDbq5DwpYAzFJ/12O11rWp35PM6eiSi4UgV\n5akZXLYAbUvY4e3iz65FcKUkGPOphe0u53mevXbR3C1BTBALwFpqcjCYNWT+rPgk\nJ9t7vpwJlCp6W8Qt3vteP43FOsVxLkuFJgGJrYa9mQWnKKq6msznKFMHtxqrBenq\nyROlFVCCK4oz2SQeFeLGp0Zzew/sJcgx4ppwZheZ2xwB1wemWXXST30qQWrQJG3z\njz5uLrifAgMBAAECggEATyuvcd5CL2339DzsRIsdX75xvqNThVIeDww4+7yW+jGp\nH04gLmLRuRfAKMv49eiuaO/ZJ0+cU5eUiIsWah5XLNg5S4yNDBf1Dp+a/6EGnLC1\nbTOy5Upqc2jvRbbqWc21Tk34xIbp6ZhxS7p1Kd7EizqfEk0fnzEsgW0ae7xEUyIi\niVmVfCZb8xSAp4wiKqxpvYFNdfu74QxpmI8y+6f4TN4JtS7+poXFmpkFBgM0/cbl\nbVWWMX6yL8hP8dKCJUTH4ZEgPcDK2UxtdTrJM0Sn4mGJHdaCXVDID+D24Km1eMtd\ngfa+fPg7Bp6/9rTqFSkOaGa7D9bdttICasqaaFrn7QKBgQDpScRWhbhGiEVlIwyq\n6msrozLoByoFc8N/VCIP1KOK1JpvCz4hvcPYECQgu1+4UZuHy/s/NA99x1TZL00m\nrD2Rzvm/vXoFjQjvLSMpddYTR16NU9yKNhu6FjmE8DW4WHZC9iHzNELtzgoRR5FQ\nkAq7Rnw3Bklwauv1NpXedlIuUwKBgQDNsA/CY4A7qcKLw9AY7GQ66GtpLovVpsrM\npq0uJoaeLAGjeGTxdAAKOcBDGlfC4B+Z7LJyQTn0nKEqWDJ8HmRJJMcYlVPu+QMN\nlQ+OUrlRE19VaZBxfmjH2fA5nuYMhQiZep5VjKwI1TXFW76Vpm2MFZjNsqTIORUK\nRtIf0cjLBQKBgQCxqWIC2ndKD8F5kkW1bC0N4I2GMt6HpG+/6ly+XZvmwJ6T7qX0\noEYjp7c7zjbJcizWMDw5F/asPT+a3vEMgKOrBUsiALSKwauKKn/atUjBCdsyGimc\ngDSBdSd83EqtB4GY4UVdp/FIlV8JZc1+4xOpJ7a1WO5Y1LS53EYqU0WmzQKBgH/A\np7kj1eS4xsXKZDjmskZIT1Zv+5hC1VkQ+SVd9mTNjmL7By9UziWLwxeqh/HZBKe0\n9Qyz6Iw+sHc9enXO5pjrh+GD9jLKZRQNjjDmvoVV0/OX8ogbbHccrPEM+XOzOSki\nmK8oBT4jNxeSqSgHy6ijTVoNZ/2YPrI4VJBA20cFAoGALj9yKzmOm2CE/gAvOeQa\nT0TKmaIHGieMRhSS1Ctjk1egMGHU37KQzJYI3/NcD3krNpoZYdCUx19g1ne2qlpb\ni4WfWTRpzf5+NH6aGBilhlK7O45wV4KFIqHCh72aC1f5pjVM4FyT/rL6Qq/+vRCz\nV9Nr0A+KZnNvuuPjdCSu2kg=\n-----END PRIVATE KEY-----\n",
  "client_email": "expensiya@expensiya-391819.iam.gserviceaccount.com",
  "client_id": "104167255449001779491",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/expensiya%40expensiya-391819.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
  static const _spreadsheetId = '1n7QIgvAts_ED96T7DevtMU8GrRBcTDZ1GPSEoqgNCGc';
  static final gSheets = GSheets(_creadentials);
  static Worksheet? _worksheet;
  Future init() async {
    final ss = await gSheets.spreadsheet(_spreadsheetId);
    var sheet = ss.worksheetByTitle("expensiya");
  }
}
