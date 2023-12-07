import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class SignalingManager {
  MethodChannel _channel;

  late OnSignalingListener listener;

  SignalingManager(this._channel);

  /// 消息监听
  Future setSignalingListener(OnSignalingListener listener) {
    this.listener = listener;
    return _channel.invokeMethod(
        'setSignalingListener',
        _buildParam({
          'id': listener.id,
        }));
  }

  Future<SignalingCertificate> signalingInvite({
    required InvitationInfo invitationInfo,
    required OfflinePushInfo offlinePushInfo,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingInvite',
              _buildParam({
                'operationID': Utils.checkOperationID(operationID),
                'inviteReq': invitationInfo.toJson(),
                'offlinePushInfo': offlinePushInfo.toJson(),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SignalingCertificate.fromJson(map)));

  Future<SignalingCertificate> signalingAccept({
    required InvitationInfo invitationInfo,
    required OfflinePushInfo offlinePushInfo,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingAccept',
              _buildParam({
                'operationID': Utils.checkOperationID(operationID),
                'acceptReq': invitationInfo.toJson(),
                'offlinePushInfo': offlinePushInfo.toJson(),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SignalingCertificate.fromJson(map)));

  Future<void> signalingReject({
    required InvitationInfo invitationInfo,
    required OfflinePushInfo offlinePushInfo,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'signalingReject',
          _buildParam({
            'operationID': Utils.checkOperationID(operationID),
            'rejectReq': invitationInfo.toJson(),
            'offlinePushInfo': offlinePushInfo.toJson(),
          }));

  Future<void> signalingCancel({
    required InvitationInfo invitationInfo,
    required OfflinePushInfo offlinePushInfo,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'signalingCancel',
          _buildParam({
            'operationID': Utils.checkOperationID(operationID),
            'cancelReq': invitationInfo.toJson(),
            'offlinePushInfo': offlinePushInfo.toJson(),
          }));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "signalingManager";
    return param;
  }
}
