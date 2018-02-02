Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :image, Types::ImageType do
    description "Retrieve image by id"

    argument :id, !types.ID, "The ID of the image"

    resolve -> (obj, args, ctx) {
      Image.find(args[:id])
    }
  end

  field :images, types[Types::ImageType] do
    description "Retrieve all images"

    resolve -> (obj, args, ctx) {
      Image.all
    }
  end

  field :cook, Types::CookType do
    description 'Retreive a cook by id'

    argument :id, !types.ID, 'The id of the cook'

    resolve -> (obj, args, ctx) {
      Cook.find(args[:id])
    }
  end

  field :cooks, types[Types::CookType] do
    description "Retrieve all cooks"

    resolve -> (obj, args, ctx) {
      Cook.all
    }
  end
end
