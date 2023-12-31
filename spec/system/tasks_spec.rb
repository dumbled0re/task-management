require 'rails_helper'

describe 'タスク管理機能', type: :system do
  let(:user_a) {FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')}
  let(:user_b) {FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com' ) }
  let!(:task_a) {FactoryBot.create(:task, name: '最初のタスク', user: user_a) }

  before do
    # 作成者がユーザーAであるタスクを作成して、タスクとユーザーを関連付ける
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) {user_a}

      # 作成済みのタスクの名称が画面上に表示されていることを確認
      it 'ユーザーAが作成したタスクが表示される' do
        # have_contentの部分はマッチャと呼ばれるメソッドで'最初のタスク'という文字列が画面上に表示されているかどうかをチェックしている
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) {user_b}

      it 'ユーザーAが作成したタスクが表示されない' do
        # ユーザーAが作成したタスクの名称が画面上に表示されていないことを確認
        expect(page).to have_no_content '最初のタスク'
        # expect(page).not_to have_content '最初のタスク'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) {user_a}

      before do
        visit task_path(task_a)
      end

      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end
