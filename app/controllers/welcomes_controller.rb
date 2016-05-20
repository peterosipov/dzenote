class WelcomesController < ApplicationController

  def index
    @notes = Note.all
    @example_notes = Note.where(user_id: 4)
  end

end