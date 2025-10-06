def coffee_params
  params.require(:coffee).permit(
    :name, 
    :roaster, 
    :origin, 
    :roast_level, 
    :tasting_notes, 
    :rating, 
    :website_url, 
    :date_tried,
    :image
  )
end
