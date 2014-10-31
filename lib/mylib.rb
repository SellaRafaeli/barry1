# The Darkest Ruby Magic.

module Enumerable
  # Enable dot access on hashes and hash-like objects.
  # {b:2}.b == {'b' => 2}.b == 2. 
  def method_missing(method, *args)
    return if method == "kind_of?"  # This should never happen, but just in case..
    return if self.kind_of? Array
    if method =~ /=$/
      # Protip: $` means "the string before the last Regex match".
      self[$`.to_sym] = args[0]
    else
      self[method.to_sym] || self[method.to_s]
    end
  end
end

class Hash
  def and(params)
    self.merge(params)
  end

  def just(*args)
    args = (args.map {|v| v.to_s}) + (args.map {|v| v.to_sym})
    self.slice(*args)
  end
end

def nice_id
  # Unique, URL-able, dev-friendly. Try it yourself!
	$prod ? rand(2**128).to_s(36)+"-"+rand(1000).to_s : rand(10000).to_s
end

def bp
	binding.pry
end

def admin?
  session.user && session.user.admin
end
