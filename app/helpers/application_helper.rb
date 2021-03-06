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

  # logged in user
  def logged_in?
    !!(session['cas'] && session['cas']['user'])
  end

  # get current user for views
  def current_user
    User.where(wvu_username: session['cas']['user']).first if logged_in? && user_exists? 
  end

  # does the user exist? 
  def user_exists? 
    User.where(wvu_username: session['cas']['user']).exists?
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

  # phone logic helper 
  def phone_icon_class(phone)
    if phone.number_types == 'fax'
      'fas fa-fax'
    else
      'fas fa-mobile-alt'
    end
  end

  def title(text)
    content_for(:title) { text }
  end


  def description(text)
    content_for(:meta_description) { text }
  end

  def keywords(text)
    content_for(:meta_keywords) { text }
  end

  def last_updated
    get_dates if session[:last_updated].nil?
    session[:last_updated].to_date.strftime('%B %d, %Y')
  end

  def get_dates
    updated_date = [Employee.maximum(:created_at), Employee.maximum(:updated_at)].max
    if updated_date.nil?
      session[:last_updated] = DateTime.now
    else
      session[:last_updated] = updated_date
    end
  end
end
