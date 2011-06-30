require 'net/http'

class PlainHTTP
  
  def self.head(url, headers = {})
    request('HEAD', url, headers, nil)
  end
  
  def self.get(url, headers = {})
    request('GET', url, headers, nil)
  end
  
  def self.post(url, headers = {}, data = nil)
    request('POST', url, headers, data)
  end
  
  def self.put(url, headers = {}, data = nil)
    request('PUT', url, headers, data)
  end
  
  def self.delete(url, headers = {})
    request('DELETE', url, headers, nil)
  end
  
  def self.request(method, url, headers, data)
    method_class_name = method.to_s.downcase.sub(/^[a-z]/i) {|m| m.upcase}
    req_class = Net::HTTP.const_get(method_class_name)
    uri = URI.parse(url)
    req = req_class.new(uri.request_uri, headers)
    if data.respond_to?(:to_hash)
      req.set_form_data(data.to_hash)
    elsif data.to_s != ''
      req.body = data
    end
    res = Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(req)
    }
    res
  end
end
