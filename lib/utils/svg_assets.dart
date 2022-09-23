class _AssetSVGs {
  _AssetSVGs._();
  static String success2 = 'assets/svgs/success2.svg';
  static String transactionIcon = 'assets/images/trans_icon.svg';
}

enum AssetSVGs {
  success2,
  transactionIcon
}

extension X on AssetSVGs {
  String get path {
    switch (this) {
      case AssetSVGs.success2:
        return _AssetSVGs.success2;
      case AssetSVGs.transactionIcon:
        return _AssetSVGs.transactionIcon;
    }
  }
}
