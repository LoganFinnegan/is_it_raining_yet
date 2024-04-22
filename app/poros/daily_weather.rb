class DailyWeather
attr_reader :sunrise,
            :sunset,
            :maxtemp,
            :mintemp,
            :text,
            :icon

  def initialize(data)
    @sunrise = data[:astro][:sunrise]
    @sunset = data[:astro][:sunset]
    @maxtemp = data[:day][:maxtemp_f]
    @mintemp = data[:day][:mintemp_f]
    @text = data[:day][:condition][:text] 
    @icon = data[:day][:condition][:icon]
  end
end