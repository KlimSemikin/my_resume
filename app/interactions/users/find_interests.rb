class FindInterests < ActiveInteraction::Base
  array :interests_names

  def execute
    find_interests_by_names(interests_names)
  end

  private

  def find_interests_by_names(names)
    Interest.where(name: names)
  end
end
