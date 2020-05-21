class StaticController < ApplicationController 
    skip_before_action :verify, only: [:home]
    def home 

    end

end