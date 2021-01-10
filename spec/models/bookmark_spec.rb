require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'フォロー機能 validationテスト' do
    it { should validate_uniqueness_of(:following_id).scoped_to(:follower_id, :follow_id, :followed_id).with_message('エラー発生') }
  end
end
