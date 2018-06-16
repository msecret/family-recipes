Types::IngredientType = GraphQL::ObjectType.define do
  name 'Ingredient'
  description 'The type of thing plus the amount and unit'

  field :id, !types.ID
  field :amount, types.String, 'The amount of the ingredient'
  field :unit, types.String, 'The unit for the amount'
  field :numerator, types.Int, 'The numerator for the fraction of the amount'
  field :denominator, types.Int, 'The denominator for fraction of the amount'
  field :number, types.Int, 'The main number for the fraction of the amount'

  field :name do
    type types.String
    description 'Name of the ingredient'
    resolve -> (obj, args, ctx) {
      obj.ingredient.name
    }
  end

  field :extra do
    type types.String
    description 'Any extra information about the ingredient'
    resolve -> (obj, args, ctx) {
      obj.ingredient.extra
    }
  end

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
