/*******************************************************************************
* InterpTrackAkEvent generated by MVN.RLLib using UE Explorer.
* MVN.RLLib © 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class InterpTrackAkEvent extends InterpTrack
    collapsecategories
    hidecategories(Object);

struct native AkEventTrackKey
{
    var private float Time;
    var() private AkSoundCue Event;

    structdefaultproperties
    {
        Time=0.0
        Event=none
    }
};

var private array<private AkEventTrackKey> AkEvents;
var() private float SeekTimeSeconds;

defaultproperties
{
    TrackInstClass=class'InterpTrackInstAkEvent'
    TrackTitle="AkEvent"
}