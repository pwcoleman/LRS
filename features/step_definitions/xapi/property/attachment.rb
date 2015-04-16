# encoding: UTF-8
module Property
  class Attachment
    def self.build(type)
      attachment = {}
      case type
        when 'text'
          attachment['statementMetadata'] = {
              usageType: 'http://id.tincanapi.com/attachment/supporting_media',
              display: {
                  'en-US' => 'Text attachment'
              },
              contentType: 'text/plain',
              length: 18,
              sha2: 'bd1a58265d96a3d1981710dab8b1e1ed04a8d7557ea53ab0cf7b44c04fd01545'
          }
          attachment['content'] = 'some text content'
        when 'JSON'
          attachment['statementMetadata'] = {
              usageType: 'http://id.tincanapi.com/attachment/supporting_media',
              display: {
                  'en-US' => 'JSON attachment'
              },
              contentType: 'application/json',
              length: 60,
              sha2: 'f4135c31e2710764604195dfe4e225884d8108467cc21670803e384b80df88ee'
          }
          attachment['content'] = "{\"propertyA\":\"value1\",\"propertyB\":\"value2\",\"propertyC\":true}"
        when 'fileUrlOnly'
          attachment['statementMetadata'] = {
              usageType: 'http://id.tincanapi.com/attachment/supporting_media',
              display: {
                  'en-US' => 'FileUrl Only attachment'
              },
              contentType: 'application/octet-stream',
              length: 65556,
              sha2: 'd14f1580a2cebb6f8d4a8a2fc0d13c67f970e84f8d15677a93ae95c9080df899',
              fileUrl: 'http://tincanapi.com/conformancetest/attachment/fileUrlOnly'
          }
      end
      attachment
    end
  end
end