class _AssetSVGs {
  _AssetSVGs._();

  static String success2 = 'assets/svgs/success2.svg';

}

enum AssetSVGs {

  success2,
 
}

extension X on AssetSVGs {
  String get path {
    switch (this) {
   
      case AssetSVGs.success2:
        return _AssetSVGs.success2;
     
    }
  }
}
