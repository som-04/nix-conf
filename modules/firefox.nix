{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default.settings = {
      "dom.webaudio.realtime.enabled" = true;
      "media.audio.capture.enabled" = true;
      "media.cache_size" = 65536;
      "media.cache_readahead_limit" = 900;
      "media.cache_resume_threshold" = 600;
      "media.ffmpeg.vaapi.enabled" = true;
      "media.rdd-process.enabled" = true;
      "gfx.webrender.all" = true;
      "gfx.webrender.enabled" = true;
      "browser.search.defaultenginename" = "DuckDuckGo";
    };
  };
}
