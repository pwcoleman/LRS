# encoding: UTF-8
module Cluster
  class DeleteActivityProfile

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['primers'] = [
              Request::SaveActivityProfile.build(lrs, 'typical')
          ]
          request['main'] = Request::DeleteActivityProfile.build(lrs, 'typical')
          request['verify'] = Request::RetrieveActivityProfile.build(lrs, 'typical')
      end

      request
    end
  end
end