part of excel;

class Drawing {
  Sheet _sheet;
  List<OneCellAnchor> _oneCellAnchors = [];
  Map<String, String> _relTargets = {};

  Drawing(Sheet sheet) : _sheet = sheet {
    _sheet._drawing = this;
  }

  void addOneCellAnchor(OneCellAnchor anchor) {
    anchor._drawing = this;
    _oneCellAnchors.add(anchor);
  }

  List<OneCellAnchor> get oneCellAnchors {
    return _oneCellAnchors;
  }

  Map<String, String> get relTargets {
    return _relTargets;
  }
}
