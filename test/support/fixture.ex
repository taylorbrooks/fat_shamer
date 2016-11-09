defmodule FatShamer.Fixture do
  def weight_hook do
    %{
      "AccountSid" => "My-Account-Sid",
      "ApiVersion" => "2010-04-01",
      "Body" => "175",
      "From" => "+15555555555",
      "FromCity" => "PORTLAND",
      "FromCountry" => "US",
      "FromState" => "ME",
      "FromZip" => "04101",
      "MessageSid" => "SMb9ef4379773d0515b906ea007d5a3934",
      "NumMedia" => "0",
      "NumSegments" => "1",
      "SmsMessageSid" => "some-SmsMessageSid",
      "SmsSid" => "some-SmsSid",
      "SmsStatus" => "received",
      "To" => "+17196666666",
      "ToCity" => "",
      "ToCountry" => "US",
      "ToState" => "CO",
      "ToZip" => ""
    }
  end

end
