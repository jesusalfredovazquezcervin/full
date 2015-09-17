

Date::DATE_FORMATS[:month_day_year] = '%m/%d/%Y'
Date::DATE_FORMATS[:short_ordinal] = ->(date) { date.strftime("%B #{date.day.ordinalize}") }
