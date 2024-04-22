class CurrentWeather
attr_reader :last_updated,
            :temp,
            :feelslike,
            :humidity,
            :uv,
            :vis_miles,
            :text,
            :icon

  def initialize(data)
    @last_updated = data[:last_updated]
    @temp = data[:temp_f]
    @feelslike = data[:feelslike_f]
    @humidity = data[:humidity]
    @uv = data[:uv]
    @vis_miles = data[:vis_miles] 
    @text = data[:condition][:text] 
    @icon = data[:condition][:icon]
  end
end