require 'rails_helper'

feature 'tweet', type: :feature do
  let(:user) { create(:user) }

  scenario 'post tweet' do
    
    visit root_path
    expect(page).to have_no_content('投稿する')

    
    #ログイン処理の流れ
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    # fill_inで値が入力される動きを作成
    fill_in 'user_password', with: user.password
    find('input[name="comit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('投稿する')

    expect{
      click_link('投稿する')
      expect(current_path).to eq new_tweet_path
      # 現在のページが特定のパスであることを検証する
      fill_in 'image', with: 'https://s.eximg.jp/expub/feed/Papimani/2016/Papimami_83279/Papimami_83279_1.png'
      fill_in 'text', with: 'フィーチャスペックのテスト'
      find('input[type="submit"]').click
    }.to change(Tweet, :count).by(1)
  end
end