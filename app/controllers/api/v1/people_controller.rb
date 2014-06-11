class Api::V1::PeopleController < Api::V1::BaseController

  def index
    count = (params[:count] || 1).to_i
    has_company = params[:with_company].present?
    has_pet = params[:with_pet].present?
    people = []
    count.times do
      people << Person.new(has_company, has_pet)
    end

    respond_with(people)
  end

end
