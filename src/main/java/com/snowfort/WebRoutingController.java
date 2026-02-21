package com.snowfort;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebRoutingController {

  /**
   * Map non-static, missing routes to the React index.html.
   * This regex matches single-level and multi-level paths that do NOT contain a
   * period.
   * This guarantees that requests for real static resources (.js, .css, .png)
   * still attempt to be served by Spring's resource handling and return 404 if
   * missing,
   * rather than incorrectly serving the React index.html.
   */
  @GetMapping(value = {
      "/{path:[^\\.]*}",
      "/**/{path:[^\\.]*}"
  })
  public String redirect() {
    return "forward:/index.html";
  }
}
