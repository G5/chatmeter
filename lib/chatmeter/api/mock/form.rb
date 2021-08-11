module Chatmeter
  class API
    module Mock
      form_response_body = {
        "template": "<html>Form Template</html>",
        "accountId": "5eab44b50fc2a21c6065ebf2",
        "deleted": false,
        "thankYouTemplate": "<html></html>",
        "name": "GMB Reviews - Karl Hungus Productions",
        "dynamicFields": {
          "text:detailQuestion"=>"Is there any feedback you would like to give us?",
          "text:heading": "Leave a Review for us on Google",
          "toggle:showReviewOnThankYouPage": "false",
          "text:gmbUrl": "http://k-hungus.net",
          "text:ratingQuestion": "How would you rate your experience?",
          "text:submitText": "Submit",
          "text:starSelect": "(Select 1-5 stars)"
        },
        "creatorId": "5a9860fab8d048edbdeda616",
        "featureTags": [],
        "_id": "5f4e59df4d43d55c51a742a4",
        "dateAdded": 1598970335,
        "isShared": false
        }

      # POST /reviewBuilder/form/create
      Excon.stub(expects: 201, method: :post, path: '/v5/reviewBuilder/form/create') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: form_response_body,
          status: 201
        }
      end

      # stub GET /reviewBuilder/form/get/{formId}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/reviewBuilder/form/get/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: form_response_body,
          status: 200
        }
      end

      # stub PUT /reviewBuilder/form/{formId}
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/reviewBuilder/form/([^/]+)$}) do |params|
        params = JSON.parse(params[:body])
        {
          body: 
          {  
            "_id": "574e182ed4c6c9beb42c4e14",
            "name": "Updated Form",
            "template":  "\n<!doctype html>\n<html>\n<body>New Form</body>\n</html>\n",
            "thankYouTemplate": "\n<!doctype html>\n<html>\n<body>Thanks!</body>\n</html>\n",
            "accountId": "56a184a6d4c61f5267b3f386",
            "dateAdded": 1464735790275,
            "deleted": false
          },
          status: 200
        }
      end
    end
  end
end
