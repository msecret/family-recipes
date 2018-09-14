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

  field :category, Types::CategoryType do
    description 'Retreive a category by name'

    argument :name, !types.String, 'The name (not display) of the category'

    resolve -> (obj, args, ctx) {
      Category.where(name: args['name']).take
    }
  end

  field :categories, types[Types::CategoryType] do
    description "Retrieve all categories"

    resolve -> (obj, args, ctx) {
      Category.order(order: :asc)
    }
  end

  field :recipe, Types::RecipeType do
    description 'Retreive a recipe by id'

    argument :id, !types.ID, "The ID of the recipe"

    resolve -> (obj, args, ctx) {
      Recipe.find(args[:id])
    }
  end

  field :recipes, types[Types::RecipeType] do
    description "Retrieve all recipes"

    argument :categoryName, types.String, "Name of category"

    resolve -> (obj, args, ctx) {
      category = Category.find_by(name: args[:categoryName])
      if category
        Recipe.where(category: category)
      else
        Recipe.all.limit(1)
      end
      # TODO: what if the category wasn't found?
    }
  end
end
