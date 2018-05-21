module ApplicationHelper

	# def link_to_add_fields(name, f, association)
 #    new_object = f.object.send(association).klass.new
 #    id = new_object.object_id
 #    fields = f.fields_for(association, new_object, child_index: id) do |builder|
 #      render(association.to_s.singularize + "_fields", f: builder)
 #    end
 #    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
 #  end

  # def link_to_add_row(name, f, association, **args)
  #   new_object = f.object.send(association).klass.new
  #   id = new_object.object_id
  #   fields = f.fields_for(association, new_object, child_index: id) do |builder|
  #     render(association.to_s.singularize, f: builder)
  #   end
  #   link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  # end

  # f is a form object
    def link_to_add_fields(name, f, association, opts={})
      # creaate a new object given the form object, and the association name
      new_object = f.object.class.reflect_on_association(association).klass.new

      # call the fields_for function and render the fields_for to a string
      # child index is set to "new_#{association}, which would then later
      # be replaced in in javascript function add_fields
      fields = f.fields_for(association,
          new_object,
          :child_index => "new_#{association}") do |builder|
        # render partial: _task_fields.html.erb
        render(association.to_s.singularize + "_field", f: builder)
      end

      # call link_to_function to transform to a HTML link
      # clicking this link will then trigger add_fields javascript function
      link_to_function(name,
        h("add_fields(this,
          \"#{association}\", \"#{escape_javascript(fields)}\");return false;"),
        class: 'btn btn-success')
    end

    def link_to_function(name, js, opts={})
      link_to name, '#', opts.merge({onclick: js})
    end

    # checks current)user_followings
    def current_user_is_following(current_user_id, followed_user_id)
      relationship = Follow.find_by(follower_id: current_user_id, following_id: followed_user_id)
      return true if relationship
    end
end
