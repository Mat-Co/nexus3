CREDS = { user: 'admin', pass: 'admin123' }.freeze
SCRIPT_API = 'http://localhost:8081/service/rest/v1/script'.freeze
JSON_HEADERS = { 'Content-Type' => 'application/json' }.freeze
TEXT_HEADERS = { 'Content-Type' => 'plain/text' }.freeze

def nexus3_json_script_http(endpoint, data)
  require 'json'
  nexus3_script_http(endpoint, data.to_json, JSON_HEADERS)
end

def nexus3_script_http(endpoint, data, headers = TEXT_HEADERS)
  http("#{SCRIPT_API}/#{endpoint}", auth: CREDS, method: 'POST', headers: headers, data: data)
end
