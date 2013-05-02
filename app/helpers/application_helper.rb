module ApplicationHelper
  DISAMBIGUATION_COLOR_CLASSES = {
    0 => "green-sea",
    1 => "nephritis",
    2 => "belize-hole",
    3 => "wisteria",
    4 => "midnight-blue",
    5 => "orange",
    6 => "pumpkin",
    7 => "pomegranate",
    8 => "asbestos" }
  
  def disambiguation_color_class(index)
    DISAMBIGUATION_COLOR_CLASSES[index]
  end

end
