module PagesHelper

    def user_logged_in
        if current_user 
            'pages/index/side_menu/login_required_links'
        else
            'pages/index/side_menu/no_login_required_links'
        end
    end
end
