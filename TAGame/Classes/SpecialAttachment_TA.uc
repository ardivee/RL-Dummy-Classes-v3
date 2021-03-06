/*******************************************************************************
* SpecialAttachment_TA generated by MVN.RLLib using UE Explorer.
* MVN.RLLib ? 2019 Martin VN. All rights reserved.
* All rights belong to their respective owners.
*******************************************************************************/
class SpecialAttachment_TA extends RBActor_TA
    config(Game)
    hidecategories(Navigation);

var() private Vector Offset;
var() private export editinline StaticMeshComponent StaticMesh;
var() private float BallHitMultiplier;
var() private float CarHitMultiplier;
var() private float CarHitVerticalMultiplier;
var() private float CarHitTorque;
var() private bool bDemolishOnHit;
var() private bool bDemolishTeam;
var private transient Car_TA AttachedCar;