class FindInterests < ActiveInteraction::Base
  array :interests_names

  def execute
    Interest.where(name: interests_names)
  end
end
