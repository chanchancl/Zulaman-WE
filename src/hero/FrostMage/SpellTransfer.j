//! zinc
library SpellTransfer requires BuffSystem, SpellEvent, UnitProperty {
    
    function returnNumberOfDispel(integer lvl) -> integer {
        if (lvl < 3) {
            return lvl;
        } else {
            return 999;
        }
    }

    function onCast() {
        Buff buf, tmp;
        integer lvl = GetUnitAbilityLevel(SpellEvent.CastingUnit, SID_SPELL_TRANSFER);
        integer num = returnNumberOfDispel(lvl);
        BuffSlot bl;
        integer i;
        unit t;
        if (!IsUnitEnemy(SpellEvent.TargetUnit, GetOwningPlayer(SpellEvent.CastingUnit))) {
            //print("my friend?");
            //print(I2S(buf));
            i = 0;
            while (i < num) {
                buf = BuffSlot[SpellEvent.TargetUnit].dispel(BUFF_MAGE, BUFF_NEG);
                if (buf != 0) {
                    if (!IsUnitDead(buf.bd.caster)) {     
                        //print("negative buff catched");
                        bl = BuffSlot[buf.bd.caster];
                        tmp = bl.getBuffByBid(buf.bd.bt.bid);
                        if (tmp != 0) {
                            //print("removing duplicated buff");
                            tmp.onRemove();
                            tmp.destroy();
                        }
                        buf.bd.target = buf.bd.caster;
                        buf.bd.caster = SpellEvent.CastingUnit;
                        buf.refresh();
                        bl.push(buf);
                        
                        DamageTarget(SpellEvent.CastingUnit, buf.bd.target, 100 + UnitProp[SpellEvent.CastingUnit].SpellPower(), SpellData[SID_SPELL_TRANSFER].name, false, true, false, WEAPON_TYPE_WHOKNOWS);  
                    }
                } else {
                    i += 999;
                }
                i += 1;
            }
        } else {
            i = 0;
            while (i < num) {
                buf = BuffSlot[SpellEvent.TargetUnit].dispel(BUFF_MAGE, BUFF_POS);
                if (buf != 0) {                        
                    DamageTarget(SpellEvent.CastingUnit, SpellEvent.TargetUnit, 100 + UnitProp[SpellEvent.CastingUnit].SpellPower(), SpellData[SID_SPELL_TRANSFER].name, false, true, false, WEAPON_TYPE_WHOKNOWS);  
                    
                    //print("positive buff catched");
                    bl = BuffSlot[SpellEvent.CastingUnit];
                    tmp = bl.getBuffByBid(buf.bd.bt.bid);
                    if (tmp != 0) {
                        //print("removing duplicated buff");
                        tmp.onRemove();
                        tmp.destroy();
                    }
                    buf.bd.caster = SpellEvent.CastingUnit;
                    buf.bd.target = SpellEvent.CastingUnit;
                    buf.refresh();
                    bl.push(buf);
                    SetLastStolen(SpellEvent.CastingUnit, buf);
                } else {
                    i += 999;
                }
                i += 1;
            }
        }
        AddTimedEffect.atUnit(ART_SPELLSTEAL, SpellEvent.TargetUnit, "origin", 0.2);
    }

    function onCast1() {
        BuffSlot bl;
        Buff tmp;
        Buff buf = GetLastStolen(SpellEvent.CastingUnit);
        if (buf != 0) {
            BuffSlot[SpellEvent.CastingUnit].dispelByBuff(buf);
            bl = BuffSlot[SpellEvent.TargetUnit];
            tmp = bl.getBuffByBid(buf.bd.bt.bid);
            if (tmp != 0) {
                //print("removing duplicated buff");
                tmp.onRemove();
                tmp.destroy();
            }
            buf.bd.caster = SpellEvent.CastingUnit;
            buf.bd.target = SpellEvent.TargetUnit;
            buf.refresh();
            bl.push(buf);
            SetLastStolen(SpellEvent.CastingUnit, 0);
        }
    }

    function onInit() {
        RegisterSpellEffectResponse(SID_SPELL_TRANSFER, onCast);
        RegisterSpellEffectResponse(SIDINTELLIGENCECHANNEL, onCast1);
    }
}
//! endzinc
