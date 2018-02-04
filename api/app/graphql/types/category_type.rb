Types::CategoryType = GraphQL::ObjectType.define do
  name 'Category'
  description 'A recipe category, such as appetiser or dessert'

  field :id, !types.ID
  field :name, !types.String, 'A unique,  lowercased identifier used for urls'

  field :displayName do
    type types.String
    description 'The display name of the category to show in the UI'
    resolve -> (obj, args, ctx) {
      obj[:display_name]
    }
  end

  field :order do
    type types.Int
    description 'A unique ordering for the category to display'
    resolve -> (obj, args, ctx) {
      obj[:order]
    }
  end

  field :iconName do
    type types.String
    description 'The name of the icon for the category to show in UI'
    resolve -> (obj, args, ctx) {
      obj.icon_name
    }
  end
end
