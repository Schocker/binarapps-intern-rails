class Author < ActiveRecord::Base
  validates :name, :surname, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }

  # has_many :author_posts
  # has_many :posts, through: :author_posts
  has_many :posts
  has_many :comments

  scope :old, -> { where('age > 30') }

  before_validation :default_age

  def fullname
    "#{name} #{surname}"
  end

  private
  def default_age
    self.age = 25 unless age
  end
end