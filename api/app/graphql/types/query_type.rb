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
end
