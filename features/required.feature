Feature: Core schema: required
  Scenario: default false 
    When the schema is:
      """
      {
          "properties": {
              "color": { 
                  "type": "string"
              }
          }
      }
      """
    Then '{}' is valid JSON

    When the schema is:
      """
      {
          "properties": {
              "color": {
                  "type": "string",
                  "required": false
              }
          }
      }
      """
    Then '{}' is valid JSON
    Then '{ "color": "red" }' is valid JSON

  Scenario: true
    When the schema is:
      """
      {
          "properties": {
              "color": {
                  "type": "string",
                  "required": true
              }
          }
      }
      """
    Then '{ "color": "red" }' is valid JSON
    But '{}' is not valid JSON
    And '{ "age": 24 }' is not valid JSON

  Scenario: true for boolean value
    When the schema is:
      """
      {
          "properties": {
              "enabled": {
                  "type": "boolean",
                  "required": true
              }
          }
      }
      """
    Then '{ "enabled": false }' is valid JSON
    But '{}' is not valid JSON
    And '{ "age": 24 }' is not valid JSON
