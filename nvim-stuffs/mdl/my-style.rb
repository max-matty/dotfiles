# Enforce the style guide
all
rule 'MD007', :indent => 2
#rule 'MD013', :line_lenght => 500

# Exlude some rules
exclude_rule 'MD013'  # Line length
exclude_rule 'MD024'  # Multiple headers with the same content
exclude_rule 'MD026'  # Trailing punctuation in header

