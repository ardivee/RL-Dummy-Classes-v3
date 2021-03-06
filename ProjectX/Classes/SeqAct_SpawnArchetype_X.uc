/*******************************************************************************
* SeqAct_SpawnArchetype_X generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SeqAct_SpawnArchetype_X extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var() private Actor ActorArchetype;
var() private Vector Velocity;
var() private float Speed;
var private array<private Actor> SpawnOwners;
var private array<private Actor> SpawnPoints;
var private transient Actor Spawned;

defaultproperties
{
    bCallHandler=false
    bAutoActivateOutputLinks=false
    InputLinks(0)=(LinkDesc="Spawn")
    InputLinks(1)=(LinkDesc="Destroy")
    OutputLinks(0)=(LinkDesc="Spawned")
    OutputLinks(1)=(LinkDesc="Destroyed")
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Spawn Point",PropertyName=SpawnPoints,bWriteable=false)
    VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Spawn Owner",PropertyName=SpawnOwners,bWriteable=false)
    VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Spawned",PropertyName=Spawned,bWriteable=true)
    ObjName="Spawn Archetype"
	ObjCategory="ProjectX"
}
event Activated(){}

protected final function Init(Actor SpawnedActor){}
