module Gurby
module Util
module Misc

  # utilities to get arguments from the args hash, with defaults
  def get_arg(key, default) 
    if (@args == nil) 
      return default
    elsif @args[0].instance_of? Hash
      if @args[0][key]
        return @args[0][key]
      else
        return default
      end
    else 
      return default
    end    
  end

  # if the key is present, return func(key), else default
  def get_arg_func(key, func, default) 
    if (@args == nil) 
      return default
    elsif @args[0].instance_of? Hash
      if @args[0][key]
        return func.call(@args[0][key])
      else
        return default
      end
    else 
      return default
    end
  end

end
end
end
