module ApplicationHelper


def action_type
    
   if action_name == "new" 
    return "Crear"
else
     return "Editar"
    end
end


def get_clase_event(event,id)

  return event ? portal_show_path(id) : portal_show_video_path(id) 
  
end

def portal_background

    return Account.where(domain: request.subdomain).first.background_stream_url
    
end


def get_account

    return Account.where(admin_user: current_user.admin_user).first.id
    
end

def get_aov(x)
 puts x.nil?
 puts x
 puts "+++++++++++++++++++++++++++++++++++++++++"
  return !x.nil? ? '<i class="fa fa-check" aria-hidden="true"></i>' : '<i class="fa fa-times" aria-hidden="true"></i>
'

end
def get_state(x)

  return x == true ? '<i class="fa fa-check" aria-hidden="true"></i>' : '<i class="fa fa-times" aria-hidden="true"></i>
'

end

def get_event_type(x)

  return x ? '<i class="fa fa-volume-up" aria-hidden="true"></i>' : '<i class="fa fa-video-camera" aria-hidden="true"></i>'

end

#convierte la fecha a un formato mas amigable
def get_date(fecha)
   
if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Enero", "02" => "Febrero","03"=>"Marzo","04" => "Abril", "05" => "Mayo","06"=> "Junio" ,"07"=> "Julio", "08" => "Agosto", "09"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    dias = {"1" => "Domingo", "2" => "Lunes","3"=>"Martes","4" => "Miercoles", "5" => "Jueves","6"=> "Viernes" ,"0" =>"Sabado"}
    fecha.min < 10 ? min = "0" : min = ""
    fecha.hour < 10 ? hora = "0" : hora = ""
    return  meses[m].upcase + " " + dm + ", " + y  + ", " + hora + fecha.hour.to_s + ":" + min + fecha.min.to_s 
#dias[ds] + ", " +
end 
end

def get_date_array(fecha)
   
if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    yi = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Enero", "02" => "Febrero","03"=>"Marzo","04" => "Abril", "05" => "Mayo","06"=> "Junio" ,"07"=> "Julio", "08" => "Agosto", "09"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    dias = {"1" => "Domingo", "2" => "Lunes","3"=>"Martes","4" => "Miercoles", "5" => "Jueves","6"=> "Viernes" ,"0" =>"Sabado"}
    fecha.min < 10 ? min = "0" : min = ""
    fecha.hour < 10 ? hora = "0" : hora = ""
    
    date = Array.new
    tipo = fecha.hour > 12 ? "pm" : "am"
    horat = fecha.hour > 12 ?   fecha.hour - 12 : fecha.hour
    horas  = hora + horat.to_s + ":" + min + fecha.min.to_s + " "+ tipo
    date = [dm, dias[ds], meses[m].upcase ,m  ,yi , horas]
    return date
#dias[ds] + ", " +
end 
end




#muestra los mensajes de bootstrap
def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

 #Traduce la paginacion 
  def page_entries_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'Reporte' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No hay #{entry_name.pluralize} registrados"
    else; %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
    end
  else
    %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
  end
end
end
