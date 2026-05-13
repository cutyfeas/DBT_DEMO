{% macro DAY_TYPE(x)%}
case when dayname(TO_TIMESTAMP(replace({{x}},'"',''))) in ('Sun','Sat') then 'WEEKEND' else 'BUSINESS DAY' end 
{%endmacro%}