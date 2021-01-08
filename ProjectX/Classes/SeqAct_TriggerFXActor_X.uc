/*******************************************************************************
* SeqAct_TriggerFXActor_X generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SeqAct_TriggerFXActor_X extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var() private FXActorEvent_X Event;
var() private Actor AttachTo;

defaultproperties
{
    InputLinks(0)=(LinkDesc="Push")
    InputLinks(1)=(LinkDesc="Pop")
    InputLinks(2)=(LinkDesc="Toggle")
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Target",PropertyName=Targets,bWriteable=false)
    VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="AttachTo",PropertyName=AttachTo,bWriteable=false)
    ObjName="Trigger FXActor"
	ObjCategory="ProjectX"
}