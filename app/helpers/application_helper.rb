module ApplicationHelper
    def title (name, show_title = true)
        @show_title = show_title
        content_for(:title) do
            name
        end
    end
end
