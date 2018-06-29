#include "DATS/client.dats"

staload "libats/libc/SATS/stdio.sats"
staload UN = "prelude/SATS/unsafe.sats"

fn as_strptr(x : string) : Strptr1 =
  $UN.castvwtp0(x)

implement main0 () =
  {
    val _ = curl_global_init_ats()
    val fp = fopen_exn("page.out", file_mode_w)
    val _ = curl_fp(as_strptr("https://example.com"), fp)
    val _ = fclose_exn(fp)
    val _ = curl_global_cleanup()
    val _ = remove("page.out")
  }
