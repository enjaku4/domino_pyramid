module Actions
  module ProcessBoneSelection
    def self.run(event)
      clickable_area = Store::ClickableAreas.find_clicked(event.x, event.y)
      clickable_area.bone.toggle_selection! if clickable_area
    end
  end
end
