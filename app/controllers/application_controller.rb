class ApplicationController < ActionController::Base

  # デバッグに使うメソッド
  def printout(str)
    puts "*" * 30
    puts str
  end
end
