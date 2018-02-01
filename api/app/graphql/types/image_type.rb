Types::ImageType = GraphQL::ObjectType.define do
  name 'Image'
  description 'An image that exists on the site, usually belonging to another'

  field :id, !types.ID
  field :name, !types.String, 'A short name for the image'
  field :url, !types.String, 'The url the image can be found at'

  field :widthOrig do
    type types.Int
    description 'The original width of the image in px'
    resolve -> (obj, args, ctx) {
      obj.width_orig.to_i
    }
  end
  field :heightOrig do
    type types.Int
    description 'The original height of the image in px'
    resolve -> (obj, args, ctx) {
      obj.height_orig.to_i
    }
  end
  field :width, types.Int, 'A possible modified width of the image in px'
  field :height, types.Int, 'A possible modified height of the image in px'
  field :alt, types.String, 'The alt text for an image'
  field :updatedAt do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.updated_at.to_i
    }
  end
  field :createdAt do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.created_at.to_i
    }
  end
end
