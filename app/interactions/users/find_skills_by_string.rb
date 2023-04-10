class FindSkillsByString < ActiveInteraction::Base
  string :skills # Не совсем понял этот момент. С одной стороны было бы логично переделать по аналогии
                 # с interests т.е чтобы на вход приходил массив skills, а не строка как в условии задания,
                 # так бы я и сделал, если бы знал, что имею доступ к фронту, чтобы там тоже это поменять,
                 # однако сделал со строкой, предположив, что не должен менять входные данные.

  def execute
    skills_names = split_by_skills(skills)
    find_skills_by_names skills_names
  end

  private

  def split_by_skills(string)
    string.split(',')
  end

  def find_skills_by_names(names)
    Skill.where(name: names)
  end
end
