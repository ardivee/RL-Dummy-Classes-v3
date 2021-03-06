/*******************************************************************************
 * SaveData_TA generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib © 2009-2015 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SaveData_TA extends Object;

struct OptionsValue
{
    var name Id;
    var string Value;
};

struct CachedStaticText
{
    var string Text;
    var string Language;

};

var transient SaveGameManager_TA SaveManager;
var private bool bFromPreviousSave;
var(System) bool bVsync;
/** True if we have shown the controller recommendation message */
var(System) bool bShownControllerRecommendationMessage;
var(System) array<OptionsValue> VideoOptions;
var(System) string Resolution;
var(System) int WindowMode;
/** Desired sound volume */
var(System) float SoundVolume;
/** Desired music volume */
var(System) float MusicVolume;
/** Desired crowd/ambient volume */
var(System) float AmbientVolume;
/** Desired voice volume */
var(System) float VoiceVolume;
/** Output type (speakers/headphones) */
//var(System) AkAudio.AkDevice.EAkOutputType OutputType;
/** Voice filtering */
var(System) _Types_TA.EVoiceFilter VoiceFilter;
/** Voice filtering */
var(System) _Types_TA.EVoiceFilter ChatFilter;
/** Splitscreen type for 2 players */
//var(System) Engine.GameViewportClient.ESplitScreenType SplitScreenType2P;
/** Splitscreen type for 3 players */
//var(System) Engine.GameViewportClient.ESplitScreenType SplitScreenType3P;
/** Remember the skill of various players that play on this machine */
//var(System) array<PlaylistSkillRating> SkillCache;
/** Desired screen safe area ratio */
var(System) float SafeZoneRatio;
/** Unique online ID for this account (only serialized on PC, may change between sessions on console) */
var(Account) Qword AccountID;
/** Local profiles that we know of */
var(Account) array<int> LocalProfileIDs;
/** Last know profiles id's used by a controller id */
var(Account) array<int> LastUsedProfileIDs;
/** Cache which products we have acquired */
var(Account) array<int> UnlockedProducts;
/** Products we have acquired but not previewed yet */
var(Account) array<int> NewProducts;
/** Loaded profiles */
var(Account) array<Profile_TA> Profiles;
/** Achievement Save data */
var(Account) AchievementSave_TA AchievementData;
/** Titles this player has received */
var() array<name> PlayerTitles;
var array<UISavedKeyValue> UISavedValues;
var array<UniqueNetId> MutedPlayers;
var array<int> MatchCompleteCarBodies;
var privatewrite const transient name SweetToothBodyName;
var CachedStaticText News;
var CachedStaticText MotD;
/**
var delegate<EventNewProductUnlocked> __EventNewProductUnlocked__Delegate;
var delegate<EventDLCChange> __EventDLCChange__Delegate;

delegate EventNewProductUnlocked(SaveData_TA Data, int ProductID)
{
    //return;    
}

delegate EventDLCChange(SaveData_TA Data)
{
    //return;    
}

function HandleDataLoaded(SaveGameManager_TA Manager, Error_X Error)
{
    local Profile_TA Profile;
    local PsyWebServer_X PsyWebServer;

    // End:0x4B7
    if(Error == none)
    {
        SaveManager = Manager;
        // End:0x111
        if(!bFromPreviousSave)
        {
            bVsync = bool(UnresolvedNativeFunction_202(Manager.Player.ViewportClient.ConsoleCommand("scale get UseVsync")));
            SafeZoneRatio = Manager.Player.ViewportClient.TitleSafeZone.MaxPercentX;
            bFromPreviousSave = true;
        }
        // End:0x19A
        else
        {
            // End:0x19A
            if(class'WorldInfo'.static.IsConsoleBuild(11))
            {
                SafeZoneRatio = Manager.Player.ViewportClient.TitleSafeZone.MaxPercentX;
            }
        }
        // End:0x293
        if(Manager.Player.OnlinePlayer.IsPrimaryPlayer())
        {
            Manager.Player.ViewportClient.ConsoleCommand("scale set UseVsync" @ ((bVsync) ? "1" : "0"));
            class'AkDevice'.static.NotifyWhenInitialized(ApplySoundSettings);
        }
        // End:0x341
        if(NotEqual_QWordQWord(SaveManager.Player.GetUniqueNetId().Uid, AccountID))
        {
            AccountID = SaveManager.Player.GetUniqueNetId().Uid;
        }
        // End:0x379
        foreach Profiles(Profile,)
        {
            Profile.OnLoaded(self);            
        }        
        // End:0x3AC
        if(class'GameEngine'.static.GetOnlineSubsystem() != none)
        {
            HandleOnlineGameInitialized();
        }
        // End:0x3EB
        else
        {
            UnknownLocal_1075843609
            // End:0x2F
            (( != ReturnValue) != @NULL) == );
            {
            }
        }
        // Failed to decompile this line:
             // Failed to decompile this Function's code.
              at position 0 
 Message: Index was out of range. Must be non-negative and less than the size of the collection.
            Parameter name: index 

 StackTrace:    at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
               at UELib.Core.UStruct.UByteCodeDecompiler.FormatTokens(Int32 beginIndex, Int32 endIndex) in E:\Development\Unreal-Library\src\ByteCodeDecompiler.cs:line 1544
               at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in E:\Development\Unreal-Library\src\ByteCodeDecompiler.cs:line 1492
}

final function Save()
{
    SaveManager.Save();
    //return;    
}

final function HandlePsyWebServerLoginChange(bool bSignedIn)
{
    // End:0x21
    if(bSignedIn)
    {
        UpdateOfflineTimePlayedAnalytics();
        CheckUnlockedProductAwards();
    }
    //return;    
}

final function HandlePlayerLoginStatusChange(OnlinePlayer_X Player)
{
    // End:0x2C
    if(Player.IsLoggedIn())
    {
        UpdateOfflineTimePlayedAnalytics();
    }
    //return;    
}

final function UpdateOfflineTimePlayedAnalytics()
{
    local Profile_TA Profile;

    // End:0x18C
    if(class'Online_X'.static.UniqueNetIDIsValid(SaveManager.Player.OnlinePlayer.PlayerID))
    {
        // End:0x18B
        foreach Profiles(Profile,)
        {
            // End:0x18A
            if(Profile.TotalTimePlayedOffline > 0)
            {
                OnlineGameAnalytics_TA(class'OnlineGame_X'.static.GetInstance().Analytics).TrackPlayerTimePlayed(SaveManager.Player.OnlinePlayer.PlayerID, Profile.TotalTimePlayedOffline, 2, Profile);
                Profile.TotalTimePlayedOffline = 0;
            }            
        }        
    }
    Save();
    //return;    
}

final function ApplySoundSettings()
{
    SetSoundVolume(SoundVolume);
    SetMusicVolume(MusicVolume);
    SetAmbientVolume(AmbientVolume);
    SetOutputType(OutputType);
    //return;    
}

final function SetSoundVolume(float NewValue)
{
    class'AkDevice'.static.SetGlobalRTCP('Volume_SFX', NewValue);
    SoundVolume = NewValue;
    //return;    
}

final function SetMusicVolume(float NewValue)
{
    class'AkDevice'.static.SetGlobalRTCP('Volume_MX', NewValue);
    MusicVolume = NewValue;
    //return;    
}

final function SetAmbientVolume(float NewValue)
{
    class'AkDevice'.static.SetGlobalRTCP('Volume_Ambient', NewValue);
    AmbientVolume = NewValue;
    //return;    
}

final function SetVoiceVolume(float NewValue)
{
    // End:0x65
    if(class'OnlineGame_X'.static.GetInstance() != none)
    {
        class'OnlineGame_X'.static.GetInstance().super(SaveData_TA).SetVoiceVolume(NewValue);
    }
    VoiceVolume = NewValue;
    //return;    
}

final function SetOutputType(AkAudio.AkDevice.EAkOutputType Value)
{
    class'AkDevice'.static.SetOutputType(Value);
    OutputType = Value;
    //return;    
}

final function SetSafeZone(float Value)
{
    SafeZoneRatio = Value;
    SaveManager.Player.ViewportClient.TitleSafeZone.MaxPercentX = Value;
    SaveManager.Player.ViewportClient.TitleSafeZone.MaxPercentY = Value;
    //return;    
}

final function HandleOnlineGameInitialized()
{
    local OnlineGameCommunity_X Community;

    UnknownLocal_1075843609
    // DebugMode:True
    (( != ReturnValue) != @NULL) == );
    SetCachedText(MotD, Community.MotD, Community.DefaultMoTD);
    UnknownLocal_-134211303
    // Failed to decompile this line:
         // Failed to decompile this Function's code.
          at position 0 
 Message: Index was out of range. Must be non-negative and less than the size of the collection.
        Parameter name: index 

 StackTrace:    at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
           at UELib.Core.UStruct.UByteCodeDecompiler.FormatTokens(Int32 beginIndex, Int32 endIndex) in E:\Development\Unreal-Library\src\ByteCodeDecompiler.cs:line 1544
           at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in E:\Development\Unreal-Library\src\ByteCodeDecompiler.cs:line 1492
}

protected function SetCachedText(const out CachedStaticText Cache, OnlineStaticTextSync_X Sync, string DefaultText)
{
    // End:0xB9
    if(((Cache.Text != "") && Cache.Language == GetLanguage()) && Sync.Text == DefaultText)
    {
        Sync.SetText(Cache.Text);
    }
    //return;    
}

protected function HandleNewsChanged(OnlineStaticTextSync_X Sync)
{
    News.Text = Sync.Text;
    News.Language = GetLanguage();
    Save();
    //return;    
}

protected function HandleMotDChanged(OnlineStaticTextSync_X Sync)
{
    MotD.Text = Sync.Text;
    MotD.Language = GetLanguage();
    Save();
    //return;    
}

private final function HandleUnlockedDLCChanged()
{
    local array<name> UnlockedDLCList;
    local DLCPack_TA DLCPack;

    UnlockedDLCList = class'GameEngine'.static.GetOnlineSubsystem().SystemInterface.GetUnlockedDLC();
    // End:0xE0
    foreach class'GameData_TA'.default.DLCPacks(DLCPack,)
    {
        // End:0xCC
        if(UnlockedDLCList.Find(DLCPack.Name) != -1)
        {
            UnlockDLCPack(DLCPack);
            // End:0xDF
            continue;
        }
        LockDLCPack(DLCPack);        
    }    
    //return;    
}

final function UnlockDLCPack(DLCPack_TA DLCPack)
{
    local ProductData ProductData;
    local bool bProductsChanged;

    // End:0x81
    foreach DLCPack.Products.AllProductData(ProductData)
    {
        bProductsChanged = UnlockProduct(ProductData.Id) || bProductsChanged;        
    }    
    // End:0xA3
    if(bProductsChanged)
    {
        EventDLCChange(self);
    }
    //return;    
}

final function LockDLCPack(DLCPack_TA DLCPack)
{
    local ProductData ProductData;
    local bool bRemovedProducts;

    // End:0x81
    foreach DLCPack.Products.AllProductData(ProductData)
    {
        bRemovedProducts = LockProduct(ProductData.Id) || bRemovedProducts;        
    }    
    // End:0xB7
    if(bRemovedProducts)
    {
        ValidateLoadouts();
        EventDLCChange(self);
        Save();
    }
    //return;    
}

final function bool LockProduct(int ProductID)
{
    // End:0x3B
    if(UnlockedProducts.RemoveItem(ProductID) != -1)
    {
        NewProducts.RemoveItem(ProductID);
        return true;
    }
    // End:0x3D
    else
    {
        return false;
    }
    //return ReturnValue;    
}

protected function CheckUnlockedProductAwards()
{
    local UniqueNetId PlayerID;

    PlayerID = SaveManager.Player.GetUniqueNetId();
    // End:0xCA
    if(PlayerID.SplitscreenID == 0)
    {
        class'OnlineGame_Base_X'.static.GetInstance().Rewards.SyncPlayerRewards(PlayerID, HandleUnlockedProductAwards);
    }
    //return;    
}

final function HandleUnlockedProductAwards(UniqueNetId PlayerID, array<int> Products, Error_X Error)
{
    local int ProductID;
    local bool bRemovedProducts;

    // End:0x147
    if(Error == none)
    {
        // End:0x3A
        foreach Products(ProductID,)
        {
            UnlockProduct(ProductID);            
        }        
        // End:0x125
        foreach class'GameData_TA'.default.Products.AllProductIDs(none, ProductID)
        {
            // End:0x124
            if(class'GameData_TA'.default.Products.Products[ProductID].UnlockMethod == 3)
            {
                // End:0x124
                if(Products.Find(ProductID) == -1)
                {
                    bRemovedProducts = LockProduct(ProductID) || bRemovedProducts;
                }
            }            
        }        
        // End:0x147
        if(bRemovedProducts)
        {
            ValidateLoadouts();
            Save();
        }
    }
    //return;    
}

final function Profile_TA GetProfileForPlayerWithoutAssigning(LocalPlayer_TA Player)
{
    local Profile_TA Profile;

    // End:0xC5
    if(Player.ControllerId < LastUsedProfileIDs.Length)
    {
        Profile = GetLocalProfile(LastUsedProfileIDs[Player.ControllerId]);
        // End:0xC5
        if((Profile != none) && Profile.ControllerId == Player.ControllerId)
        {
            return Profile;
        }
    }
    return none;
    //return ReturnValue;    
}

final function Profile_TA GetProfileForPlayer(LocalPlayer_TA Player)
{
    local Profile_TA Profile;

    // End:0x10B
    if(Player.ControllerId < LastUsedProfileIDs.Length)
    {
        Profile = GetLocalProfile(LastUsedProfileIDs[Player.ControllerId]);
        // End:0x10B
        if((Profile != none) && (Profile.ControllerId == -1) || Profile.ControllerId == Player.ControllerId)
        {
            AssignProfile(Profile, Player);
            return Profile;
        }
    }
    // End:0x172
    foreach Profiles(Profile,)
    {
        // End:0x171
        if(Profile.ControllerId == -1)
        {
            AssignProfile(Profile, Player);            
            return Profile;
        }        
    }    
    Profile = CreateProfile(GetProfileName(Player));
    AssignProfile(Profile, Player);
    return Profile;
    //return ReturnValue;    
}

final function AssignProfile(Profile_TA Profile, LocalPlayer_TA Player)
{
    Profile.ControllerId = Player.ControllerId;
    Profile.ProfileName = GetProfileName(Player, Profile);
    // End:0x143
    if((Profile.ControllerId >= LastUsedProfileIDs.Length) || LastUsedProfileIDs[Player.ControllerId] != Profile.LocalID)
    {
        LastUsedProfileIDs[Player.ControllerId] = Profile.LocalID;
        Save();
    }
    //return;    
}

final function Profile_TA GetProfileByName(string ProfileName)
{
    local Profile_TA Profile;

    // End:0x4F
    foreach Profiles(Profile,)
    {
        // End:0x4E
        if(Profile.ProfileName ~= ProfileName)
        {            
            return Profile;
        }        
    }    
    return none;
    //return ReturnValue;    
}

private final function string GetProfileName(LocalPlayer_TA Player, optional Profile_TA PlayerProfile)
{
    local Profile_TA Profile;
    local string ProfileName;

    PlayerProfile = none;
    // End:0x9F
    if(class'GameEngine'.static.GetOnlineSubsystem() != none)
    {
        ProfileName = class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetPlayerNickname(byte(Player.ControllerId));
    }
    // End:0x13F
    if(Len(ProfileName) != 0)
    {
        // End:0x13B
        foreach Profiles(Profile,)
        {
            // End:0x13A
            if((Profile != PlayerProfile) && Profile.ProfileName ~= ProfileName)
            {
                ProfileName @= (("(" $ string(GetAvailableLocalProfileID())) $ ")");
                // End:0x13B
                break;
            }            
        }        
    }
    // End:0x15F
    else
    {
        ProfileName = "Player" $ string(GetAvailableLocalProfileID());
    }
    return ProfileName;
    //return ReturnValue;    
}

private final function int GetAvailableLocalProfileID()
{
    local int AvailableID;
    local Profile_TA Profile;

    AvailableID = 0;
    ++ AvailableID;
    Profile = GetLocalProfile(AvailableID);
    // End:0x0B
    if((Profile == none) || Profile.ControllerId == -1)
        goto J0x0B;
    return AvailableID;
    //return ReturnValue;    
}

final function Profile_TA GetLocalProfile(int LocalID)
{
    local Profile_TA Profile;

    // End:0x4F
    foreach Profiles(Profile,)
    {
        // End:0x4E
        if(Profile.LocalID == LocalID)
        {            
            return Profile;
        }        
    }    
    return none;
    //return ReturnValue;    
}

final function Profile_TA CreateProfile(string ProfileName)
{
    local Profile_TA Profile;

    // End:0x47
    foreach Profiles(Profile,)
    {
        // End:0x46
        if(Profile.ProfileName ~= ProfileName)
        {            
            return none;
        }        
    }    
    Profile = new class'Profile_TA';
    Profile.Init(self, ProfileName, GetAvailableLocalProfileID());
    Profiles.AddItem(Profile);
    LocalProfileIDs.AddItem(Profile.LocalID);
    Save();
    return Profile;
    //return ReturnValue;    
}

final function bool DeleteProfile(string ProfileName)
{
    local Profile_TA Profile;

    // End:0x88
    foreach Profiles(Profile,)
    {
        // End:0x87
        if(Profile.ProfileName ~= ProfileName)
        {
            LocalProfileIDs.RemoveItem(Profile.LocalID);
            Profiles.RemoveItem(Profile);            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function ValidateLoadouts()
{
    local Profile_TA Profile;

    LogInternal("Account ValidateLoadouts: Profiles.Length=" $ string(Profiles.Length), 'LoadoutValidation', true);
    // End:0x7D
    foreach Profiles(Profile,)
    {
        Profile.super(SaveData_TA).ValidateLoadouts();        
    }    
    //return;    
}

final function bool CanUnlockProduct(int ProductID)
{
    return !IsProductUnlocked(ProductID) && !class'GameData_TA'.default.Products.IsDeleted(ProductID);
    //return ReturnValue;    
}

final function bool IsProductUnlocked(int ProductID)
{
    return UnlockedProducts.Find(ProductID) != -1;
    //return ReturnValue;    
}

final function SaveData_TA ClearUnlockedProducts()
{
    UnlockedProducts.Length = 0;
    NewProducts.Length = 0;
    UnlockDefaultProducts();
    return self;
    //return ReturnValue;    
}

final function UnlockDefaultProducts()
{
    local ProductDatabase_TA ProductDatabase;
    local int ProductID;

    ProductDatabase = class'GameData_TA'.default.Products;
    // End:0xAE
    foreach ProductDatabase.AllProductIDs(none, ProductID)
    {
        // End:0xAD
        if(ProductDatabase.Products[ProductID].UnlockMethod == 0)
        {
            UnlockProduct(ProductID);
        }        
    }    
    //return;    
}

final function bool UnlockProduct(int ProductID)
{
    // End:0xE8
    if(ProductID > 0)
    {
        // End:0xE8
        if(CanUnlockProduct(ProductID))
        {
            UnlockedProducts.AddItem(ProductID);
            // End:0xC9
            if(class'GameData_TA'.default.Products.Products[ProductID].UnlockMethod != 0)
            {
                NewProducts.AddItem(ProductID);
                EventNewProductUnlocked(self, ProductID);
            }
            UnlockChildProducts(ProductID);
            Save();
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function UnlockChildProducts(int ProductID)
{
    local ProductDatabase_TA Products;

    Products = class'GameData_TA'.default.Products;
    // End:0x7A
    if(Products.Products[ProductID].bPack)
    {
        UnlockPack(ProductID);
    }
    // End:0x126
    if(Products.GetProductData(ProductID).Slot == class'GameData_TA'.default.BodySlot)
    {
        class'GameData_TA'.default.Products.LoadProductAsync(ProductID, HandleLoadUnlockedBody);
    }
    //return;    
}

private final function HandleLoadUnlockedBody(int ProductID, ProductAsset_TA Product)
{
    local ProductAsset_Body_TA Body;
    local ProductAsset_TA ChildAsset;
    local ProductData AdditionalUnlock;

    Body = ProductAsset_Body_TA(Product);
    // End:0x144
    if(Body != none)
    {
        // End:0xB4
        foreach Body.ForcedProducts(ChildAsset,)
        {
            UnlockProduct(class'GameData_TA'.default.Products.GetProductID(ChildAsset.Name));            
        }        
        // End:0x141
        if(Body.AdditionalUnlocks != none)
        {
            // End:0x140
            foreach Body.AdditionalUnlocks.AllProductData(AdditionalUnlock)
            {
                UnlockProduct(AdditionalUnlock.Id);                
            }            
        }
    }
    // End:0x1A8
    else
    {
        WarnInternal((("Product:" $ ((Product != none) ? string(Product.Name) : "None")) @ "is not of type") @ string(class'ProductAsset_Body_TA'));
    }
    //return;    
}

protected function UnlockPack(int ProductID)
{
    local ProductAsset_Pack_TA Pack;
    local ProductData Data;

    Pack = ProductAsset_Pack_TA(class'GameData_TA'.default.Products.LoadProduct(ProductID));
    // End:0xB7
    foreach Pack.Products.AllProductData(Data)
    {
        UnlockProduct(Data.Id);        
    }    
    //return;    
}

simulated function int GenerateItemDrop(Profile_TA Profile)
{
    local int ProductID;

    ProductID = SetMatchCompleteForBody(Profile.Loadout.Products[class'GameData_TA'.default.BodySlot.SlotIndex]);
    // End:0xA7
    if(ProductID > 0)
    {
        UnlockProduct(ProductID);
        return ProductID;
    }
    ProductID = class'GameData_TA'.default.XPManager.GetRandomLockedProductID(Profile);
    LogInternal((((string(self) @ "GenerateItemDrop ProductID=") $ string(ProductID)) @ "UnlockMethod=") $ string(class'GameData_TA'.default.Products.GetProductData(ProductID).UnlockMethod), 'ItemDrops', true);
    // End:0x20B
    if(ProductID > 0)
    {
        // End:0x20B
        if(class'GameData_TA'.default.Products.GetProductData(ProductID).UnlockMethod == 1)
        {
            UnlockProduct(ProductID);
        }
    }
    return ProductID;
    //return ReturnValue;    
}

final function int SetMatchCompleteForBody(int ProductID)
{
    local int SweetToothBodyID, UnlockedBodyId;

    // End:0x22
    if(MatchCompleteCarBodies.Find(ProductID) != -1)
    {
        return 0;
    }
    MatchCompleteCarBodies.AddItem(ProductID);
    SweetToothBodyID = class'GameData_TA'.default.Products.GetProductID(SweetToothBodyName);
    // End:0xB9
    if(!IsProductUnlocked(SweetToothBodyID) && DidPlayMatchWithAllDefaultBodies())
    {
        UnlockedBodyId = SweetToothBodyID;
    }
    Save();
    return UnlockedBodyId;
    //return ReturnValue;    
}

private final function bool DidPlayMatchWithAllDefaultBodies()
{
    local int ProductID;
    local _Types_TA.EUnlockMethod UnlockMethod;

    // End:0x10A
    foreach class'GameData_TA'.default.Products.AllProductIDs(class'GameData_TA'.default.BodySlot, ProductID)
    {
        UnlockMethod = class'GameData_TA'.default.Products.GetProductData(ProductID).UnlockMethod;
        // End:0xE6
        if((UnlockMethod != 0) && UnlockMethod != 1)
        {
            continue;            
        }
        // End:0x109
        if(MatchCompleteCarBodies.Find(ProductID) == -1)
        {            
            return false;
        }        
    }    
    return true;
    //return ReturnValue;    
}

function bool GiveTitle(PlayerTitle_TA Title)
{
    // End:0x6F
    if(PlayerTitles.Find(Title.Name) == -1)
    {
        PlayerTitles.AddItem(Title.Name);
        Save();
        return true;
    }
    // End:0x71
    else
    {
        return false;
    }
    //return ReturnValue;    
}

simulated function PrintDebugInfo(DebugDrawer Drawer)
{
    local int Idx;
    local Profile_TA Profile;

    Drawer.PrintProperty("UnlockedProducts", string(UnlockedProducts.Length));
    Idx = 0;
    J0x48:
    // End:0xB9 [Loop If]
    if(Idx < UnlockedProducts.Length)
    {
        Drawer.PrintProperty(("  [" $ string(Idx)) $ "]", string(UnlockedProducts[Idx]));
        ++ Idx;
        // [Loop Continue]
        goto J0x48;
    }
    // End:0x122
    foreach Profiles(Profile,)
    {
        Drawer.DebugObject("Profile" @ Profile.ProfileName, Profile);        
    }    
    //return;    

**/