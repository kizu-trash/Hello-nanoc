include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Filtering
include Nanoc3::Helpers::Breadcrumbs
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Blogging

class HTMLCodeStyle < Nanoc3::Filter
  identifier :htmlcodestyle
  type :text
  
  def run(content, params={})
    result = content
    
    # Replace all single-quoted attributes to double-quoted
    result.gsub!(/=\'([^\'\"]+)\'/, '="\1"') #'

    # Remove underscores and make IDs CamelCased if there are no Uppercases in id
    result.gsub!(/(<html)? id="_*([^"A-Z]*)"/){
      if !$1
        ' id="' + $2.split("_").collect{|x|x.capitalize}.join() + '"'
      else
        $1 + ' id="' + $2 + '"'
      end
    }
    
    # Tabs to spaces (minus one tag for beautier indent)
    result.gsub!(/^((  )+)/){
      ' ' * ($1.length/2-1)
    }

    return result
  end
end

class BEMgenerator < Nanoc3::Filter
  identifier :bem
  type :text
  
  def run(content, params={})
    result = content
    
    # Find out how to make it into erb from html or smth like that
    result.gsub!(/<%([\w_-]+)([^%]*)%>/){
      "<% render 'blocks/"+$1+"' "+$2+" do %>"
    }
    result.gsub!(/%(b-link)(.*)$/){
      "=render 'blocks/"+$1+"' "+$2+" do"
    }
    return result
  end
end
