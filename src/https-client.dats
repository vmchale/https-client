%{^
#include <curl/curl.h>

void curl_global_init_ats() { curl_global_init(CURL_GLOBAL_ALL); }

void curl_fp(char *url, FILE *fp) {
  CURL *handle;
  handle = curl_easy_init();
  curl_easy_setopt(handle, CURLOPT_URL, url);
  curl_easy_setopt(handle, CURLOPT_WRITEDATA, fp);
  curl_easy_perform(handle);
  curl_easy_cleanup(handle);
}

static size_t write_data(void *ptr, size_t size, size_t nmemb, void *stream) {
  size_t written = fwrite(ptr, size, nmemb, (FILE *)stream);
  return written;
}
%}

staload "libats/libc/SATS/stdio.sats"

extern
fun curl_global_init_ats() : void =
  "mac#"

extern
fun curl_global_cleanup() : void =
  "mac#"

// FIXME Strptr1?
extern
fun curl_fp(string, !FILEptr1) : void =
  "mac#"

implement main0 () =
  {
    val _ = curl_global_init_ats()
    val fp = fopen_exn("page.out", file_mode_w)
    val _ = curl_fp("https://example.com", fp)
    val _ = fclose_exn(fp)
    val _ = curl_global_cleanup()
  }
