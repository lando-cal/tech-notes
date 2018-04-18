Title: figlet

Figlet prints horizontal text in ascii drawings.

# Examples
## Print text

```
$ figlet hello
  _          _ _
 | |__   ___| | | ___
 | '_ \ / _ \ | |/ _ \
 | | | |  __/ | | (_) |
 |_| |_|\___|_|_|\___/
```

## Show available fonts

```
$ showfigfonts | head
3-d :
  ****             **
 */// *           /**
/    /*           /**
   ***  *****  ******
  /// */////  **///**
 *   /*      /**  /**
/ ****       //******
 ////         //////
```

## Use a font

```
$ figlet -f 3-d hello
 **               **  **
/**              /** /**
/**       *****  /** /**  ******
/******  **///** /** /** **////**
/**///**/******* /** /**/**   /**
/**  /**/**////  /** /**/**   /**
/**  /**//****** *** ***//******
//   //  ////// /// ///  //////
```

# See Also

- [cowsay](cowsay)
