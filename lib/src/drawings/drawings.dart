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

  bool writeFillBlip(String blipId, OutputStreamBase output) {
    String? value = _relTargets[blipId];
    if (value == null) {
      return false;
    }

    var file = _sheet._excel._archive.findFile(value);
    if (file == null) {
      return false;
    }

    file.writeContent(output);
    return true;
  }
}
