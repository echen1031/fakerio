class Api::V1::PeopleController < Api::V1::BaseController

  def index
    count = (params[:count] || 1).to_i
    people = []
    count.times do
      people << Person.new
    end

    if params[:field]   # suppose this value is email

      # p.send("email") is the same as p.email
      people = people.map { |p| p.send(params[:field]) }

    end



    respond_with(people)
  end

end
