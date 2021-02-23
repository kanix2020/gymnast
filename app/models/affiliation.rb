class Affiliation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '東海大学九州' },
    { id: 3, name: '熊本学園大附属高校' },
    { id: 4, name: '東海大学附属星翔高校' },
    { id: 5, name: 'DoChallengeClub' },
    { id: 6, name: 'YMCA' },
  ]

  include ActiveHash::Associations
  has_many :athletes
end
