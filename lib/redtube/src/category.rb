require_relative "base"

module Redtube
  class Categories
    include Redtube::Base

    def list
      run_to_api "redtube.Categories.getCategoriesList"
    end
  end

  class Tag
    include Redtube::Base

    def list
      run_to_api "redtube.Tags.getTagList"

    end
  end

  class Star
    include Redtube::Base

    def list
      run_to_api "redtube.Stars.getStarList"
    end

    def list_detailed
      run_to_api "redtube.Stars.getStarDetailedList"
    end
  end
end
