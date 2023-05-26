part of excel;

class OneCellAnchor {
  late Drawing _drawing;
  int _col;
  int _row;
  String _blipFillId;

  OneCellAnchor(int col, int row, String blipFillId)
      : _col = col,
        _row = row,
        _blipFillId = blipFillId;
}
