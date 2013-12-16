﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Xml;
using db;
using System.Xml.Serialization;
using System.IO;
using MySql.Data.MySqlClient;
using System.Web;
using System.Collections.Specialized;

namespace server.@char
{
    class list : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            NameValueCollection query;
            using (StreamReader rdr = new StreamReader(context.Request.InputStream))
                query = HttpUtility.ParseQueryString(rdr.ReadToEnd());

            using (var db = new Database())
            {

                Chars chrs = new Chars()
                {
                    Characters = new List<Char>() { },
                    NextCharId = 2,
                    MaxNumChars = 1,
                    Account = db.Verify(query["guid"], query["password"]),
                    Servers = new List<ServerItem>()
                    {
                        new ServerItem()
                        {
                            Name = "Dushy's Realm",
                            Lat = 22.28,
                            Long = 114.16,
                            DNS = "127.0.0.1",
                            Usage = 0.2,
                            AdminOnly = false
                        },
                        new ServerItem()
                        {
                            Name = "Fuck your mom",
                            Lat = 22.28,
                            Long = 114.16,
                            DNS = "127.0.0.1",
                            Usage = 0.2,
                            AdminOnly = true
                        },
                        new ServerItem()
                        {
                            Name = "Admin Realm",
                            Lat = 22.28,
                            Long = 114.16,
                            DNS = "127.0.0.1",
                            Usage = 0.2,
                            AdminOnly = true
                        },
                        new ServerItem()
                        {
                            Name = "Wine Cellar",
                            Lat = 22.28,
                            Long = 114.16,
                            DNS = "127.0.0.1",
                            Usage = 0.2,
                            AdminOnly = true
                        },
                        new ServerItem()
                        {
                            Name = "Strip Tease Club",
                            Lat = 22.28,
                            Long = 114.16,
                            DNS = "127.0.0.1",
                            Usage = 0.2,
                            AdminOnly = true
                        }
                    }
                };
                if (chrs.Account != null)
                {
                    db.GetCharData(chrs.Account, chrs);
                    db.LoadCharacters(chrs.Account, chrs);
                    chrs.News = db.GetNews(chrs.Account);
                }
                else
                {
                    chrs.Account = Database.CreateGuestAccount(query["guid"]);
                    chrs.News = db.GetNews(null);
                }

                MemoryStream ms = new MemoryStream();
                XmlSerializer serializer = new XmlSerializer(chrs.GetType(), new XmlRootAttribute(chrs.GetType().Name) { Namespace = "" });

                XmlWriterSettings xws = new XmlWriterSettings();
                xws.OmitXmlDeclaration = true;
                xws.Encoding = Encoding.UTF8;
                XmlWriter xtw = XmlWriter.Create(context.Response.OutputStream, xws);
                serializer.Serialize(xtw, chrs, chrs.Namespaces);
            }
        }
    }
}
