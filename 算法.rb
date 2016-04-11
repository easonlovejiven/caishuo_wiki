# {a:1,  b:2, c:{d:4, e:5}}     > "a_1,b_2,c_d_1,c_e_5"
  
  def hash_parse(hash)
    keys = hash.keys
    values = hash.values
    # a_1
    a = hash.keys.first.to_s+"_"+hash[:a].to_s
    # b_2
    b = hash.keys[1].to_s+"_"+hash[:b].to_s
    # c_d_1
    c = hash.keys.last.to_s+"_"+hash.values.last.keys.first.to_s+"_"+hash[:a].to_s
    # c_e_5
    d = hash.keys.last.to_s+"_"+hash.values.last.keys.last.to_s+"_"+hash.values.last.values.last.to_s
    p a+","+b+","+c+","+d
  end

  def to_str(hash)
    array = []
    hash.each do |key, value|
      if value.is_a?(Hash)
        array += to_str(value).map {|s| "#{key}_#{s}"}
      else
        array << "#{key}_#{value}"
      end
    end
    array.join(",")
  end