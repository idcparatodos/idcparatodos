module RegistrosHelper
  def valor_com_tipo registro
    case registro.tipo
    when "int"
      content_tag :span, registro.valor.to_i, class: ""
    when "float"
      content_tag :span, registro.valor.to_f, class: ""
    when "string"
      content_tag :span, registro.valor.inspect, class: "font-medium"
    when "boolean"
      if registro.valor == "true"
        content_tag :span, "true", class: "text-green-900"
      else
        content_tag :span, "false", class: "text-red-900"
      end
    end
  end
end
