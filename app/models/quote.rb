class Quote
  include Mongoid::Document
  embeds_many :tags
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  
  validates :quote, :author, :author_about, presence: true
end
