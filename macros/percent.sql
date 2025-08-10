{% macro safe_percent(numer, denom) -%}
case
  when {{ denom }} = 0 or {{ denom }} is null then null
  else {{ numer }} / {{ denom }}
end
{%- endmacro %}
