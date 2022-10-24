module ApplicationHelper
    def title (name, show_title = true)
        @show_title = show_title
        content_for(:title) do
            name
        end
    end
    
    def flash_class(level)
        case level
            when "notice" then "alert alert-primary"
            when "success" then "alert alert-success"
            when "error" then "alert alert-error"
            when "alert" then "alert alert-info"
        end
    end
    
end
