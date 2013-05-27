ActiveAdmin.register UserAnswer do
  form do |f|
      f.inputs "Details" do
        f.input :session_id        
        f.input :question, as: :select, collection: Question.all # Use formtastic to output my collection of checkboxes
        f.input :response
      end
      f.actions
  end  
end
