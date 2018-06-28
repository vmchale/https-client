#include "DATS/client.dats"

staload "libats/libc/SATS/stdio.sats"

implement main0 () =
  {
    val _ = curl_global_init_ats()
    val fp = fopen_exn("page.out", file_mode_w)
    val _ = curl_fp("https://example.com", fp)
    val _ = fclose_exn(fp)
    val _ = curl_global_cleanup()
    val _ = remove("page.out")
  }
