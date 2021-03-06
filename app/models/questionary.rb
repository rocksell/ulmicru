class Questionary < Member
  validates :experience, presence: true
  validates :want_to_do, presence: true

  include QuestionaryScopes

  state_machine :state, initial: :unviewed do
    state :unviewed
    state :confirmed
    state :declined
    state :on_the_trial
    state :removed

    event :confirm do
      transition all => :confirmed
    end
    event :decline do
      transition all => :declined
    end
    event :put_on_the_trial do
      transition all => :on_the_trial
    end
    event :remove do
      transition all => :removed
    end
    event :restore do
      transition removed: :unviewed
    end
  end
end
