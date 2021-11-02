<?php
// This file was auto-generated from sdk-root/src/data/iotevents-data/2018-10-23/api-2.json
return [ 'version' => '2.0', 'metadata' => [ 'apiVersion' => '2018-10-23', 'endpointPrefix' => 'data.iotevents', 'protocol' => 'rest-json', 'serviceFullName' => 'AWS IoT Events Data', 'serviceId' => 'IoT Events Data', 'signatureVersion' => 'v4', 'signingName' => 'ioteventsdata', 'uid' => 'iotevents-data-2018-10-23', ], 'operations' => [ 'BatchPutMessage' => [ 'name' => 'BatchPutMessage', 'http' => [ 'method' => 'POST', 'requestUri' => '/inputs/messages', 'responseCode' => 200, ], 'input' => [ 'shape' => 'BatchPutMessageRequest', ], 'output' => [ 'shape' => 'BatchPutMessageResponse', ], 'errors' => [ [ 'shape' => 'InvalidRequestException', ], [ 'shape' => 'InternalFailureException', ], [ 'shape' => 'ServiceUnavailableException', ], [ 'shape' => 'ThrottlingException', ], ], ], 'BatchUpdateDetector' => [ 'name' => 'BatchUpdateDetector', 'http' => [ 'method' => 'POST', 'requestUri' => '/detectors', 'responseCode' => 200, ], 'input' => [ 'shape' => 'BatchUpdateDetectorRequest', ], 'output' => [ 'shape' => 'BatchUpdateDetectorResponse', ], 'errors' => [ [ 'shape' => 'InvalidRequestException', ], [ 'shape' => 'InternalFailureException', ], [ 'shape' => 'ServiceUnavailableException', ], [ 'shape' => 'ThrottlingException', ], ], ], 'DescribeDetector' => [ 'name' => 'DescribeDetector', 'http' => [ 'method' => 'GET', 'requestUri' => '/detectors/{detectorModelName}/keyValues/', ], 'input' => [ 'shape' => 'DescribeDetectorRequest', ], 'output' => [ 'shape' => 'DescribeDetectorResponse', ], 'errors' => [ [ 'shape' => 'InvalidRequestException', ], [ 'shape' => 'ResourceNotFoundException', ], [ 'shape' => 'ThrottlingException', ], [ 'shape' => 'InternalFailureException', ], [ 'shape' => 'ServiceUnavailableException', ], ], ], 'ListDetectors' => [ 'name' => 'ListDetectors', 'http' => [ 'method' => 'GET', 'requestUri' => '/detectors/{detectorModelName}', ], 'input' => [ 'shape' => 'ListDetectorsRequest', ], 'output' => [ 'shape' => 'ListDetectorsResponse', ], 'errors' => [ [ 'shape' => 'InvalidRequestException', ], [ 'shape' => 'ResourceNotFoundException', ], [ 'shape' => 'ThrottlingException', ], [ 'shape' => 'InternalFailureException', ], [ 'shape' => 'ServiceUnavailableException', ], ], ], ], 'shapes' => [ 'BatchPutMessageErrorEntries' => [ 'type' => 'list', 'member' => [ 'shape' => 'BatchPutMessageErrorEntry', ], ], 'BatchPutMessageErrorEntry' => [ 'type' => 'structure', 'members' => [ 'messageId' => [ 'shape' => 'MessageId', ], 'errorCode' => [ 'shape' => 'ErrorCode', ], 'errorMessage' => [ 'shape' => 'ErrorMessage', ], ], ], 'BatchPutMessageRequest' => [ 'type' => 'structure', 'required' => [ 'messages', ], 'members' => [ 'messages' => [ 'shape' => 'Messages', ], ], ], 'BatchPutMessageResponse' => [ 'type' => 'structure', 'members' => [ 'BatchPutMessageErrorEntries' => [ 'shape' => 'BatchPutMessageErrorEntries', ], ], ], 'BatchUpdateDetectorErrorEntries' => [ 'type' => 'list', 'member' => [ 'shape' => 'BatchUpdateDetectorErrorEntry', ], ], 'BatchUpdateDetectorErrorEntry' => [ 'type' => 'structure', 'members' => [ 'messageId' => [ 'shape' => 'MessageId', ], 'errorCode' => [ 'shape' => 'ErrorCode', ], 'errorMessage' => [ 'shape' => 'ErrorMessage', ], ], ], 'BatchUpdateDetectorRequest' => [ 'type' => 'structure', 'required' => [ 'detectors', ], 'members' => [ 'detectors' => [ 'shape' => 'UpdateDetectorRequests', ], ], ], 'BatchUpdateDetectorResponse' => [ 'type' => 'structure', 'members' => [ 'batchUpdateDetectorErrorEntries' => [ 'shape' => 'BatchUpdateDetectorErrorEntries', ], ], ], 'DescribeDetectorRequest' => [ 'type' => 'structure', 'required' => [ 'detectorModelName', ], 'members' => [ 'detectorModelName' => [ 'shape' => 'DetectorModelName', 'location' => 'uri', 'locationName' => 'detectorModelName', ], 'keyValue' => [ 'shape' => 'KeyValue', 'location' => 'querystring', 'locationName' => 'keyValue', ], ], ], 'DescribeDetectorResponse' => [ 'type' => 'structure', 'members' => [ 'detector' => [ 'shape' => 'Detector', ], ], ], 'Detector' => [ 'type' => 'structure', 'members' => [ 'detectorModelName' => [ 'shape' => 'DetectorModelName', ], 'keyValue' => [ 'shape' => 'KeyValue', ], 'detectorModelVersion' => [ 'shape' => 'DetectorModelVersion', ], 'state' => [ 'shape' => 'DetectorState', ], 'creationTime' => [ 'shape' => 'Timestamp', ], 'lastUpdateTime' => [ 'shape' => 'Timestamp', ], ], ], 'DetectorModelName' => [ 'type' => 'string', 'max' => 128, 'min' => 1, 'pattern' => '^[a-zA-Z0-9_-]+$', ], 'DetectorModelVersion' => [ 'type' => 'string', 'max' => 128, 'min' => 1, ], 'DetectorState' => [ 'type' => 'structure', 'required' => [ 'stateName', 'variables', 'timers', ], 'members' => [ 'stateName' => [ 'shape' => 'StateName', ], 'variables' => [ 'shape' => 'Variables', ], 'timers' => [ 'shape' => 'Timers', ], ], ], 'DetectorStateDefinition' => [ 'type' => 'structure', 'required' => [ 'stateName', 'variables', 'timers', ], 'members' => [ 'stateName' => [ 'shape' => 'StateName', ], 'variables' => [ 'shape' => 'VariableDefinitions', ], 'timers' => [ 'shape' => 'TimerDefinitions', ], ], ], 'DetectorStateSummary' => [ 'type' => 'structure', 'members' => [ 'stateName' => [ 'shape' => 'StateName', ], ], ], 'DetectorSummaries' => [ 'type' => 'list', 'member' => [ 'shape' => 'DetectorSummary', ], ], 'DetectorSummary' => [ 'type' => 'structure', 'members' => [ 'detectorModelName' => [ 'shape' => 'DetectorModelName', ], 'keyValue' => [ 'shape' => 'KeyValue', ], 'detectorModelVersion' => [ 'shape' => 'DetectorModelVersion', ], 'state' => [ 'shape' => 'DetectorStateSummary', ], 'creationTime' => [ 'shape' => 'Timestamp', ], 'lastUpdateTime' => [ 'shape' => 'Timestamp', ], ], ], 'ErrorCode' => [ 'type' => 'string', 'enum' => [ 'ResourceNotFoundException', 'InvalidRequestException', 'InternalFailureException', 'ServiceUnavailableException', 'ThrottlingException', ], ], 'ErrorMessage' => [ 'type' => 'string', ], 'InputName' => [ 'type' => 'string', 'max' => 128, 'min' => 1, 'pattern' => '^[a-zA-Z][a-zA-Z0-9_]*$', ], 'InternalFailureException' => [ 'type' => 'structure', 'members' => [ 'message' => [ 'shape' => 'errorMessage', ], ], 'error' => [ 'httpStatusCode' => 500, ], 'exception' => true, 'fault' => true, ], 'InvalidRequestException' => [ 'type' => 'structure', 'members' => [ 'message' => [ 'shape' => 'errorMessage', ], ], 'error' => [ 'httpStatusCode' => 400, ], 'exception' => true, ], 'KeyValue' => [ 'type' => 'string', 'max' => 128, 'min' => 1, 'pattern' => '^[a-zA-Z0-9\\-_]+$', ], 'ListDetectorsRequest' => [ 'type' => 'structure', 'required' => [ 'detectorModelName', ], 'members' => [ 'detectorModelName' => [ 'shape' => 'DetectorModelName', 'location' => 'uri', 'locationName' => 'detectorModelName', ], 'stateName' => [ 'shape' => 'StateName', 'location' => 'querystring', 'locationName' => 'stateName', ], 'nextToken' => [ 'shape' => 'NextToken', 'location' => 'querystring', 'locationName' => 'nextToken', ], 'maxResults' => [ 'shape' => 'MaxResults', 'location' => 'querystring', 'locationName' => 'maxResults', ], ], ], 'ListDetectorsResponse' => [ 'type' => 'structure', 'members' => [ 'detectorSummaries' => [ 'shape' => 'DetectorSummaries', ], 'nextToken' => [ 'shape' => 'NextToken', ], ], ], 'MaxResults' => [ 'type' => 'integer', 'max' => 250, 'min' => 1, ], 'Message' => [ 'type' => 'structure', 'required' => [ 'messageId', 'inputName', 'payload', ], 'members' => [ 'messageId' => [ 'shape' => 'MessageId', ], 'inputName' => [ 'shape' => 'InputName', ], 'payload' => [ 'shape' => 'Payload', ], ], ], 'MessageId' => [ 'type' => 'string', 'max' => 64, 'min' => 1, 'pattern' => '^[a-zA-Z0-9_-]+$', ], 'Messages' => [ 'type' => 'list', 'member' => [ 'shape' => 'Message', ], 'min' => 1, ], 'NextToken' => [ 'type' => 'string', ], 'Payload' => [ 'type' => 'blob', ], 'ResourceNotFoundException' => [ 'type' => 'structure', 'members' => [ 'message' => [ 'shape' => 'errorMessage', ], ], 'error' => [ 'httpStatusCode' => 404, ], 'exception' => true, ], 'Seconds' => [ 'type' => 'integer', ], 'ServiceUnavailableException' => [ 'type' => 'structure', 'members' => [ 'message' => [ 'shape' => 'errorMessage', ], ], 'error' => [ 'httpStatusCode' => 503, ], 'exception' => true, 'fault' => true, ], 'StateName' => [ 'type' => 'string', 'max' => 128, 'min' => 1, ], 'ThrottlingException' => [ 'type' => 'structure', 'members' => [ 'message' => [ 'shape' => 'errorMessage', ], ], 'error' => [ 'httpStatusCode' => 429, ], 'exception' => true, ], 'Timer' => [ 'type' => 'structure', 'required' => [ 'name', 'timestamp', ], 'members' => [ 'name' => [ 'shape' => 'TimerName', ], 'timestamp' => [ 'shape' => 'Timestamp', ], ], ], 'TimerDefinition' => [ 'type' => 'structure', 'required' => [ 'name', 'seconds', ], 'members' => [ 'name' => [ 'shape' => 'TimerName', ], 'seconds' => [ 'shape' => 'Seconds', ], ], ], 'TimerDefinitions' => [ 'type' => 'list', 'member' => [ 'shape' => 'TimerDefinition', ], ], 'TimerName' => [ 'type' => 'string', 'max' => 128, 'min' => 1, ], 'Timers' => [ 'type' => 'list', 'member' => [ 'shape' => 'Timer', ], ], 'Timestamp' => [ 'type' => 'timestamp', ], 'UpdateDetectorRequest' => [ 'type' => 'structure', 'required' => [ 'messageId', 'detectorModelName', 'state', ], 'members' => [ 'messageId' => [ 'shape' => 'MessageId', ], 'detectorModelName' => [ 'shape' => 'DetectorModelName', ], 'keyValue' => [ 'shape' => 'KeyValue', ], 'state' => [ 'shape' => 'DetectorStateDefinition', ], ], ], 'UpdateDetectorRequests' => [ 'type' => 'list', 'member' => [ 'shape' => 'UpdateDetectorRequest', ], 'min' => 1, ], 'Variable' => [ 'type' => 'structure', 'required' => [ 'name', 'value', ], 'members' => [ 'name' => [ 'shape' => 'VariableName', ], 'value' => [ 'shape' => 'VariableValue', ], ], ], 'VariableDefinition' => [ 'type' => 'structure', 'required' => [ 'name', 'value', ], 'members' => [ 'name' => [ 'shape' => 'VariableName', ], 'value' => [ 'shape' => 'VariableValue', ], ], ], 'VariableDefinitions' => [ 'type' => 'list', 'member' => [ 'shape' => 'VariableDefinition', ], ], 'VariableName' => [ 'type' => 'string', 'max' => 128, 'min' => 1, 'pattern' => '^[a-zA-Z][a-zA-Z0-9_]*$', ], 'VariableValue' => [ 'type' => 'string', 'max' => 1024, 'min' => 1, ], 'Variables' => [ 'type' => 'list', 'member' => [ 'shape' => 'Variable', ], ], 'errorMessage' => [ 'type' => 'string', ], ],];
