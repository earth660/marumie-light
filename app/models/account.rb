class Account < ApplicationRecord
    # matterモデルとの依存関係
    has_many: matters, dependent: :destroy
end
