module LeanKitKanban
  module TaskBoard
    include HTTParty
    include LeanKitRequest

    FIND_TASK_BOARD = '/v1/Board/{boardID}/Card/{cardID}/TaskBoard'

    def self.find(board_id, card_id)
      api_call = FIND_TASK_BOARD.gsub('{boardID}', board_id.to_s).gsub('{cardID}', card_id.to_s)
      get(api_call)
    end
  end
end
