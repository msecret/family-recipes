Types::ImageType = GraphQL::ObjectType.define do
  name 'Image'
  description 'An image that exists on the site, usually belonging to another'

  field :id, !types.ID
  field :name, !types.String, 'A short name for the image'
  field :url, !types.String, 'The url the image can be found at'
  field :widthOrig, types.Int, 'The original width of the image in px'
  field :heightOrig, types.Int, 'The original height of the imagen in px'
  field :width, types.Int, 'A possible modified width of the image in px'
  field :height, types.Int, 'A possible modified height of the image in px'
  field :alt, types.String, 'The alt text for an image'
end
