Types::CookType = GraphQL::ObjectType.define do
  name 'Cook'
  description 'A cook that is making food'

  field :id, !types.ID
  field :email, !types.String, 'Email of the cook'
  field :location, types.String, 'The city the cook is from or lives'

  field :image, Types::ImageType, 'A picture of the cook'

  field :firstName do
    type types.String
    description 'The first name of the cook'
    resolve -> (obj, args, ctx) {
      obj.first_name
    }
  end

  field :lastName do
    type !types.String
    description 'The last name of the cook'
    resolve -> (obj, args, ctx) {
      obj.last_name
    }
  end

  field :fullName do
    type !types.String
    description 'The full name of the cook'
    resolve -> (obj, args, ctx) {
      obj.first_name + ' ' + obj.last_name
    }
  end

  field :dateOfBirth do
    type types.String
    description 'The date the book was born'
    resolve -> (obj, args, ctx) {
      obj.date_of_birth
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
