﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.cliPackets;
using wServer.svrPackets;
using wServer.realm.setpieces;

namespace wServer.realm.entities
{
    partial class Player
    {
        public void PlayerText(RealmTime time, PlayerTextPacket pkt)
        {
            if (pkt.Text[0] == '/')
            {
                string[] x = pkt.Text.Trim().Split(' ');
                ProcessCmd(x[0].Trim('/'), x.Skip(1).ToArray());
            }
            else
                Owner.BroadcastPacket(new TextPacket()
                {
                    Name = Name,
                    ObjectId = Id,
                    Stars = Stars,
                    BubbleTime = 5,
                    Recipient = "",
                    Text = pkt.Text,
                    CleanText = pkt.Text
                }, null);
        }

        bool CmdReqAdmin()
        {
            /*
            if (!psr.Account.Admin)
            {
                psr.SendPacket(new TextPacket()
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "*Error*",
                    Text = "No permission!"
                });
                return false;
            }
            else
             */
                return true;
        }
        void ProcessCmd(string cmd, string[] args)
        {
            if (cmd.Equals("tutorial", StringComparison.OrdinalIgnoreCase))
                psr.Reconnect(new ReconnectPacket()
                {
                    Host = "",
                    Port = 2050,
                    GameId = World.TUT_ID,
                    Name = "Tutorial",
                    Key = Empty<byte>.Array,
                });
            else if (cmd.Equals("spawn", StringComparison.OrdinalIgnoreCase) &&
                     CmdReqAdmin() && args.Length > 0)
            {
                string name = string.Join(" ", args);
                short objType;
                if (!XmlDatas.IdToType.TryGetValue(name, out objType) ||
                    !XmlDatas.ObjectDescs.ContainsKey(objType))
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Unknown entity!"
                    });
                else
                {
                    var entity = Entity.Resolve(objType);
                    entity.Move(X, Y);
                    Owner.EnterWorld(entity);
                }
            }
            else if (cmd.Equals("spawnx", StringComparison.OrdinalIgnoreCase) &&
                     CmdReqAdmin() && args.Length > 1)
            {
                string name = string.Join(" ", args.Skip(1).ToArray());
                short objType;
                if (!XmlDatas.IdToType.TryGetValue(name, out objType) ||
                    !XmlDatas.ObjectDescs.ContainsKey(objType))
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Unknown entity!"
                    });
                else
                {
                    int c = int.Parse(args[0]);
                    for (int i = 0; i < c; i++)
                    {
                        var entity = Entity.Resolve(objType);
                        entity.Move(X, Y);
                        Owner.EnterWorld(entity);
                    }
                }
            }
            else if (cmd.Equals("addEff", StringComparison.OrdinalIgnoreCase) &&
                     CmdReqAdmin() && args.Length == 1)
            {
                try
                {
                    ApplyConditionEffect(new ConditionEffect()
                    {
                        Effect = (ConditionEffectIndex)Enum.Parse(typeof(ConditionEffectIndex), args[0].Trim()),
                        DurationMS = -1
                    });
                }
                catch
                {
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Invalid effect!"
                    });
                }
            }
            else if (cmd.Equals("removeEff", StringComparison.OrdinalIgnoreCase) &&
                     CmdReqAdmin() && args.Length == 1)
            {
                try
                {
                    ApplyConditionEffect(new ConditionEffect()
                    {
                        Effect = (ConditionEffectIndex)Enum.Parse(typeof(ConditionEffectIndex), args[0].Trim()),
                        DurationMS = 0
                    });
                }
                catch
                {
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Invalid effect!"
                    });
                }
            }
            else if (cmd.Equals("give", StringComparison.OrdinalIgnoreCase) &&
                     CmdReqAdmin() && args.Length >= 1)
            {
                string name = string.Join(" ", args.ToArray()).Trim();
                short objType;
                if (!XmlDatas.IdToType.TryGetValue(name, out objType))
                {
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Unknown type!"
                    });
                    return;
                }
                for (int i = 0; i < Inventory.Length; i++)
                    if (Inventory[i] == null)
                    {
                        Inventory[i] = XmlDatas.ItemDescs[objType];
                        UpdateCount++;
                        return;
                    }
            }
            else if (cmd.Equals("tp", StringComparison.OrdinalIgnoreCase) &&
                     CmdReqAdmin() && args.Length >= 2)
            {
                int x, y;
                try
                {
                    x = int.Parse(args[0]);
                    y = int.Parse(args[1]);
                }
                catch
                {
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Invalid coordinates!"
                    });
                    return;
                }
                Move(x + 0.5f, y + 0.5f);
                SetNewbiePeriod();
                UpdateCount++;
                Owner.BroadcastPacket(new GotoPacket()
                {
                    ObjectId = Id,
                    Position = new Position()
                    {
                        X = X,
                        Y = Y
                    }
                }, null);
            }
            else if (cmd.Equals("setpiece", StringComparison.OrdinalIgnoreCase) &&
                     CmdReqAdmin() && args.Length == 1)
            {
                try
                {
                    ISetPiece piece = (ISetPiece)Activator.CreateInstance(Type.GetType(
                        "wServer.realm.setpieces." + args[0]));
                    piece.RenderSetPiece(Owner, new IntPoint((int)X + 1, (int)Y + 1));
                }
                catch
                {
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Cannot apply setpiece!"
                    });
                }
            }
            else if (cmd.Equals("pause", StringComparison.OrdinalIgnoreCase))
            {
                try
                {
                    ApplyConditionEffect(new ConditionEffect()
                    {
                        Effect = ConditionEffectIndex.Paused,
                        DurationMS = -1
                    });
                }
                catch
                {
                    psr.SendPacket(new TextPacket()
                    {
                        BubbleTime = 0,
                        Stars = -1,
                        Name = "",
                        Text = "Invalid effect!"
                    });
                }
            }
            else
                psr.SendPacket(new TextPacket()
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "",
                    Text = "Unknown command!"
                });
        }
    }
}
