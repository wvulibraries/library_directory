# default application helper
module ApplicationHelper
  # pass prefixes to views
  def name_prefixes
    I18n.t('names.prefix')
  end

  # pass suffixes to views
  def name_suffixes
    I18n.t('names.suffix')
  end

  # us states
  def us_states
    abbr = I18n.t('address.state_abbr')
    states = I18n.t('address.state')
    Hash[abbr.zip(states)]
  end

  # dynamically add fieldsets
  # setup from rails casts
  def link_to_add_fields(name, form, association)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, form: builder)
    end
    link_to(name, '#', class: 'add-fields', data: { id: id, fields: fields.gsub("\n", "") })
  end
end
