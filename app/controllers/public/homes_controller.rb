class Public::HomesController < ApplicationController
  def top
    @items = Item.all
  end

  def abput
  end
end


