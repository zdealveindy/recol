files <- list.files("c:\\Users\\zeleny\\Dropbox\\GitHub\\recol\\dokuwiki\\to_convert\\", pattern="\\.txt$", full.names = TRUE)
outdir <- "c:\\Users\\zeleny\\Dropbox\\GitHub\\recol\\rmd_out\\"; dir.create(outdir, showWarnings = FALSE)

# Locate pandoc (try RStudio's, then system PATH)
pbin <- tryCatch({
  if (requireNamespace("rmarkdown", quietly = TRUE)) {
    rmarkdown::find_pandoc()             # sets PATH side-effect
    rmarkdown::pandoc_exec()             # returns full path
  } else {
    Sys.which("pandoc")
  }
}, error = function(e) Sys.which("pandoc"))

for (f in files) {
  base <- sub("\\.txt$", "", basename(f))
  out <- file.path(outdir, paste0(base, ".Rmd"))
  # Build args safely (no fragile quoting)
  args <- c(
    "-f", "dokuwiki",
    "-t", "markdown+yaml_metadata_block",
    "-M", paste0("title=", base),
    "-M", "output=html_document",
    "-o", shQuote(out),
    shQuote(f)
  )
  
  status <- system2(pbin, args = args, stdout = TRUE, stderr = TRUE)
}

