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

void curl_fun(char *url, size_t write_f) {
  CURL *handle;
  handle = curl_easy_init();
  curl_easy_setopt(handle, CURLOPT_URL, url);
  curl_easy_setopt(handle, CURLOPT_WRITEFUNCTION, write_f);
  curl_easy_cleanup(handle);
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
fun curl_fp(string, fp : !FILEptr1) : void =
  "mac#"

// TODO: use example of fwrite in libats/libc/SATS/stdio.sats
vtypedef curl_ptr =
  (Strptr1, size_t, size_t, FILEptr1) -<cloptr1> size_t

extern
fun curl_fun(string, curl_ptr) : void =
  "mac#"
