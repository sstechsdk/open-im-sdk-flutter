import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 消息监听
class OnSignalingListener {
  Function(InvitationInfo msg)? onReceiveNewInvitation;
  Function(InvitationInfo msg)? onInviteeAccepted;
  Function(SignalingInfo msg)? onInviteeAcceptedByOtherDevice;
  Function(InvitationInfo msg)? onInviteeRejected;
  Function(SignalingInfo msg)? onInviteeRejectedByOtherDevice;
  Function(InvitationInfo msg)? onInvitationCancelled;
  Function(SignalingInfo msg)? onInvitationTimeout;
  Function(SignalingInfo msg)? onHangUp;
  Function(RoomCallingInfo msg)? onRoomParticipantConnected;
  Function(RoomCallingInfo msg)? onRoomParticipantDisconnected;

  /// Uniquely identifies
  String id;

  OnSignalingListener({
    this.onReceiveNewInvitation,
    this.onInviteeAccepted,
    this.onInviteeAcceptedByOtherDevice,
    this.onInviteeRejected,
    this.onInviteeRejectedByOtherDevice,
    this.onInvitationCancelled,
    this.onInvitationTimeout,
    this.onHangUp,
    this.onRoomParticipantConnected,
    this.onRoomParticipantDisconnected,
  }) : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  void receiveNewInvitation(InvitationInfo msg) {
    onReceiveNewInvitation?.call(msg);
  }

  void inviteeAccepted(InvitationInfo msg) {
    onInviteeAccepted?.call(msg);
  }

  void inviteeAcceptedByOtherDevice(SignalingInfo msg) {
    onInviteeAcceptedByOtherDevice?.call(msg);
  }

  void inviteeRejected(InvitationInfo msg) {
    onInviteeRejected?.call(msg);
  }

  void inviteeRejectedByOtherDevice(SignalingInfo msg) {
    onInviteeRejectedByOtherDevice?.call(msg);
  }

  void invitationCancelled(InvitationInfo msg) {
    onInvitationCancelled?.call(msg);
  }

  void invitationTimeout(SignalingInfo msg) {
    onInvitationTimeout?.call(msg);
  }

  void hangUp(SignalingInfo msg) {
    onHangUp?.call(msg);
  }

  void roomParticipantConnected(RoomCallingInfo msg) {
    onRoomParticipantConnected?.call(msg);
  }

  void roomParticipantDisconnected(RoomCallingInfo msg) {
    onRoomParticipantDisconnected?.call(msg);
  }
}