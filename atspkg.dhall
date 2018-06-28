let prelude = https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { test =
    [ prelude.bin ⫽
      { src = "src/test.dats"
      , target = "target/https-test"
      , libs = [ "curl" ]
      }
    ]
  , clib = prelude.mapPlainDeps [ "curl" ]
  }
