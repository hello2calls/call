/* * call_log_feature.h * *  Created on: *      Author: feature_generator.py by ElfeXu */#ifndef EXPORT_CALLLOG_FEATURE_H_#define EXPORT_CALLLOG_FEATURE_H_#include "tp_feature.h"#include "tp_http_data.h"#include "tp_message_generated.h"class CallLogRequest : public TPHttpRequest {public:    CallLogRequest();    virtual ~CallLogRequest();    CallLogRequest(const CallLogRequest& other);    CallLogRequest& operator = (const CallLogRequest& other);};class CallLogResponse : public TPHttpResponse {public:    CallLogResponse();    virtual ~CallLogResponse();    CallLogResponse(const CallLogResponse& other);    CallLogResponse& operator = (const CallLogResponse& other);};class CallLogFeature : public TPFeature {public:    CallLogFeature();    virtual ~CallLogFeature();        CallLogFeature(const CallLogFeature& other);    CallLogFeature& operator = (const CallLogFeature& other);    virtual ChannelType get_channel_type();};#endif // EXPORT_CALLLOG_FEATURE_H_