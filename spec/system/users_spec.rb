require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する

    # サインインページへ移動する

    # ログインしていない場合、サインインページに遷移していることを確認する

    # すでに保存されているユーザーのemailとpasswordを入力する

    # ログインボタンをクリックする

    # トップページに遷移していることを確認する

  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # トップページに遷移する
    visit  new_user_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)
    # 誤ったユーザー情報を入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    # ログインボタンをクリックする
    click_on('Log in')
    sleep 1
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq(root_path)
  end
end