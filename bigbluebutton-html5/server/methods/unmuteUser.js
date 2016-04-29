Meteor.methods({

  // meetingId: the meetingId of the meeting the user[s] is in
  // toMuteUserId: the userId of the user to be unmuted
  // requesterUserId: the userId of the requester
  // requesterToken: the authToken of the requester
  unmuteUser(meetingId, toMuteUserId, requesterUserId, requesterToken) {
    let action, message;
    action = function () {
      if (toMuteUserId === requesterUserId) {
        return 'unmuteSelf';
      } else {
        return 'unmuteOther';
      }
    };

    if (isAllowedTo(action(), meetingId, requesterUserId, requesterToken)) {
      message = {
        payload: {
          user_id: toMuteUserId,
          meeting_id: meetingId,
          mute: false,
          requester_id: requesterUserId,
        }
      };
      message = appendMessageHeader('mute_user_request_message', message);
      Meteor.log.info(`publishing a user unmute request for ${toMuteUserId}`);
      publish(Meteor.config.redis.channels.toBBBApps.users, message);
      updateVoiceUser(meetingId, {
        web_userid: toMuteUserId,
        talking: false,
        muted: false,
      });
    }
  }
});