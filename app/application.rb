class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      
    if req.path.match(/items/)
      name = req.path.split("/items/").last 
      item = @@item.find { |i| i.price }
      resp.write "#{item}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end
