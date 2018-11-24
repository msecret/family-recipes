Types::RecipeType = GraphQL::ObjectType.define do
  name 'Recipe'
  description 'A recipe to make a dish of food'

  field :id, !types.ID
  field :title, !types.String, 'Title of the recipe'
  field :description, !types.String, 'The description of the recipe'
  field :memorandums, types.String, 'Any memoradums for the recipe'
  field :difficulty, types.Int, 'How difficult the recipe is to make'
  field :serves, types.Int, 'How many people it serves'
  field :story, types.String, 'The potential story behind the recipe'

  field :image, Types::ImageType, 'The main picture of the recipe'
  field :category, Types::CategoryType, 'The category the recipe belongs to'
  field :cooks, types[Types::CookType], 'A picture of the cook'

  field :ingredients do
    type types[Types::IngredientType]
    description 'All the ingredients to make the recipe'
    resolve ->(obj, _args, _ctx) {
      obj.ingredient_amounts
    }
  end

  field :preparationTime do
    type types.Int
    description 'Amount of time to prepare the recipe'
    resolve ->(obj, _args, _ctx) {
      obj.preparation_time
    }
  end

  field :cookingTime do
    type types.String
    description 'Amount of time to cook the recipe'
    resolve ->(obj, _args, _ctx) {
      obj.cooking_time
    }
  end

  field :mainPhotoUrl do
    type types.String
    description 'The URL of the main photo, a shortcut'
    resolve ->(obj, _args, _ctx) {
      obj.main_photo_url
    }
  end

  field :updatedAt do
    type types.Int

    resolve ->(obj, _args, _ctx) {
      obj.updated_at.to_i
    }
  end
  field :createdAt do
    type types.Int

    resolve ->(obj, _args, _ctx) {
      obj.created_at.to_i
    }
  end
end
