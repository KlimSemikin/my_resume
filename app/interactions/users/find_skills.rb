class FindSkills < ActiveInteraction::Base
  array :skills_names

  def execute
    Skill.where(name: skills_names)
  end
end
