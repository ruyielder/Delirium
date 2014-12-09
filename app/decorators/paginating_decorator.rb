
class PaginatingDecorator < Draper::CollectionDecorator
  # Created for Kaminari.
  # https://github.com/drapergem/draper#using-pagination
  delegate :current_page, :total_pages, :limit_value
end