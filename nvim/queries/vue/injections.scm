; inherits vue

; <i18n> ... </i18n> -> JavaScript
(element
  (start_tag
    (tag_name) @_tag
    (#eq? @_tag "i18n"))
  (text) @injection.content
  (#set! injection.language "json"))

; <i18n lang="json"> ... </i18n> -> JSON
(element
  (start_tag
    (tag_name) @_tag
    (attribute
      (attribute_name) @_lang
      (quoted_attribute_value
        (attribute_value) @_json))
    (#eq? @_tag "i18n")
    (#eq? @_lang "lang")
    (#eq? @_json "json"))
  (text) @injection.content
  (#set! injection.language "json"))

; <i18n lang="yaml"> ... </i18n> -> YAML
(element
  (start_tag
    (tag_name) @_tag
    (attribute
      (attribute_name) @_lang
      (quoted_attribute_value
        (attribute_value) @_yaml))
    (#eq? @_tag "i18n")
    (#eq? @_lang "lang")
    (#eq? @_yaml "yaml"))
  (text) @injection.content
  (#set! injection.language "yaml"))
