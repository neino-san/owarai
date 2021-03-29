class ApplicationRecord < ActiveRecord::Base
  #クラス名に対応したデータベースを自動的に探す
  self.abstract_class = true
end
