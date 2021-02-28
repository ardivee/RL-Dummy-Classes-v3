/*******************************************************************************
* SeqAct_AkPlaySoundAndSeek generated by MVN.RLLib using UE Explorer.
* MVN.RLLib © 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SeqAct_AkPlaySoundAndSeek extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var() private AkSoundCue SoundCue;
var() private float StartLocationSeconds;
var private export editinline transient AkSoundSource SoundSource;

defaultproperties
{
    bCallHandler=false
    InputLinks(0)=(LinkDesc="Play",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="AkPlaySoundAndSeek"
	ObjCategory="AkAudio"
}

event Activated()
{  /*Function decompiling is disabled */ }

final function ToggleSound(bool bPlay)
{  /*Function decompiling is disabled */ }

final function ToggleSoundFor(Actor A, bool bPlay)
{  /*Function decompiling is disabled */ }