/*******************************************************************************
 * ReplayDirector_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ReplayDirector_TA extends Actor
    placeable;


/** Turn on slomo at this time before and after the scoring hit */
var() float SlomoPreScoreTime;
/** Turn on slomo at this time before and after the scoring hit */
var() float SlomoPostScoreTime;
/** Turn on slomo for this amount of time before the goal is scored, if a defender was nearby */
var() float SlomoDefendTime;
/** Turn on slomo for this amount of time before the goal is scored, if a defender was nearby */
var() float SlomoDefendDistance;
/** how much to slomo to */
var() float SlomoTimeDilation;
/** minimum and maximum amount of time the replay should show */
var() float MinReplayTime;
/** minimum and maximum amount of time the replay should show */
var() float MaxReplayTime;
/** Base amount of time to add to replay length to account for replication and focus time */
var() float ReplayPadding;
//var() AkSoundCue ReplayStartSound;
//var() AkSoundCue SlomoStartSound;
//var() AkSoundCue SlomoStopSound;
var privatewrite transient Replay_Soccar_TA Replay;
var transient Actor FocusCar;
var transient float FocusCarChangeTime;
var transient Actor FocusBall;
//var transient array<BallHitInfo> BallTouches;
var transient name BallName;
var transient float ScoreTime;
var transient int ScoreHitIndex;
var export editinline transient Goal_TA ScoredGoal;
var repnotify transient bool bSlomo;
var transient bool bSlomoForDefender;
var transient int FocusHitIndex;
//var transient array<ReplayFocusCar> FocusCars;
var transient int FocusCarIdx;
var transient float ReplayStartGameTime;
//var repnotify transient GameEvent_Soccar_TA SoccarGame;
var transient byte ScoredOnTeam;
//var repnotify transient ReplayScoreData ScoreData;
//var repnotify transient PlayerTitleDataSet ScoreTitles;
//var delegate<EventReplayFinished> __EventReplayFinished__Delegate;
//var delegate<EventScoreDataChanged> __EventScoreDataChanged__Delegate;
//var delegate<EventScoreTitlesChanged> __EventScoreTitlesChanged__Delegate;