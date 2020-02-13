class String
  def to_2d_array(value)
    unpack("a#{value}"*((size/value)+((size%value>0)?1:0)))
  end
end
