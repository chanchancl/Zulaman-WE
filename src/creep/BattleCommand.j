//! zinc
library BattleCommand requires DamageSystem {
/*
target ally deals 100% more damage
duration 12 seconds
magic positive effect
*/
#define DURATION 10.0
#define ART_LEFT "Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl"
#define ART_RIGHT "Abilities\\Spells\\Orc\\Bloodlust\\BloodlustSpecial.mdl"

    function onEffect(Buff buf) { 
        UnitProp[buf.bd.target].damageDealt += buf.bd.r0;
    }

    function onRemove(Buff buf) {
        UnitProp[buf.bd.target].damageDealt -= buf.bd.r0;
    }

    function onCast() {
        Buff buf = Buff.cast(SpellEvent.CastingUnit, SpellEvent.TargetUnit, BID_BATTLE_COMMAND);
        buf.bd.tick = -1;
        buf.bd.interval = DURATION;
        UnitProp[buf.bd.target].damageDealt -= buf.bd.r0;
        buf.bd.r0 = 1.0;
        if (buf.bd.e0 == 0) {buf.bd.e0 = BuffEffect.create(ART_LEFT, buf, "hand,left");}
        if (buf.bd.e1 == 0) {buf.bd.e1 = BuffEffect.create(ART_RIGHT, buf, "hand,right");}
        buf.bd.boe = onEffect;
        buf.bd.bor = onRemove;
        buf.run();
    }

    function onInit() {
        BuffType.register(BID_BATTLE_COMMAND, BUFF_MAGE, BUFF_POS);
        RegisterSpellEffectResponse(SID_BATTLE_COMMAND, onCast);
    }
#undef DURATION
#undef ART_LEFT
#undef ART_RIGHT
}
//! endzinc
