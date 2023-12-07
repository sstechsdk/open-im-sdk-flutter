package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnSignalingListener;
import open_im_sdk.Open_im_sdk;


public class SignalingManager extends BaseManager {
    private final static String KEY_ID = "id";

    public void setSignalingListener(MethodCall methodCall, MethodChannel.Result result) {
        String key = methodCall.argument(KEY_ID);
        Open_im_sdk.setSignalingListener(new OnSignalingListener());

        result.success(null);
    }

    public void signalingInvite(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingInvite(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "inviteReq"),
                jsonValue(methodCall, "offlinePushInfo")
        );
    }

    public void signalingAccept(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingAccept(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "acceptReq"),
                jsonValue(methodCall, "offlinePushInfo")
        );
    }

    public void signalingReject(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingReject(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "rejectReq"),
                jsonValue(methodCall, "offlinePushInfo")
        );
    }

    public void signalingCancel(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingCancel(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "cancelReq"),
                jsonValue(methodCall, "offlinePushInfo")
        );
    }
}
