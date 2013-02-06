xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title   "Hooopo's Blog"
  xml.link    "rel" => "self", "href" => url(:posts, :index)
  xml.id      url(:posts, :index)
  xml.updated @posts.first.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ" if @posts.any?
  xml.author  { xml.name "Hooopo" }

  @posts.each do |post|
    xml.entry do
      xml.title   post.title
      xml.link    "rel" => "alternate", "href" => url(:posts, :show, :id => post)
      xml.id      url(:posts, :show, :id => post)
      xml.updated post.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ"
      xml.author  { xml.name Account.first.email }
      xml.summary post.body
    end
  end
end
