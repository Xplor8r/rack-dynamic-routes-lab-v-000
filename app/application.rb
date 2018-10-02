class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    item = req.path.split("/songs/").last 
    song = @@songs.find{|s| s.title == song_title}
      
    if req.path=="/songs"
      resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
