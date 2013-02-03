# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  validates :title, :body, :presence => true
  def rich_body
    Blog.markdown_parser.call(self.body)[:output].to_s.html_safe
  end
end
