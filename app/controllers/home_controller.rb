class HomeController < ApplicationController
  def index
    session_id = request.session_options[:id]
    logger.debug 'Session Id: ' + session_id
    user_score = UserScore.where(:session_id => session_id)
    if user_score.count > 0
      max_score = user_score.max { |a,b| a.score <=> b.score }
      logger.debug 'Index#Home#MaxScoreCharId: ' + max_score.character_id.to_s
      logger.debug 'Index#Home#MaxScore: ' + max_score.score.to_s
      questions_answered = UserAnswer.select(:question_id).where(:session_id => session_id).map(&:question_id)
      questions_from_character = Answer.select(:question_id).where(:character_id => max_score.character_id).map(&:question_id)

      new_questions_id = questions_from_character - questions_answered
      
      if new_questions_id.count == 0
        redirect_to '/answers'
      else
        new_id = new_questions_id[rand(0..new_questions_id.count-1)]
        @question = Question.where(:id => new_id).first
      end

      
      

    else
      logger.debug 'Pergunta randomica'
      @character_id = 0
      @question = Question.offset(rand(Question.count)).first 
    end
  end
end
