//! zinc
library SpellData requires Table, Integer {
//==============================================================================
//  Constants:
//              ORDER_TYPE_IMMEDIATE
//              ORDER_TYPE_TARGET
//              ORDER_TYPE_POINT
//  SpellData:
//              string:     name
//              real:       cost
//              real:       cast
//              real:       cd
//              integer：   otp // order type
//              integer:    oid // order id
//      static  SpellData:  [integer spellId]
//==============================================================================
    public struct SpellData {
        private static Table db;
        real cost, cast, cd;
        real cost2, cast2, cd2;
        real cost3, cast3, cd3;
        integer otp; // order type
        integer oid; // order id
        string name;
        integer level;
        integer sid;
    
        static method operator[](integer sid) -> SpellData {
            if (SpellData.db.exists(sid)) {
                return SpellData(SpellData.db[sid]);
            } else {
                BJDebugMsg(SCOPE_PREFIX+">Unknown spell ID: " + ID2S(sid));
                return 0;
            }
        }
        
        method setCCC2(real cost, real cast, real cd) -> thistype {
            this.cost2 = cost;
            this.cast2 = cast;
            this.cd2 = cd;
            return this;
        }
        
        method setCCC3(real cost, real cast, real cd) -> thistype {
            this.cost3 = cost;
            this.cast3 = cast;
            this.cd3 = cd;
            return this;
        }
        
        method Cost(integer lvl) -> real {
            if (lvl == 1) {
                return this.cost;
            } else if (lvl == 2) {
                return this.cost2;
            } else {
                return this.cost3;
            }
        }
        
        method Cast(integer lvl) -> real {
            if (lvl == 1) {
                return this.cast;
            } else if (lvl == 2) {
                return this.cast2;
            } else {
                return this.cast3;
            }
        }
        
        method CD(integer lvl) -> real {
            if (lvl == 1) {
                return this.cd;
            } else if (lvl == 2) {
                return this.cd2;
            } else {
                return this.cd3;
            }
        }
        
        private static method create(integer sid, string name, real cost, real cast, real cd, integer oid, integer level, integer otp) -> thistype {
            thistype this = thistype.allocate();
            thistype.db[sid] = this;
            this.sid = sid;
            this.cost = cost;
            this.cost2 = cost;
            this.cost3 = cost;
            this.cast = cast;
            this.cast2 = cast;
            this.cast3 = cast;
            this.cd = cd;
            this.cd2 = cd;
            this.cd3 = cd;
            this.oid = oid;
            this.otp = otp;
            this.level = level;
            this.name = name;
            return this;
        }
    
        private static method onInit() {
            thistype.db = Table.create();

SpellData.create(0,"马甲",0,0,0,0,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDATTACKLL,"吸血攻击",0,0,1,0,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_GENERAL_STUN,"昏迷",0,0,1,0,1,ORDER_TYPE_TARGET);
SpellData.create(SID_HAUNT,"鬼哭狼嚎",0,0,5,852581,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDHEALTESTER,"搞毛",0,0,5,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSHIELDBLOCK,"盾牌格档",30,0,7,852055,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSUNFIRESTORM,"阳炎风暴",20,0,8,852488,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDARCANESHOCK,"秘法震击",10,0,2,852480,1,ORDER_TYPE_TARGET).setCCC2(17,0,2).setCCC3(24,0,2);
SpellData.create(SIDDISCORD,"纷争",0,0,14,852128,1,ORDER_TYPE_TARGET).setCCC2(0,0,12).setCCC3(0,0,10);
SpellData.create(SIDSHIELDOFSINDOREI,"辛多雷之盾",0,0,30,852090,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_LACERATE,"割伤",0,0,1.5,OrderId("coldarrowstarg"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_SAVAGE_ROAR,"野蛮咆哮",0,0,5,OrderId("purge"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_FOREST_CURE,"丛林治愈",0,0,1,OrderId("deathcoil"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_NATURAL_REFLEX,"自然反射",0,0,15,OrderId("dispel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SURVIVAL_INSTINCTS,"生存本能",0,0,60,OrderId("cripple"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDLIFEBLOOM,"生命绽放",50,0,1,OrderId("cripple"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDREJUVENATION,"回春术",75,0,1,OrderId("rejuvination"),1,ORDER_TYPE_TARGET).setCCC2(110,0,1).setCCC3(145,0,1);
SpellData.create(SIDREGROWTH,"愈合",100,3,0,OrderId("healingwave"),1,ORDER_TYPE_TARGET).setCCC2(120,3,0).setCCC3(140,3,0);
SpellData.create(SIDSWIFTMEND,"迅捷治愈",150,0,11,OrderId("replenishlife"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDTRANQUILITY,"宁静",200,8,40,OrderId("tranquility"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDTRANQUILITY1,"宁静",200,8,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDFLASHLIGHT,"闪耀之光",50,0,3.5,OrderId("innerfire"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDFLASHLIGHT1,"闪耀之光",50,0,2.2,OrderId("cripple"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDHOLYLIGHT,"圣光术",100,2.6,0,OrderId("holybolt"),1,ORDER_TYPE_TARGET).setCCC2(115,2.6,0).setCCC3(130,2.6,0);
SpellData.create(SIDHOLYLIGHT1,"圣光术",0,0,1,OrderId("curse"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDHOLYSHOCK,"神圣震击",100,0,15,OrderId("resurrection"),1,ORDER_TYPE_TARGET).setCCC2(150,0,15).setCCC3(200,0,15);
SpellData.create(SIDDIVINEFAVOR,"神恩",50,0,20,OrderId("massteleport"),1,ORDER_TYPE_IMMEDIATE).setCCC2(50,0,18).setCCC3(50,0,16);
SpellData.create(SIDBEACONOFLIGHT,"圣光印记",10,0,10,OrderId("summonphoenix"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDHEAL,"治疗术",75,0,1,852063,1,ORDER_TYPE_TARGET).setCCC2(100,0,1).setCCC3(125,0,1);
SpellData.create(SIDPRAYEROFHEALING,"治疗祷言",100,2.4,0,OrderId("blizzard"),1,ORDER_TYPE_POINT).setCCC2(100,2.1,0).setCCC3(100,1.8,0);
SpellData.create(SIDSHIELD,"护盾术",100,0,4,852055,1,ORDER_TYPE_TARGET).setCCC2(125,0,4).setCCC3(150,0,4);
SpellData.create(BID_SHIELD,"护盾术",0,0,0,1,1,ORDER_TYPE_TARGET);
SpellData.create(SIDPRAYEROFMENDING,"愈合祷言",75,0,9,852075,1,ORDER_TYPE_TARGET).setCCC2(85,0,7).setCCC3(95,0,5);
SpellData.create(SIDDISPEL,"驱散魔法",45,0,3,852057,1,ORDER_TYPE_TARGET).setCCC2(60,0,3).setCCC3(75,0,3);
SpellData.create(SIDDARKARROW,"黑箭",4,0,5,OrderId("thunderbolt"),1,ORDER_TYPE_TARGET).setCCC2(5,0,5).setCCC2(6,0,5);
SpellData.create(SIDCONCERNTRATION,"专注",0,0,13,OrderId("thunderclap"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDFREEZINGTRAP,"冰冻陷阱",0,0,16,OrderId("blizzard"),1,ORDER_TYPE_POINT).setCCC2(0,0,13).setCCC3(0,0,10);
SpellData.create(SIDPOWEROFABOMINATION,"憎恶之力",0,0,1,OID_IMMOLATIONON,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDDEATHPACT,"死亡契约",0,0,5,OrderId("stomp"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSUMMONGHOUL,"食尸鬼仆从",50,0,60,852503,1,ORDER_TYPE_IMMEDIATE).setCCC2(0,0,45).setCCC3(0,0,30);
SpellData.create(SIDLIFELEECH,"生命偷取",0,0,1,0,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_HEROIC_STRIKE,"英勇打击",0,0,1,OrderId("roar"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDREND,"撕裂",30,0,6,OrderId("whirlwind"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDOVERPOWER,"压制",0,0,3.5,OrderId("windwalk"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDMORTALSTRIKE,"致死打击",15,0,9,OrderId("drunkenhaze"),1,ORDER_TYPE_TARGET).setCCC2(25,0,8).setCCC3(35,0,7);
SpellData.create(SIDEXECUTELEARN,"斩杀",0,0,1,OrderId("massteleport"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEXECUTESTART,"斩杀",0,0,1,OrderId("spiritwolf"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEXECUTE1,"斩杀",0,0,1,OrderId("stomp"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEXECUTE2,"斩杀",0,0,1,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEXECUTE3,"斩杀",0,0,1,OrderId("channel"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEXECUTE4,"斩杀",0,0,1,OrderId("voodoo"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEXECUTEEND,"斩杀",0,0,1,OrderId("frostarmor"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDFROSTBOLT,"寒冰箭",15,2,0,OrderId("heal"),1,ORDER_TYPE_TARGET).setCCC2(30,2,0).setCCC3(45,2,0);
SpellData.create(SIDBLIZZARD,"暴风雪",100,5,0,OrderId("blizzard"),1,ORDER_TYPE_POINT);
SpellData.create(SIDBLIZZARD1,"暴风雪",170,0,5,OrderId("blizzard"),1,ORDER_TYPE_POINT);
SpellData.create(SIDFROSTNOVA,"冰冻新星",70,0,15,OrderId("frostnova"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDPOLYMORPH,"变形术",25,0,30,OrderId("polymorph"),1,ORDER_TYPE_TARGET).setCCC2(25,0,22).setCCC3(25,0,14);
SpellData.create(SIDPOLYMORPHDUMMY,"变形术",25,0,5,OrderId("hex"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_SPELL_TRANSFER,"法术转移",70,0,6,OrderId("dispel"),1,ORDER_TYPE_TARGET).setCCC2(210,0,3).setCCC3(350,0,1);
SpellData.create(SIDINTELLIGENCECHANNEL,"智慧导能",0,0,1,OrderId("channel"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_STORM_LASH,"风暴鞭笞",10,2,0,OrderId("forkedlightning"),1,ORDER_TYPE_TARGET).setCCC2(13,2,0).setCCC3(16,2,0);
SpellData.create(SIDSTORMSTRIKE,"风暴打击",0,0,1,OrderId("forkedlightning"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEARTHSHOCK,"大地震击",85,0,9,OrderId("thunderbolt"),1,ORDER_TYPE_TARGET).setCCC2(95,0,9).setCCC3(105,0,9);
SpellData.create(SIDEARTHSHOCK1,"大地震击",0,0,9,OrderId("frostarmor"),1,ORDER_TYPE_TARGET).setCCC2(0,0,9).setCCC3(0,0,9);
SpellData.create(SIDPURGE,"净化术",15,0,15,OrderId("purge"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDENCHANTEDTOTEM,"附魔图腾",0,0,1,OrderId("healingward"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDLIGHTNINGTOTEM,"闪电图腾",0,0,10,OrderId("blizzard"),1,ORDER_TYPE_POINT);
SpellData.create(SIDTORRENTTOTEM,"激流图腾",0,0,10,OrderId("flamestrike"),1,ORDER_TYPE_POINT);
SpellData.create(SIDEARTHBINDTOTEM,"地缚图腾",0,0,10,OrderId("dispel"),1,ORDER_TYPE_POINT);
SpellData.create(SID_ASCENDANCE,"升腾",25,0,40,OrderId("metamorphosis"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSINISTERSTRIKE,"邪恶攻击",0,0,2,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDEVISCERATE,"剔骨",0,0,2,OrderId("impale"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDASSAULT,"突袭",0,0,16,OrderId("deathcoil"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDBLADEFLURRY,"剑舞",0,0,30,OrderId("starfall"),1,ORDER_TYPE_IMMEDIATE).setCCC2(0,0,26).setCCC2(0,0,22);
SpellData.create(SIDSTEALTH,"潜行",0,0,45,OrderId("cyclone"),1,ORDER_TYPE_IMMEDIATE).setCCC2(0,0,35).setCCC2(0,0,25);
SpellData.create(SIDGARROTE,"绞喉",0,0,1,OrderId("shadowstrike"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDAMBUSH,"伏击",0,0,1,OrderId("thunderbolt"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDPAIN,"暗言字：痛",100,0,2,OrderId("slow"),1,ORDER_TYPE_TARGET).setCCC2(115,0,2).setCCC3(130,0,2);
SpellData.create(SIDMARROWSQUEEZE,"精髓榨取",70,2.3,0,OrderId("dispel"),1,ORDER_TYPE_TARGET).setCCC2(130,2.0,0).setCCC3(190,1.7,0);
SpellData.create(SIDMINDFLAY,"精神鞭笞",50,3,0,OrderId("heal"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDDEATH,"暗言字：死",0,0,7,OrderId("innerfire"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDTERROR,"暗言字：惧",75,0,12,OrderId("unholyfrenzy"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDFRENZYCREEP,"激怒",0,0,200,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDRAGECREEP,"狂暴",0,0,200,OrderId("charm"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_GRIP_OF_STATIC_ELECTRICITY,"静电之握",0,0,1,OrderId("healingwave"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_PULSE_BOMB,"脉冲爆弹",0,0,10,OrderId("charm"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_LASER_BEAM,"激光射线",0,10,25,OrderId("heal"),2,ORDER_TYPE_TARGET);
SpellData.create(SID_TINKER_MORPH,"坦克形态",0,0,0,OID_BEARFORM,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_LIGHTNING_SHIELD,"闪电护盾",0,0,1,OrderId("lightningshield"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_POCKET_FACTORY,"口袋工厂",0,0,10,OrderId("summonfactory"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SUMMON_CLOCKWORK_GOBLIN,"生产人工地精",0,4,1,OrderId("summonfactory"),2,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SELF_DESTRUCT,"自爆",0,3,1,OrderId("selfdestruct"),2,ORDER_TYPE_TARGET);
SpellData.create(SID_CLUSTER_ROCKETS,"火箭群",0,1,1,OrderId("clusterrockets"),2,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_FUCKED_LIGHTNING,"叉状闪电",100,0,7,852063,1,ORDER_TYPE_TARGET);
SpellData.create(SID_STRONG_BREEZE,"强风",100,0,14,852555,1,ORDER_TYPE_TARGET);
SpellData.create(SID_SUMMON_SERPENTS,"召唤飞蛇",100,0,30,852066,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_THUNDER_STORM,"雷电风暴",0,10,40,852069,2,ORDER_TYPE_TARGET);
SpellData.create(SIDALKALINEWATER,"盐碱之水",0,3.5,5,OrderId("heal"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDTIDE,"潮汐",0,0,12,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDTIDEBARONMORPH,"潮汐形态",0,0,35,OID_BEARFORM,1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDTEARUP,"撕裂",0,0,12,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDLANCINATE,"刺裂",0,0,15,OrderId("channel"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDRASPYROAR,"刺耳咆哮",0,0,25,OrderId("impale"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDRASPYROARDUMMY,"刺耳咆哮",0,0,1,OrderId("silence"),1,ORDER_TYPE_POINT);
SpellData.create(SIDFLAMETHROW,"火焰喷射",100,0,5,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDFLAMEBOMB,"火焰炸弹",100,10,40,OrderId("slow"),2,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSUMMONLAVASPAWN,"召唤炎魔",100,10,30,OrderId("soulburn"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDFRENZYWARLOCK,"激怒",0,0,200,OrderId("stomp"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_IMPALE,"穿刺",0,0,15,OrderId("impale"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_SUMMON_POISONOUS_CRAWLER,"召唤剧毒爬行者",0,0,25,OrderId("slow"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SUMMON_ABOMINATION,"召唤憎恶",0,0,15,OrderId("charm"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SUMMON_WRAITH,"召唤怨灵",0,0,15,OrderId("invisibility"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_LIFE_SIPHON,"生命虹吸",0,5,25,OrderId("sleep"),2,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSPIRITBOLT,"灵魂之箭",50,10,40,OrderId("heal"),2,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSPIRITHARVEST,"灵魂收割",0,0,35,OrderId("hex"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSUNFIRESTORMHEX,"阳炎风暴",100,0,10,OrderId("slow"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSHIELDOFSINDOREIHEX,"辛多雷之盾",0,0,10,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SAVAGE_ROAR_HEX,"野蛮咆哮",0,0,10,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_NATURAL_REFLEX_HEX,"自然反射",0,0,12,OrderId("slow"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDTRANQUILITYHEX,"宁静",100,8,10,OrderId("slow"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDLIFEBLOOMHEX,"生命绽放",25,0,10,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDHOLYBOLTHEX,"圣光术",100,4,10,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDHOLYSHOCKHEX,"神圣震击",50,0,10,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDHEALHEX,"医疗术",50,0,10,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDSHIELDHEX,"护盾术",100,0,10,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDMORTALSTRIKEHEX,"致死打击",0,0,10,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDOVERPOWERHEX,"压制",0,0,7,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDDARKARROWHEX,"黑箭",0,0,4,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDFREEZINGTRAPHEX,"冰冻陷阱",0,0,10,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDFROSTBOLTHEX,"寒冰箭",50,3,5,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDPOLYMORPHHEX,"变形术",50,0,10,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDLIGHTNINGTOTEMHEX,"闪电图腾",0,0,10,OrderId("slow"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDCHARGEHEX,"充能",100,0,15,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDSTEALTHHEX,"潜行",0,0,15,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDSTEALTHAMBUSH,"伏击",0,0,1,OrderId("stomp"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDBLADEFLURRYHEX,"剑舞",0,0,10,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDPAINHEX,"暗言字：痛",100,0,15,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SIDTERRORHEX,"暗言字：惧",100,0,10,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_LIGHTNING_BOLT,"闪电箭",75,3,2,OrderId("heal"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_FROST_SHOCK,"冰霜冲击",0,0,8,OrderId("freezingbreath"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_CHAIN_HEALING,"治疗链",200,3,5,OrderId("healingwave"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_HEALING_WARD,"治疗守卫",100,0,15,OrderId("healingward"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_PROTECTION_WARD,"防护守卫",100,0,30,OrderId("evileye"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_NAGA_FRENZY,"狂乱",0,0,20,OrderId("unholyfrenzy"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ARMOR_CRUSHING,"压碎护甲",0,0,20,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_THUNDER_CLAP,"雷霆一击",0,0,12,OrderId("thunderclap"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_RAGE_ROAR,"狂怒咆哮",0,0,20,OrderId("slow"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_STING,"毒刺(被动)",0,0,1,0,1,ORDER_TYPE_IMMEDIATE);
//
SpellData.create(SID_CHARGED_BREATH,"充能之息",0,0,5,OrderId("heal"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MANA_LEECH,"法力汲取",0,0,5,OrderId("healingwave"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_UNHOLY_FRENZY,"邪恶狂热",0,0,12,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHAOS_LEAP,"混乱跳跃",0,0,20,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_WAR_STOMP,"战争践踏",0,4,8,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_BATTLE_COMMAND,"战斗命令",0,0,6,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_BLAZING_HASTE,"炽热疾速",75,0,5,852063,1,ORDER_TYPE_TARGET);
SpellData.create(SID_FIRE_BALL,"连珠火球",100,3,1,OrderId("sleep"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_FLAME_SHOCK,"烈焰震击",50,0,5,OrderId("slow"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_DEATH_AND_DECAY,"死亡凋零",0,0,8,OrderId("heal"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_PARASITE,"寄生",0,0,0,0,1,ORDER_TYPE_TARGET);
SpellData.create(SID_GNAW,"啃食",0,5,0,OrderId("sleep"),2,ORDER_TYPE_TARGET);
SpellData.create(SID_MANA_TAP,"法力流失",0,0,13,OrderId("sleep"),1,ORDER_TYPE_POINT);
SpellData.create(SID_FROST_GRAVE,"冰冻坟墓",0,0,8,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_NETHER_BOLT,"虚空之箭",0,0,7,OrderId("sleep"),1,ORDER_TYPE_TARGET);
SpellData.create(SID_METEOR,"陨石",0,0,7,OrderId("blizzard"),1,ORDER_TYPE_POINT);

SpellData.create(SIDCALLTOARMS,"战斗召唤",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CTHUNS_DERANGEMENT,"上古狂乱",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDENIGMA,"谜团",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_GOBLIN_ROCKET_BOOTS_LIMITED_EDITION,"地精火箭靴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_HEALTH_STONE,"医疗石",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MANA_STONE,"魔法石",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_HEX_SHRUNKEN_HEAD,"妖术之颅",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ICON_OF_THE_UNGLAZED_CRESCENT,"无光的新月徽记",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDLIGHTSJUSTICE,"圣光的正义",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MOROES_LUCKY_GEAR,"莫罗斯的幸运怀表",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SIDREFORGEDBADGEOFTENACITY,"重铸的坚韧徽章",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_TYRAELS_MIGHT,"正义天使之力",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_VOODOO_VIAL,"巫毒瓶",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ARMAGEDDON_SCROLL,"末日审判",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ARANS_COUNTER_SPELL_SCROLL,"埃兰的反制卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_BANSHEE_SCROLL,"女妖之嚎卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CORRUPTION_SCROLL,"腐蚀卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_DEFEND_SCROLL,"守护卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_FRENZY_SCROLL,"狂热卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_HEAL_SCROLL,"医疗卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MANA_SCROLL,"魔法卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MASS_DISPEL_SCROLL,"大型驱魔卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MASS_TELEPORT_SCROLL,"群体传送卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ROAR_SCROLL,"野兽卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SANCTUARY_SCROLL,"庇护所卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SLAYER_SCROLL,"杀戮卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SPEED_SCROLL,"加速卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SPELL_REFLECTION_SCROLL,"绝缘卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_WEAKEN_CURSE_SCROLL,"虚弱诅咒卷轴",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_LIFE_POTION,"生命药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MANA_POTION,"魔法药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_LEECH_POTION,"吸血药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_LIFE_REGEN_POTION,"再生药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MANA_REGEN_POTION,"清晰预兆药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_MANA_SOURCE_POTION,"魔力之源",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_TRANQUILITY_POTION,"宁静药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_BIG_LIFE_POTION,"大生命药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ARCH_MAGE_POTION,"魔导师药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_COMBAT_MASTER_POTION,"战斗大师药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_EMPERORS_NEW_POTION,"皇帝的新药",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_TRANSFER_POTION,"转换药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SHIELD_POTION,"护盾药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_FORTRESS_POTION,"壁垒药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_DODGE_POTION,"闪避药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SMALL_INVUL_POTION,"小无敌药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_INVUL_POTION,"无敌药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_STONE_SKIN_POTION,"石皮药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SPELL_POWER_POTION,"法能药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SPELL_MASTER_POTION,"法术掌控药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ARCANE_POTION,"秘法药剂",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ANGRY_CAST_POTION,"愤怒施法药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_SPELL_PIERCE_POTION,"法术穿透药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_UNSTABLE_POTION,"不稳定的药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_AGILITY_POTION,"敏捷药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_ACUTE_POTION,"敏锐药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_DEXTERITY_POTION,"迅捷药水",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHARM_OF_SIMPLE_HEAL,"简易治疗符咒",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHARM_OF_DISPEL,"驱散术符咒",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHARM_OF_HEALING_WARD,"治疗结界符咒",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHARM_OF_INNER_FIRE,"心灵之火符咒",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHARM_OF_CHAIN_LIGHTNING,"闪电链符咒",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHARM_OF_DEATH_FINGER,"死亡之指符咒",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_CHARM_OF_SIPHON_LIFE,"生命虹吸符咒",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_DEMONIC_RUNE,"恶魔符文",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);
SpellData.create(SID_STRANGE_WAND,"奇异的魔杖",0,0,1,OrderId("channel"),1,ORDER_TYPE_IMMEDIATE);

        }
    }
}
//! endzinc
