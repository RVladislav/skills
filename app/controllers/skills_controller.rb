class SkillsController < ApplicationController
  unloadable



  def index
  @userWelcome = User.current
	
	@skillsAll = SkillsTerc.all#Все скилы
	@skillsCurrent = UskillsTerc.where(id_users: User.current.id)#Скилы текущего пользователя
  end

  def skills_add_admin
    if params[:post][:newSkill] != ''#Проверка на наличие параметров
    	@skill = SkillsTerc.new
    	@skill.name = params[:post][:newSkill]
    	@skill.save #Сохранение нового скила в список
    	flash[:notice] = 'Done'   
	end
	redirect_to :action => 'index'  # Возврат на главную 
  end

  def skills_find
    @skillsAll = SkillsTerc.all
    @userSK = Array.new
    @skillsSK = Array.new
    i=0
    if params[:post] != nil
      @skillsAll.each do |st|
        if params[:post][st.id.to_s()] == '1'

        end
      end  
    end
  end

  def skills_add
  	@skillsAll = SkillsTerc.all#Все скилы
  	if params[:post] != nil
  		@skillsAll.each do |st|
  		if params[:post][st.id.to_s()] == '1'#Проверка на выбранный элемент
  			@check = UskillsTerc.where(id_users: User.current.id, id_skills: st.id)#Фильтр на текущего пользователя и текущий выбранный скилл
  			if @check.count == 0#Если его нет и он выбран - добавить
  				UskillsTerc.create(id_users: User.current.id, id_skills: st.id)
  			end  			
  		else# Если он есть и не выбран - удалить
  			UskillsTerc.where(id_users: User.current.id, id_skills: st.id).each do |del|
  				UskillsTerc.destroy(del.id)
  			end
  		end
  	end 
	flash[:notice] = 'You have new skills'
	redirect_to :action => 'index'   	 			
  	end
  end

end
