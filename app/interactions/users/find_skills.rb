class FindSkills < ActiveInteraction::Base
  array :skills_names

  def execute
    find_skills_by_names(skills_names)
  end

  private

  def find_skills_by_names(names)
    Skill.where(name: names)
  end
end
