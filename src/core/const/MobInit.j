//! zinc
library MobInit requires Table, BuffSystem, Patrol, NefUnion, WarlockGlobal, StunUtils {
#define MOBINIT_RESPAWN_L 10
#define MOBINIT_RESPAWN_H 20

    private HandleTable idTable;
    private integer numMobs;
    
    function cancelForm(DelayTask dt) {
        IssueImmediateOrderById(dt.u0, OID_UNBEARFORM);
    }
    
    function cancelStun(DelayTask dt) {
        RemoveStun(dt.u0);
    }	

    public function ResetMob(unit u) {
        integer id = idTable[u];
        BuffSlot[u].removeAllBuff();   
        if (UnitProp[u].Stunned()) {
            // print("cancel stun");
            DelayTask.create(cancelStun, 0.5).u0 = u;
        }     

        if (GetUnitTypeId(u) == UTID_ARCH_TINKER_MORPH || GetUnitTypeId(u) == UTIDTIDEBARONWATER) {
            DelayTask.create(cancelForm, 1.0).u0 = u;
        }
		
		if (GetUnitTypeId(u) == UTIDWARLOCK) {
			ResetFireRunes();
		}
        
        IssueImmediateOrderById(u, OID_STOP);
        PauseUnit(u, true);
        SetUnitX(u, mobInfo[id].x);
        SetUnitY(u, mobInfo[id].y);
        SetUnitFacing(u, mobInfo[id].f);
        SetWidgetLife(u, GetUnitState(u, UNIT_STATE_MAX_LIFE));
        SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA));
        PauseUnit(u, false);
    }
    
    private struct mobInfo[] {
        integer utid;
        real x, y, f;
        unit u;
        integer respawnCounter;
        integer respawning;
        integer respawnTime;
        integer respawnTimeVar;
        Patroller p;
    }
    
    private function onInit() {
        numMobs = 0;
        idTable = HandleTable.create();

        TimerStart(CreateTimer(), 5.0, true, function() {
            integer i;
            for (0 <= i < numMobs) {
                if (IsUnitDead(mobInfo[i].u)) {
                    if (mobInfo[i].respawning == -1) {
                        mobInfo[i].respawning = 1;
                        mobInfo[i].respawnCounter = GetRandomInt(mobInfo[i].respawnTime, mobInfo[i].respawnTimeVar);
                    } else {
                        mobInfo[i].respawnCounter -= 5;
                        if (mobInfo[i].respawnCounter <= 0) {
                            mobInfo[i].respawning = -1;
                            mobInfo[i].u = CreateUnit(Player(MOB_PID), mobInfo[i].utid, mobInfo[i].x, mobInfo[i].y, mobInfo[i].f);
                            idTable[mobInfo[i].u] = i;
                        }
                    }
                }
            }
        });

        TimerStart(CreateTimer(), 0.15, false, function() {
        
            //! textmacro WriteInitMobInfo takes typeid, x, y, f
            u = CreateUnit(Player(10), '$typeid$', $x$, $y$, $f$);
            mobInfo[numMobs].x = $x$; 
            mobInfo[numMobs].y = $y$; 
            mobInfo[numMobs].f = $f$; 
            mobInfo[numMobs].utid = '$typeid$';
            mobInfo[numMobs].u = u;
            mobInfo[numMobs].respawnCounter = 0;
            mobInfo[numMobs].respawning = -1;
            mobInfo[numMobs].respawnTime = MOBINIT_RESPAWN_L;
            mobInfo[numMobs].respawnTimeVar = MOBINIT_RESPAWN_H;
            mobInfo[numMobs].p = 0;
            idTable[u] = numMobs;
            numMobs = numMobs + 1;
            //! endtextmacro
            
            unit u;
            Patroller p;
            DestroyTimer(GetExpiredTimer());
            // ********************* boss ************************
            //! runtextmacro WriteInitMobInfo("Ntin", "-8022.00", "-11433", "134")
            //! runtextmacro WriteInitMobInfo("Hvsh", "-6593.5", "-5616.7", "0.0")
            //! runtextmacro WriteInitMobInfo("Udea", "5819.00", "-4582.0", "90.0")
            //! runtextmacro WriteInitMobInfo("Ulic", "4608.00", "768.0", "270.0")
            //! runtextmacro WriteInitMobInfo("Ucrl", "5133.00", "8502.0", "0.0")
            // runtextmacro WriteInitMobInfo("Nplh", "-5511.00", "579.0", "90.0")
            //! runtextmacro WriteInitMobInfo("Oshd", "573.00", "4800.0", "270.0")
            // runtextmacro WriteInitMobInfo("Opgh", "741.00", "8989.0", "270.0")
            
            // ********************* �̶� ************************

            //! runtextmacro WriteInitMobInfo("n00G", "3241", "-11914", "0")
            //! runtextmacro WriteInitMobInfo("n00G", "3228", "-12590", "0")
        
            // - - - - - - - - �� 1 - - - - - - - - 
            // ���ſ�ʼ2����
            //! runtextmacro WriteInitMobInfo("n00G", "-2615.4", "-12025", "0")
            //! runtextmacro WriteInitMobInfo("n00G", "-2571.5", "-12578", "0")
            // ��1ǰ��۲��� 2����+1С����
            //! runtextmacro WriteInitMobInfo("n00G", "-6339", "-11097", "195")
            //! runtextmacro WriteInitMobInfo("n00F", "-6427", "-10957", "212")
            //! runtextmacro WriteInitMobInfo("n00F", "-6286", "-11264", "183")
            
            // - - - - - - - - �� 2 - - - - - - - - 
            // ��������2������
            //! runtextmacro WriteInitMobInfo("n00A", "-6334", "-8858", "259")
            //! runtextmacro WriteInitMobInfo("n00A", "-5753", "-8875", "225")
            // ���� 1�ʼ�����+3С����(��ʵ�ǵ������~~~)
            //! runtextmacro WriteInitMobInfo("n00E", "-640", "-8653", "353")
            //! runtextmacro WriteInitMobInfo("n00G", "-415", "-8512", "325")
            //! runtextmacro WriteInitMobInfo("n00G", "-395", "-8681", "356")
            //! runtextmacro WriteInitMobInfo("n00G", "-252", "-8778", "17")
            
            // ����̨���� С����
            //! runtextmacro WriteInitMobInfo("n00G", "-271", "-8000", "115")
            // ���� ˮ��2��ʦ
            //! runtextmacro WriteInitMobInfo("n00B", "1107", "-5137", "237")
            //! runtextmacro WriteInitMobInfo("n000", "1274", "-5295", "201")
            // ԭ�ڱ�����˾
            //! runtextmacro WriteInitMobInfo("n00B", "-1565", "-7752", "38")
            // ��һ������ 2��ʦ
            //! runtextmacro WriteInitMobInfo("n00B", "-1563", "-5381", "276")
            //! runtextmacro WriteInitMobInfo("n000", "-2074", "-4934", "270")
            // ����1̨��1�ʼ�����2Ů��
            //! runtextmacro WriteInitMobInfo("n000", "-3448", "-5816", "0")
            //! runtextmacro WriteInitMobInfo("n000", "-3448", "-4953", "0")
            //! runtextmacro WriteInitMobInfo("n00E", "-4144", "-5477", "0")
            // ���ұ�1��˾3С����
            //! runtextmacro WriteInitMobInfo("n00B", "2458", "-4635", "0")
            //! runtextmacro WriteInitMobInfo("n00G", "2605", "-4452", "215")
            //! runtextmacro WriteInitMobInfo("n00G", "2661", "-4643", "164")
            //! runtextmacro WriteInitMobInfo("n00G", "2612", "-4833", "133")
            
            // �ɺԵĺ� ��˾�ͺ���
            //! runtextmacro WriteInitMobInfo("n00B", "-2686", "-2246", "0")
            //! runtextmacro WriteInitMobInfo("n00F", "-2886", "-2848", "0")
            // ��3 2����
            //! runtextmacro WriteInitMobInfo("n00A", "3267", "-6580", "50")
            //! runtextmacro WriteInitMobInfo("n00A", "3903", "-5792", "229")
            // ��3 ������� 2��ʦ
            //! runtextmacro WriteInitMobInfo("n000", "4783", "-6271", "270")
            //! runtextmacro WriteInitMobInfo("n00B", "5031", "-6271", "270")
            // ��3 ��̨3սʿ
            //! runtextmacro WriteInitMobInfo("n00A", "5713", "-5830", "270")
            //! runtextmacro WriteInitMobInfo("n00E", "5418", "-5632", "270")
            //! runtextmacro WriteInitMobInfo("n00E", "5990", "-5632", "270")
            
            
            // ********************* Ѳ�� ************************
            // ���ų�ǽ��Ѳ�߶����Ǻ�С������
            //! runtextmacro WriteInitMobInfo("n00F", "-3225", "-12331", "0")
            p = Patroller.create(u);
            p.add(-5018, -12323).add(-4765, -9593).add(-3123, -10680);
            //! runtextmacro WriteInitMobInfo("n00F", "-4630", "-13888", "0")
            p = Patroller.create(u);
            p.add(-7841, -13484).add(-4262, -10977);
            //! runtextmacro WriteInitMobInfo("n00F", "-6744", "-13557", "0")
            p = Patroller.create(u);
            p.add(-4457, -9691);
            //! runtextmacro WriteInitMobInfo("n00G", "-6035", "-11797", "0")
            p = Patroller.create(u);
            p.add(-3843, -12525);
            //! runtextmacro WriteInitMobInfo("n00G", "-3843", "-12525", "0")
            p = Patroller.create(u);
            p.add(-6035, -11797);
            // ��1����2Ѳ�߱�ͽ
            //! runtextmacro WriteInitMobInfo("n00A", "-4482", "-7778", "90")            
            p = Patroller.create(u);
            p.add(-4671, -6485).add(-3783, -6241);
            // ��1���2Ѳ�߱�ͽ��¥�Ͽ�ʼһ����¥�¿�ʼһ��
            //! runtextmacro WriteInitMobInfo("n00A", "-3710", "-5416", "0")
            p = Patroller.create(u);
            p.add(-1557, -5693).add(-1549, -7458).add(-785, -7353).add(-692, -6261);
            //! runtextmacro WriteInitMobInfo("n00A", "-328", "-6216", "180")
            p = Patroller.create(u);
            p.add(-1022, -7682).add(-1704, -7312).add(-1438, -5695).add(-2192, -4962).add(-3919, -5882).add(-4512, -7884);
            // ��1Ժ��С����
            //! runtextmacro WriteInitMobInfo("n00G", "-2938", "-5436", "0")
            p = Patroller.create(u);
            p.add(-1923, -5230);
            // �ܵ�Ů����С����
            //! runtextmacro WriteInitMobInfo("n000", "-346", "-5030", "137")
            p = Patroller.create(u);
            p.add(-2509, -3170);
            //! runtextmacro WriteInitMobInfo("n00G", "-450", "-5171", "137")
            p = Patroller.create(u);
            p.add(-2509, -3170);
            // ���ű�ͽ
            //! runtextmacro WriteInitMobInfo("n00A", "505", "-6304", "90")
            p = Patroller.create(u);
            p.add(501, -5077);// p.add(-1704, -7312); p.add(-1438, -5695); p.add(-2192, -4962); p.add(-3919, -5882); p.add(-4512, -7884);
            // �ſ�ľ¥����2����Ѳ��С����
            //! runtextmacro WriteInitMobInfo("n00G", "-62", "-5195", "270")
            p = Patroller.create(u);
            p.add(12, -6362).add(1191, -5290);
            //! runtextmacro WriteInitMobInfo("n00G", "1092", "-6412", "90")
            p = Patroller.create(u);
            p.add(1208, -5049).add(136, -6395);
            // ˮ�л���Ѳ�ߺ���
            //! runtextmacro WriteInitMobInfo("n00F", "1412", "-4008", "180")
            p = Patroller.create(u);
            p.add(1629, -1629).add(-730, -1797).add(-593, -3892);
            // ����3̨��С����
            //! runtextmacro WriteInitMobInfo("n00G", "1444", "-5191", "0")
            p = Patroller.create(u);
            p.add(3173, -5314).add(4567, -6594);
            // ��ˮС����
            //! runtextmacro WriteInitMobInfo("n00G", "2220", "-6036", "129")
            p = Patroller.create(u);
            p.add(1461, -4185);

            u = null;
        });
    }
#undef MOBINIT_RESPAWN_L
#undef MOBINIT_RESPAWN_H
}
//! endzinc
