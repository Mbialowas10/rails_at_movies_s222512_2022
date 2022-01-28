class ProductionCompaniesController < ApplicationController
  def index
    # fetch all production companies
    # SELECT "production_companies"."id", "production_companies"."name", count(production_companies.id) as 'Movie Count' from "production_companies"
    # LEFT OUTER JOIN "movies" on
    # "movies"."production_company_id" = "production_companies"."id"
    # GROUP BY "production_companies"."id"
    # order by count(production_companies.id) desc

    # @production_companies = ProductionCompany.select("production_companies.*")
    #                                                             .select("COUNT(production_companies.id) as movie_count")
    #                                                             .left_joins(:movies)
    #                                                             .group("production_companies.id")
    #                                                             .order("movie_count DESC")

    @production_companies = ProductionCompany.ordered_by_movies
  end

  def show
    @production_company= ProductionCompany.find(params[:id])
  end
end
