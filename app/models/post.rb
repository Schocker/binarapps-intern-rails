class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 80 }
  validates :content, length: { in: 10..500 }

  scope :old, -> { where('created_at < ?', 40.minutes.ago) }

  belongs_to :author
  has_many :comments

  def self.get_random
    Post.offset(rand(Post.count)).first
  end
  # has_many :author_posts
  # has_many :authors, through: :author_posts
  # before_create :annotate_author

  # def annotate_author
  #   self.author = "#{self.author} from BinarApps"
  # end
end