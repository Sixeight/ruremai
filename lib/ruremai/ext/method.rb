class Method
  def rurema!
    Ruremai.launch self
  end

  def gurema!
    require 'ruremai/guremai'
    Guremai.launch self
  end
end
