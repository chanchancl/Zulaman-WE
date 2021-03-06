//! zinc
library ModelInfo requires Table, Integer {
    string CRTP_TANK = "tank";
    string CRTP_HEAL = "healer";
    string CRTP_DPSE = "dps";
    string CRTP_MINI = "minion";
    string CRTP_BOSS = "boss";
    string CRTP_CREP = "creep";
    string CRTP_ERRO = "error";
    Table tab;
    
    public struct ModelInfo {
        string icon;
        integer mainAttribute;
        //integer speed;
        integer life;
        integer ap, apr;
        integer armor;
        real dodge, blockRate;
        real blockPoint;
        real mdef;
        real attackCrit;
        real scale; // for casting bar
        integer career; // boss, creep, tank, dps, healer
    
        /*static method operator[] (integer uid) -> thistype {
            if (!tab.exists(uid)) {
                print(SCOPE_PREFIX+">undefined unit type id '" + ID2S(uid) + "'.");
				return 50/0
                return 0;
            } else {
                return thistype(tab[uid]);
            }
        }*/
		
		static method get(integer uid, string source) -> thistype {
            if (!tab.exists(uid)) {
                print(SCOPE_PREFIX+">undefined unit type id '" + ID2S(uid) + "' "+source+".");
                return 0;
            } else {
                return thistype(tab[uid]);
            }
		}
        
        method setScale(real s) {
            this.scale = s;
        }
        
        method Career() -> string {
            if (this.career == CAREER_TYPE_TANK) {
                return CRTP_TANK;
            } else if (this.career == CAREER_TYPE_HEALER) {
                return CRTP_HEAL;
            } else if (this.career == CAREER_TYPE_DPS) {
                return CRTP_DPSE;
            } else if (this.career == CAREER_TYPE_MINION) {
                return CRTP_MINI;
            } else if (this.career == CAREER_TYPE_BOSS) {
                return CRTP_BOSS;
            } else if (this.career == CAREER_TYPE_CREEP) {
                return CRTP_CREP;
            } else {
                return CRTP_ERRO;
            }
        }
        
        static method rg(integer uid, integer mainAttribute, integer life, integer ap, integer apr, integer def, real dodge, real blockRate, real blockpt, real mdef, real attackCrit, integer career, string icon) -> thistype {
            thistype this = thistype.allocate();
            tab[uid] = this;
            this.icon = icon;
            this.mainAttribute = mainAttribute;
            //this.speed = speed;
            this.life = life;
            this.ap = ap;
            this.apr = apr;
            this.armor = def;
            this.dodge = dodge;
            this.blockRate = blockRate;
            this.blockPoint = blockpt;
            this.mdef = mdef;
            this.attackCrit = attackCrit;
            this.career = career;
            this.scale = 1.0;
            return this;
        }
    }
    
    function onInit() {
        tab = Table.create();
        TimerStart(CreateTimer(), 0.05, false, function() {
            DestroyTimer(GetExpiredTimer());

ModelInfo.rg(UTID_STATIC_TARGET,ATT_NON,49999,6,1,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp");
ModelInfo.rg(UTID_TARGET,ATT_NON,50000,0,1,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNPeasant.blp");
ModelInfo.rg(UTID_TANK_TESTER,ATT_NON,49999,300,0,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNVengeanceIncarnate.blp");
ModelInfo.rg(UTID_HEALER_TESTER,ATT_NON,49999,300,0,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNPandarenBrewmaster.blp");
ModelInfo.rg(UTIDBLOODELFDEFENDER,ATT_STR,1059,2,10,39,.06,.19,12,.75,.05,CAREER_TYPE_TANK,"ReplaceableTextures\\CommandButtons\\BTNSpellBreaker.blp");
ModelInfo.rg(UTIDCLAWDRUID,ATT_AGI,1279,2,10,42,.15,0,0,.75,.05,CAREER_TYPE_TANK,"ReplaceableTextures\\CommandButtons\\BTNGrizzlyBear.blp");
ModelInfo.rg(UTIDKEEPEROFGROVE,ATT_INT,729,2,6,6,.05,0,0,1,.05,CAREER_TYPE_HEALER,"ReplaceableTextures\\CommandButtons\\BTNFurion.blp");
ModelInfo.rg(UTIDPALADIN,ATT_INT,679,2,10,18,.15,.2,20,1,.05,CAREER_TYPE_HEALER,"ReplaceableTextures\\CommandButtons\\BTNArthas.blp");
ModelInfo.rg(UTIDPRIEST,ATT_INT,649,2,6,3,.05,0,0,1,.05,CAREER_TYPE_HEALER,"ReplaceableTextures\\CommandButtons\\BTNPriest.blp");
ModelInfo.rg(UTIDBLADEMASTER,ATT_STR,719,44,56,10,.15,0,0,1,.15,CAREER_TYPE_DPS,"ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp");
ModelInfo.rg(UTIDDARKRANGER,ATT_AGI,719,61,16,7,.1,0,0,1,.1,CAREER_TYPE_DPS,"ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp");
ModelInfo.rg(UTIDGHOUL,ATT_NON,599,12,2,10,.25,0,0,.75,.35,CAREER_TYPE_MINION,"ReplaceableTextures\\CommandButtons\\BTNGhoul.blp");
ModelInfo.rg(UTIDFROSTMAGE,ATT_INT,649,2,6,3,.05,0,0,1,.05,CAREER_TYPE_DPS,"ReplaceableTextures\\CommandButtons\\BTNJaina.blp");
ModelInfo.rg(UTIDEARTHBINDER,ATT_STR,679,62,4,13,.15,0,0,1,.12,CAREER_TYPE_DPS,"ReplaceableTextures\\CommandButtons\\BTNSpiritWalker.blp");
ModelInfo.rg(UTID_EARTH_BINDER_ASC,ATT_STR,679,62,4,13,.15,0,0,1,.12,CAREER_TYPE_DPS,"ReplaceableTextures\\CommandButtons\\BTNRevenant.blp");
ModelInfo.rg(UTIDLIGHTNINGTOTEM,ATT_NON,99,0,0,0,0,0,0,1,0,CAREER_TYPE_MINION,"ReplaceableTextures\\CommandButtons\\BTNStasisTrap.blp");
ModelInfo.rg(UTID_EARTH_BIND_TOTEM,ATT_NON,99,0,0,0,0,0,0,1,0,CAREER_TYPE_MINION,"ReplaceableTextures\\CommandButtons\\BTNDryadDispelMagic.blp");
ModelInfo.rg(UTID_TORRENT_TOTEM,ATT_NON,99,0,0,0,0,0,0,1,0,CAREER_TYPE_MINION,"ReplaceableTextures\\CommandButtons\\BTNStaffOfNegation.blp");
ModelInfo.rg(UTIDROGUE,ATT_AGI,809,51,32,7,.1,0,0,1,.2,CAREER_TYPE_DPS,"ReplaceableTextures\\CommandButtons\\BTNHeroDemonHunter.blp");
ModelInfo.rg(UTIDHEATHEN,ATT_INT,619,2,6,3,.05,0,0,1,.05,CAREER_TYPE_DPS,"ReplaceableTextures\\CommandButtons\\BTNKelThuzad.blp");
ModelInfo.rg(UTID_ARCH_TINKER,ATT_INT,74799,255,75,5,.05,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNHeroTinker.blp").setScale(1.7);
ModelInfo.rg(UTID_ARCH_TINKER_MORPH,ATT_INT,74799,255,75,5,.05,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNHeroTinker.blp").setScale(1.7);
ModelInfo.rg(UTID_POCKET_FACTORY,ATT_NON,1999,1,0,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNPocketFactory.blp");
ModelInfo.rg(UTID_CLOCKWORK_GOBLIN,ATT_NON,9999,10,40,0,0,0,0,1,.1,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNClockWerkGoblin.blp");
ModelInfo.rg(UTIDNAGASEAWITCH,ATT_AGI,154899,490,300,5,.05,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNNagaSeaWitch.blp").setScale(1.7);
ModelInfo.rg(UTID_FLYING_SERPENT,ATT_NON,1499,21,59,5,.05,0,0,1,.1,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNWindSerpent.blp");
ModelInfo.rg(UTIDTIDEBARON,ATT_STR,209599,660,400,5,.05,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidonRoyalGuard.blp");
ModelInfo.rg(UTIDTIDEBARONWATER,ATT_STR,209599,310,150,40,.1,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNSeaElemental.blp");
ModelInfo.rg(UTIDWARLOCK,ATT_INT,399699,970,500,5,.05,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNOrcWarlock.blp");
ModelInfo.rg(UTID_LAVA_SPAWN,ATT_NON,799,50,0,0,.05,0,0,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNLavaSpawn.blp");
ModelInfo.rg(UTID_PIT_ARCHON,ATT_STR,449899,740,500,5,.05,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNHeroCryptLord.blp").setScale(1.7);
ModelInfo.rg(UTID_SPIKE,ATT_NON,2999,0,10,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNImpale.blp");
ModelInfo.rg(UTID_POISONOUS_CRAWLER,ATT_NON,4999,100,200,0,0,0,0,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNCryptFiend.blp");
ModelInfo.rg(UTID_ABOMINATION,ATT_NON,19999,300,200,0,0,0,0,1,.15,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNAbomination.blp");
ModelInfo.rg(UTID_WRAITH,ATT_NON,499,5,5,0,1,0,0,0,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNShade.blp");
ModelInfo.rg(UTIDHEXLORD,ATT_INT,799499,1350,700,5,.05,0,0,1,.03,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNShadowHunter.blp");
ModelInfo.rg(UTID_GOD_OF_DEATH,ATT_STR,1199499,0,1,15,.05,.05,100,1,0,CAREER_TYPE_BOSS,"ReplaceableTextures\\CommandButtons\\BTNForgottenOne.blp");
ModelInfo.rg(UTID_SEA_LIZARD,ATT_NON,8499,150,100,5,.05,0,0,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNSnapDragon.blp");
ModelInfo.rg(UTID_MURLOC_SLAVE,ATT_NON,5499,100,50,2,0,.05,20,1,.02,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNMurgalSlave.blp");
ModelInfo.rg(UTID_NAGA_SIREN,ATT_NON,13499,250,100,5,.05,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNSeaWitch.blp");
ModelInfo.rg(UTID_NAGA_TIDE_PRIEST,ATT_NON,13499,200,100,5,.05,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNNagaSummoner.blp");
ModelInfo.rg(UTID_NTR_HEALING_WARD,ATT_NON,249,0,1,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNHealingWard.blp");
ModelInfo.rg(UTID_NTR_PROTECTION_WARD,ATT_NON,249,0,1,0,0,0,0,1,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNBigBadVoodooSpell.blp");
ModelInfo.rg(UTID_WIND_SERPENT,ATT_NON,31999,275,125,7,.1,0,0,1,.1,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNWindSerpent.blp");
ModelInfo.rg(UTID_NAGA_MYRMIDON,ATT_NON,23999,200,200,15,.05,.1,30,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp");
ModelInfo.rg(UTID_CHMP_NAGA_MYRMIDON,ATT_NON,23999,200,200,15,.05,.1,30,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp");
ModelInfo.rg(UTID_NAGA_ROYAL_GUARD,ATT_NON,47999,300,150,15,.05,.1,30,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidonRoyalGuard.blp");
ModelInfo.rg(UTID_FEL_GRUNT,ATT_NON,54999,650,300,5,.05,.05,100,.95,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNChaosGrunt.blp");
ModelInfo.rg(UTID_FEL_RIDER,ATT_NON,49999,600,200,10,.05,0,0,1,.1,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNChaosWolfRider.blp");
ModelInfo.rg(UTID_FEL_WAR_BRINGER,ATT_NON,99999,750,150,5,.05,.15,240,.8,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNChaosKotoBeast.blp");
ModelInfo.rg(UTID_DEMONIC_WITCH,ATT_NON,44999,400,200,5,.05,0,0,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNChaosWarlock.blp");
ModelInfo.rg(UTID_NOXIOUS_SPIDER,ATT_NON,87499,700,300,5,.05,0,0,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNCryptFiend.blp");
ModelInfo.rg(UTID_PARASITICAL_ROACH,ATT_NON,54999,300,100,0,.05,0,0,.95,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNCarrionScarabs.blp");
ModelInfo.rg(UTID_ZOMBIE,ATT_NON,94999,400,300,5,0,0,0,1,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNZombie.blp");
ModelInfo.rg(UTID_OBSIDIAN_CONSTRUCT,ATT_NON,99999,500,0,30,0,0,0,.7,0,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNObsidianStatue.blp");
ModelInfo.rg(UTID_DRACOLICH,ATT_NON,124999,800,200,10,.05,0,0,.9,.05,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNFrostWyrm.blp");
ModelInfo.rg(UTID_VOID_WALKER,ATT_NON,99999,950,50,20,0.05,0,0,1,0.01,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNVoidWalker.blp");
ModelInfo.rg(UTID_INFERNO_CONSTRUCT,ATT_NON,219999,900,300,10,.05,10,150,1,.1,CAREER_TYPE_CREEP,"ReplaceableTextures\\CommandButtons\\BTNInfernal.blp");

  });
    }
}
//! endzinc
