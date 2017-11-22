Refinery::Admin::DialogsController::TYPES << 'video'
Refinery::Admin::DialogsController.prepend(
  Module.new do
    def find_iframe_src
      if @dialog_type == 'video'
        @iframe_src = refinery.insert_videos_admin_videos_path url_params.merge(:dialog => true)
      else
        super
      end
    end
  end
)