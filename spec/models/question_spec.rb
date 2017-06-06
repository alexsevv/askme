require 'rails_helper'

RSpec.describe Question do
  it 'sets hashtags from its text' do
    question = FactoryGirl.create(:question, text: 'мама мыла #раму')
    expect(question.reload.hashtags.count).to eq 1
    expect(question.hashtags.first.name).to eq 'раму'
  end

  it 'deletes old hashtags' do
    question = FactoryGirl.create(:question, text: 'мама мыла #раму')
    question.update(text: 'мама #мыла раму' )
    expect(question.reload.hashtags.count).to eq 1
    expect(question.hashtags.first.name).to eq 'мыла'
  end

  it 'sets hashtags from answer' do
    question = FactoryGirl.create(:question, text: 'мама мыла #раму')
    question.update(answer: 'нет не #мыла рамы')

    hashtags = question.reload.hashtags

    expect(hashtags.count).to eq 2
    expect(hashtags.pluck(:name).sort).to eq %w(мыла раму)
  end
end
