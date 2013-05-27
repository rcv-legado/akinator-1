ActiveAdmin.register Answer do
  form do |f|
      f.inputs "Details" do
        f.input :character, as: :select, collection: Character.all # Use formtastic to output my collection of checkboxes
        f.input :question, as: :select, collection: Question.all # Use formtastic to output my collection of checkboxes
        f.input :result
      end
      f.actions
  end

  index do
    column :character
    column :question
    column :result
    actions
  end
end
