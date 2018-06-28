let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { bin =
    [ prelude.bin ⫽
      { src = "src/https-client.dats"
      , target = "target/https-client"
      , libs = [ "curl" ]
      }
    ]
  }
