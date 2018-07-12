require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @author = Author.create(name: 'test', surname: 'test')
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'attributes' do
    it 'should have proper attributes' do
      expect(subject.attributes).to include('title', 'content', 'author_id')
    end
  end

  describe 'scopes' do
    it 'should have old scope' do
      post1 = Post.create(title: 'Pierwszy post', content: 'Testowy content', author_id: @author.id)
      Timecop.freeze(Time.now + 1.hour)
      post2 = Post.create(title: 'Drugi post', content: 'Testowy content', author_id: @author.id)

      expect(Post.old).to include(post1)
      expect(Post.old).not_to include(post2)
    end
  end

  describe 'relations' do
    it { should belong_to(:author) } 
    it { should have_many(:comments) } 
  end
end