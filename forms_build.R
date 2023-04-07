invisible(lapply(
  list.files(
    here::here("src", "fns"),
    pattern = "*.R",
    full.names = T
  ),
  source,
  local = F
))

# Usage
cra_forms <- 'https://www.canada.ca/en/revenue-agency/services/forms-publications/forms.html'
start <- Sys.time()
forms_final <- collect_tax_forms(cra_forms)
end <- Sys.time()
end - start
saveRDS(forms_final, here::here("data","forms_2023.RDS"))
