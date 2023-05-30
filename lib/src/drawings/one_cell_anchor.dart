part of excel;

class OneCellAnchor {
  int _col;
  int _row;
  String _blipFillId;

  OneCellAnchor(int col, int row, String blipFillId)
      : _col = col,
        _row = row,
        _blipFillId = blipFillId;

  int get col {
    return _col;
  }

  int get row {
    return _row;
  }

  String get blipFillId {
    return _blipFillId;
  }
}
