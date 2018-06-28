let prelude = https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { bin =
    [ prelude.bin ⫽
      { src = "src/https-client.dats"
      , target = "target/https-client"
      , libs = [ "curl" ]
      }
    ]
  , clib = prelude.mapPlainDeps [ "curl" ]
  }
