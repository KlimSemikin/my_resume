require 'rails_helper'

describe CreateUser do
  let(:inputs) { { name: '', surname: '', patronymic: '', email: '', nationality: '', gender: '', country: '' } }
  let(:outcome) { described_class.run(inputs) }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }

  it 'type checks' do
    params = inputs.clone
    inputs.except!(*inputs.keys)
    expect(outcome).to_not be_valid
    params.keys.each { |key| expect(errors).to have_key key }
    params.keys.each { |key| expect(errors[key]).to include 'is required' }
  end

  it 'validates' do
    inputs[:age] = ''
    expect(outcome).to_not be_valid
    inputs.keys.each { |key| expect(errors).to have_key key }
    inputs.keys.each { |key| expect(errors[key]).to include "can't be blank" }
  end

  it 'creates without interests, skills' do
    inputs.merge!({ name: 'Carl', surname: 'Carlovsky',
               patronymic: 'Carlovich', email: 'carl@mail.ru',
               nationality: 'russian', gender: 'male',
               country: 'russia', age: 56 })

    expect(outcome).to be_valid
    expect(result).to be_a User
  end

  it 'creates with interests, skills' do
    interests = Interest.create([{name: 'Bowling'}, {name: 'Tennis'}])
    skills = Skill.create([{name: 'Stress resistance'}, {name: 'Fast learnability'}])
    inputs.merge!({ name: 'Carl', surname: 'Carlovsky',
                    patronymic: 'Carlovich', email: 'carl@mail.ru',
                    nationality: 'russian', gender: 'male',
                    country: 'russia', age: 56,
                    interests: %w[Bowling Tennis],
                    skills: 'Stress resistance,Fast learnability' })
    expect(outcome).to be_valid
    expect(result.interests).to match_array(interests)
    expect(result.skills).to match_array(skills)
  end
end
