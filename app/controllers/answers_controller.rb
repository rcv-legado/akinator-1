class AnswersController < ApplicationController

  def create_answer(session_id, question_id, answer)
    if answer == "S"
      user_answer = UserAnswer.create(:session_id => session_id, 
                                      :question_id => question_id,
                                      :response => 1)
    else
      user_answer = UserAnswer.create(:session_id => session_id, 
                                      :question_id => question_id,
                                      :response => 0)
    end
  end

  def create_score(session_id, question_id, answer)
    if answer == "S"
      ans = Answer.where(:question_id => question_id)
      ans.each do |ansdb|
        user_score = UserScore.where(:session_id => session_id)
                              .where(:character_id => ansdb.character_id)
                              .first
        if user_score == nil
          UserScore.create(:session_id => session_id,
                         :character_id => ansdb.character_id,
                         :score => 1)
        else
          user_score.score = user_score.score + 1
          user_score.save
        end
      end
    end
    
    if answer == "N"
      ans = Answer.where(:question_id => question_id)
      ans.each do |ansdb|
        user_score = UserScore.where(:session_id => session_id)
                            .where(:character_id => ansdb.character_id)
                            .first
        if user_score != nil && user_score.score > 0
          user_score.score = user_score.score - 1
          user_score.save
        end
      end
    end
  end

  def index
    session_id = request.session_options[:id]
    user_score = UserScore.where(:session_id => session_id)
    max_score = user_score.max { |a,b| a.score <=> b.score }
    @character = Character.where(:id => max_score.character_id).first

  end

  def create
    answer = request[:user][:answer]
    question_id = request[:question_id]
    session_id = request.session_options[:id]
    
    create_answer(session_id, question_id, answer)
    create_score(session_id, question_id, answer)
    redirect_to root_path
  end

  def destroy
    session_id = request.session_options[:id]
    UserScore.delete_all(:session_id => session_id)
    UserAnswer.delete_all(:session_id => session_id)
    redirect_to root_path
  end
end
