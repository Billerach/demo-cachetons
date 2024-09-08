module CountrySelectHelper
  PRIORITY_COUNTRIES = ["FR"]

  def priority_countries
    countries = PRIORITY_COUNTRIES.map { |country| ISO3166::Country[country] }
    countries.map! { |country| [country.translations[I18n.locale.to_s], country.alpha2] }
    countries.sort_by! { |country| country[0] }
  end

  def other_countries
    all_countries = ISO3166::Country.all.map! { |country| [country.translations[I18n.locale.to_s], country.alpha2] }
    other_countries = all_countries - priority_countries
    # sort Åland Islands correctly
    other_countries.sort_by! { |country| country[0].tr("Å", "A") }
  end

  # add a divider
  def countries_for_select
    (priority_countries + [["----------------", "----------------"]] + other_countries).map { |country| country.first}
  end
end
