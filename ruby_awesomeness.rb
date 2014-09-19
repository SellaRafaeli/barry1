#Various Ruby monkey-patching for awesomeness. This is the dark ruby magic your mother warned you about. Wat.

# enable Hash dot access. x={a:1}; x.a==1; x.b=2; x.b==2;
class Hash
  def method_missing(method, *args)
    if method =~ /=$/
      # Protip: $` means "the string before the last Regex match"
      self[$`.to_sym] = args[0]
    else
      self[method.to_sym] || self[method.to_s]
    end
  end
end