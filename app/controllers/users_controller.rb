class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Sasha',
        username: 'alexsevv',
        avatar_url: 'https://pp.userapi.com/c320624/v320624310/42cc/kema8ELCG4k.jpg'
      ),
      User.new(
        id: 2,
        name: 'Nastya',
        username: 'Nastya',
        avatar_url: 'https://pp.userapi.com/c617128/v617128278/6ab1/Hd3YV5kd5Xk.jpg'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Alex',
      username: 'Alexsevv',
      #avatar_url: 'https://pp.userapi.com/c320624/v320624310/42cc/kema8ELCG4k.jpg'
      )

    @questions = [
      Question.new(text: 'как дела?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'что смотришь?', created_at: Date.parse('27.04.2016'))
    ]

    @new_question = Question.new
  end
end
