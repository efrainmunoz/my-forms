// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

let scraper_type = document.querySelector("#website_type")
let html_scraper = document.querySelector("#html-scraper")
let json_scraper = document.querySelector("#json-scraper")

if (scraper_type.value === "html")
{
    json_scraper.setAttribute("hidden", "")
    html_scraper.removeAttribute("hidden")
}
else if (scraper_type.value === "json")
{
    json_scraper.removeAttribute("hidden")
    html_scraper.setAttribute("hidden", "")
}

scraper_type.addEventListener("input", event => {
  if (event.target.value === "html")
  {
    json_scraper.setAttribute("hidden", "")
    html_scraper.removeAttribute("hidden")
  }
  else if (event.target.value === "json")
  {
    json_scraper.removeAttribute("hidden")
    html_scraper.setAttribute("hidden", "")
  }
})
