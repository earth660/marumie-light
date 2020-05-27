class Accounts::RegistrationsController < ApplicationController

  # 新規作成のビュー
  def new
    build_account   # @account用意
  end

  # アカウント登録
  def create
    get_params    # @accuntにparams入力
    if @account.save!  # .valid?が呼び出された後、save!される
      render html: 'success!'
    else
      render 'new'
    end
  end

  private

    # @account用意
    def build_account
      @account ||= Account.new
    end

    # 新規作成時StrongParameters
    def get_params
      @account = Account.new(params.require(:account).permit(:company_name, :name, :email))
    end
end
