xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "RailsJam"
    xml.description "RailsJam is a series of events for Ruby programmers who provide training in the Philippines."
    xml.link posts_url(:rss)
    
    for p in @posts
      xml.item do
        xml.title p.title
        body = raw RedCloth.new(p.body).to_html
        xml.description body
        xml.pubDate p.created_at.to_s(:rfc822)
        xml.link post_url(p)
        xml.guid post_url(p)
      end
    end
  end
end