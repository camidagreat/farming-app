module ApplicationHelper

  def google_map(center, lat, lng)
    center_string = lat.to_s + "," + lng.to_s
    return "https://maps.googleapis.com/maps/api/staticmap?center=#{center_string}&size=300x300&zoom=16&markers=color:red%7Clabel:%7C#{lat},#{lng}&key=AIzaSyDl9Xvml9nUYzG62Bbnxo9OA5EcD-wfQMA"
  end

end
