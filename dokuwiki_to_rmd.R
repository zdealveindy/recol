files <- list.files("c:\\Users\\zeleny\\Dropbox\\GitHub\\recol\\dokuwiki\\to_convert\\", pattern="\\.txt$", full.names = TRUE)
outdir <- "c:\\Users\\zeleny\\Dropbox\\GitHub\\recol\\rmd_out\\"; dir.create(outdir, showWarnings = FALSE)
for (f in files) {
  base <- sub("\\.txt$", "", basename(f))
  out <- file.path(outdir, paste0(base, ".Rmd"))
  sys <- sprintf(
    'pandoc -f dokuwiki -t "markdown+yaml_metadata_block" -M title="%s" -M output=html_document -o "%s" "%s"',
    base, out, f
  )
  system(sys)
}

