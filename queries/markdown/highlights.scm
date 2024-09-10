; extends
(fenced_code_block
  (fenced_code_block_delimiter) @markup.raw.delimiter
  (#set! conceal "```"))

(fenced_code_block
  (info_string
    (language) @conceal
    (#set! conceal "")))
