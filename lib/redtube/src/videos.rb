require 'redtube/redtube'

module Redtube
   class Videos
    #  Set of methods to request info about vídeos from YoupornAPI
    #
    # Example:
    #   >> params = {category: "lorem", page 3}
    #   >> videos =  Redtube::Videos.new
    #   >> videos.search params

     include Redtube::Base

     def search(params)
       @@params.merge!(params)
       run_to_api "redtube.Videos.searchVideos"
     end
#   Method self.get_video
#   >> id = 1234
#   >> video.get_video id
#   => {"video"=>{"duration"=>"1:18", "views"=>2974098 ...
     def get_video(id, thumbsize = "all")
       @@params[:video_id] = id
       @@params[:thumbsize] = thumbsize
       run_to_api "redtube.Videos.getVideoById"
     end

     def is_active?(id)
       @@params[:video_id] = id
       result = run_to_api "redtube.Videos.isVideoActive"
       if result["active"] && result["active"]["is_active"] == 1
         return true
       else
         return false
       end
     end
#    Method embed
#     Return the code to embed source video
#     >> v.embed  id=1
#     => {"embed"=>{"code"=>"PGlmcmFtZSBzcmM9Imh0dHBzOi8vZW1iZWQucmVkdHViZS5jb20vP2lkP....
     def embed(id)
       if is_active? id
         run_to_api "redtube.Videos.getVideoEmbedCode"
       else
         return false
       end
     end

  # End class
   end
# End module
end
