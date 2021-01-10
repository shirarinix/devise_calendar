require 'rails_helper'

RSpec.describe Event, type: :model do
  before 'イベント管理機能' do
    @event = FactoryBot.build(:event)
  end

  describe 'イベントの新規作成' do
    context '新規作成がうまくいくとき' do
      it 'title,content,start_timeが存在すれば登録ができる' do
        expect(@event).to be_valid
      end
      it 'titleが必須である' do
        @event.title = 'title'
        expect(@event).to be_valid
      end
      it 'contentが必須である' do
        @event.content = 'content'
        expect(@event).to be_valid
      end
      it 'start_timeが必須である' do
        @event.start_time = '09-09-09:00'
        expect(@event).to be_valid
      end
    end

    context '新規作成がうまくいかないとき' do
      it 'titleが空だと登録ができない' do
        @event.title = ' '
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空だと登録ができない' do
        @event.content = ' '
        @event.valid?
        expect(@event.errors.full_messages).to include("Content can't be blank")
      end
      it 'start_timeが空だと登録ができない' do
        @event.start_time = ' '
        @event.valid?
        expect(@event.errors.full_messages).to include("Start time can't be blank")
      end
    end
  end
end
