using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.realm;
using wServer.logic.attack;
using wServer.logic.movement;
using wServer.logic.loot;
using wServer.logic.taunt;
using wServer.logic.cond;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        static _ ArchdemonMalphas = Behav()
            .Init(0x090a, Behaves("Archdemon Malphas",
                    new RunBehaviors(
                        Cooldown.Instance(1000, MultiAttack.Instance(25, 10 * (float)Math.PI / 180, 3, 0, projectileIndex: 1)),
                        Cooldown.Instance(1000, MultiAttack.Instance(25, 10 * (float)Math.PI / 180, 3, 0, projectileIndex: 2)),
                        Cooldown.Instance(1000, MultiAttack.Instance(25, 10 * (float)Math.PI / 180, 2, 0, projectileIndex: 3)),
                        Cooldown.Instance(1000, MultiAttack.Instance(25, 10 * (float)Math.PI / 180, 3, 0, projectileIndex: 4)),
                        Cooldown.Instance(1000, MultiAttack.Instance(25, 10 * (float)Math.PI / 180, 2, 0, projectileIndex: 5)),
                        Cooldown.Instance(1000, MultiAttack.Instance(25, 10 * (float)Math.PI / 180, 3, 0, projectileIndex: 6)),
                        Cooldown.Instance(10000, new SimpleTaunt("Puny mortals! My {HP} HP will annihilate you!"))
                    ),
                    new RunBehaviors(
                        HpGreaterEqual.Instance(15000,
                            new RunBehaviors(
                                SimpleWandering.Instance(2, 5),
                                Cooldown.Instance(3600, MultiAttack.Instance(25, 45 * (float)Math.PI / 180, 8, 0, projectileIndex: 0))
                            )
                        ),
                        HpLesserPercent.Instance(0.3f,
                            new RunBehaviors(
                                Chasing.Instance(3, 25, 2, null),
                                Cooldown.Instance(2200, MultiAttack.Instance(25, 45 * (float)Math.PI / 180, 8, 0, projectileIndex: 0)),
                                Once.Instance(SetConditionEffect.Instance(ConditionEffectIndex.Invulnerable)),
                                Once.Instance(new SimpleTaunt("Can't... keep... henchmen... alive... anymore! ARGHHH!!!")),
                                Cooldown.Instance(8000, Once.Instance(UnsetConditionEffect.Instance(ConditionEffectIndex.Invulnerable))),
                                Cooldown.Instance(8000, Once.Instance(RingAttack.Instance(15, 0, 2, projectileIndex: 7))),
                                Cooldown.Instance(8000, Once.Instance(RingAttack.Instance(15, projectileIndex: 8)))
                            )
                        )
                    ),
                    loot: new LootBehavior(LootDef.Empty,
                        Tuple.Create(100, new LootDef(0, 4, 0, 4,
                            Tuple.Create(0.05, (ILoot)new ItemLoot("Demon Blade")), //5% de chance de loot Dblade

                            Tuple.Create(0.1, (ILoot)new TierLoot(5, ItemType.Ability)),

                            Tuple.Create(0.15, (ILoot)new TierLoot(12, ItemType.Armor)),

                            Tuple.Create(0.2, (ILoot)new TierLoot(11, ItemType.Weapon)),

                            Tuple.Create(0.1, (ILoot)new TierLoot(5, ItemType.Ring)),

                            Tuple.Create(0.7, (ILoot)new StatPotionLoot(StatPotion.Vit)),
                            Tuple.Create(0.7, (ILoot)new StatPotionLoot(StatPotion.Def))
                    )))
            ));
    }
}
