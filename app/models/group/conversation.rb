class Group::Conversation < ApplicationRecord
  self.table_name = 'group_conversations'

  has_and_belongs_to_many :users
  has_many :messages,
            class_name: "Group::Message",
            goreign_key: 'conversation_id',
            dependent: :destroy
end


