# Required packages
require(rvest)
require(purrr)
require(dplyr)
require(tidyr)

# Function to collect tax form information
collect_tax_forms <- function(url,base_url = "https://canada.ca") {

  # Scrape table data from the main page
  all_forms <- read_html(url) %>% html_nodes("td , .sorting") %>% html_text()
  form_page <- read_html(url) %>% html_nodes("td:nth-child(1) > a") %>% html_attr('href')

  # Extract data into a data frame
  res_df <- data.frame(
    last_update = all_forms[seq(3, length(all_forms), by = 3)],
    description = all_forms[seq(2, length(all_forms) - 1, by = 3)],
    name = all_forms[seq(1, length(all_forms) - 2, by = 3)],
    path = paste0(base_url, form_page),
    stringsAsFactors = F
  ) %>%
    dplyr::mutate(
      page = purrr::map(.x = path, ~ {
        read_html(.x) -> page
        unlink(.x)
        page
      }),
      pdf_nodes = purrr::map(.x = page,  ~ {
        .x %>% html_nodes('.lst-none li')
      }),
      pdf_fill_nodes = purrr::map(.x = page,  ~ {
        .x %>% html_nodes('.lst-none li+ li a')
      }),
      check = purrr::map(.x = pdf_fill_nodes,  ~ {
        if (!identical(character(0), .x))
          return(0)
        else
          - 1
      }),
      file_url = purrr::map2(.x = check, .y = pdf_fill_nodes,  ~
                               {
                                 if (.x == 0)
                                   tryCatch(
                                     html_attr(.y,'href'),
                                     error = function(e)
                                       return(NA_character_)
                                   )
                               })
    )

  # Unnest and save the final data frame
  forms_final <- res_df %>%
    dplyr::tibble() %>%
    tidyr::unnest(c(check, file_url)) %>%
    dplyr::select(last_update, description, name, path, check, page, file_url) %>%
    dplyr::mutate(url_loc = paste0(base_url, file_url),
                  file_name = basename(url_loc)
    )

  return(forms_final)
}
