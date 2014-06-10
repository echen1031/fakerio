class Api::V1::PeopleController < Api::V1::BaseController

  def index
    count = (params[:count] || 1).to_i
    has_company = params[:with_company].present? ? true : false
    people = []
    count.times do
      people << Person.new(has_company)
    end

    respond_with(people)
  end

end
