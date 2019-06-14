class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
    end
    def conversation
        #muestra mensajes anteriores y da la posibilidad  de escribir uno nuevo
        #en caso de enviar uno nuevo, llamar a create
        @usr = User.all
        @u1 = 1#por mientras, se ingresa el id del usuario actual
        u2 = 2#va con @selected chat de chats, chat lleva a conversation, con un click listener
        @message = Message.where(:sender_id => @u1, :receiver_id => u2).or(Message.where(:sender_id => u2, :receiver_id => @u1)).order(:created_at)# OR sender_id = u2, receiver_id = u1).order(:created_at)
        
    end

    def chats
        #mustra los chats que se han realizado con otros usuarios
        @usr = User.all
        @selected_chat = 2
        chats = Message.where(sender_id = @u1).or(Message.where(receiver_id = @u1))
        @u3 = []
        @u3_nick = []
        chats.each do |ch|
            if ((ch.sender_id != @u1) and (!(ch.sender_id.in?(chats))))
                @u3.push(ch.sender_id)
                @u3_nick.push(User.find_by(:id => ch.sender_id).nick)
            elsif (ch.receiver_id != @u1) and !(ch.receiver_id.in?(chats))
                @u3.push(ch.receiver_id)
                @u3_nick.push(User.find_by(:id => ch.receiver_id).nick)
            end
        #en el view hacer bucle sobre chats, clickeables mostrando el nombre
        @lin = @u3.length
        end
    end

    def new
        #crea y muestra la vista de un nuevo mensaje

    end
    def message_params
        params.require(:message).permit(:sender_id, :receiver_id, :message)
    end
end
