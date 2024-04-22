class HourlyWeather 
attr_reader :time,
            :temp,
            :icon,
            :text
  
  def initialize(data)
    @time = data[:time]
    @temp = data[:temp_f] 
    @icon = data[:condition][:icon]
    @text = data[:condition][:text]
  end
end