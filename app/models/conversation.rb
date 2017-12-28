class Conversation < ApplicationRecord
	belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
 	belongs_to :reciever, :foreign_key => :reciever_id, class_name: 'User'

	has_many :messages, dependent: :destroy
	validates_uniqueness_of :sender_id, :scope => :reciever_id
end
