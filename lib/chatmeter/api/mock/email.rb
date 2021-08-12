module Chatmeter
  class API
    module Mock
      email_response_body = {
        "templateType": "email",
        "accountId": "5a56bc4d01f0c9b909f3a82c",
        "deleted": false,
        "name": "GMB Reviews Email Template - Karl Hungus Productions",
        "dynamicFields": {
          "text:subheading": "Click below to submit your review",
          "text:heading": "Your opinion matters!",
          "text:buttonText": "Submit Review",
          "text:gmbUrl": "http://k-hungus.net",
          "image:logo": "https://cm-review-builder.s3.amazonaws.com/userImages/5a56bc/346d2.png",
          "text:rightContent": "We hope you enjoyed your experience with us.",
          "text:rightHeading": "Thanks for visiting!",
          "text:leftContent": "Your suggestions are important to us",
          "text:leftHeading": "Help us improve",
          "text:copyright": "© 2020 Luke Skywalker",
          "text:disclaimer": "Information entered into this form...",
          "text:streetAddress": "2880 Broadway Street New York NY"
        },
        "creatorId": "5a9860fab8d048edbdeda616",
        "theme": "Navy",
        "_id": "5f4e59e15d962523aaf562a1",
        "content": "<!DOCTYPE html><html></html>",
        "isShared": false
      }

      # POST /reviewBuilder/emailTemplate
      Excon.stub(expects: 201, method: :post, path: '/v5/reviewBuilder/emailTemplate') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: email_response_body,
          status: 201
        }
      end

      # stub GET /reviewBuilder/emailTemplate/{templateId}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/reviewBuilder/emailTemplate/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: email_response_body,
          status: 200
        }
      end

      # stub POST /reviewBuilder/emailTemplate/{templateId}
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/reviewBuilder/emailTemplate/([^/]+)$}) do |params|
        params = JSON.parse(params[:body])
        {
          body: 
          {  
            "_id": "574e330cd4c6c9beb42c4ebd",
            "name": "newEmailTemp",
            "content": "<html>Html is here</html>",
            "templateType": "email",
            "accountId": "56a184a6d4c61f5267b3f386",
            "deleted": false,
            "dateAdded": 1464742668274 
          },
          status: 200
        }
      end
    end
  end
end
