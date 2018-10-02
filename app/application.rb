class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      
    if req.path.match(/items/)
      name = req.path.split("/items/").last 
      if item = @@items.find { |i| resp.write i.price }
      elsif !@@items.include? name
      resp.write = "Item not found"
      resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end
