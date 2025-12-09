/**
 * omk.js - Gestionnaire Omeka-S pour Study-Whis
 * 
 * Classe principale pour communiquer avec l'API Omeka-S
 * Gère : authentification, items, médias, propriétés, vocabulaires
 * 
 * Usage:
 *   const omk = new omk({
 *       api: 'http://localhost/omeka-s/api/',
 *       key: 'YOUR_API_KEY',
 *       ident: 'YOUR_IDENT_KEY',
 *       mail: 'user@example.com'
 *   });
 *   omk.createAudioItem(data, callback);
 */

import { loader } from './loader.js';

export class omk {
    constructor(params) {
        var me = this;

        // Paramètres de connexion
        this.key = params.key ? params.key : false;
        this.ident = params.ident ? params.ident : false;
        this.mail = params.mail ? params.mail : false;
        this.api = params.api ? params.api : false;

        // Vocabulaires à charger
        this.vocabs = params.vocabs ? params.vocabs : ['dcterms', 'sw', 'skos', 'foaf'];

        // Loader
        this.loader = new loader();

        // Cache des données
        this.user = false;
        this.props = [];
        this.class = [];
        this.medias = [];
        this.items = [];
        this.resources = [];
        this.rts = []; // Resource Templates
        this.queries = [];

        let perPage = 100;
        let types = { 'items': 'o:item', 'media': 'o:media' };

        /**
         * Initialisation : charge les vocabulaires et templates
         */
        this.init = function () {
            // Récupère les propriétés des vocabulaires
            me.vocabs.forEach(v => {
                me.getProps(v);
                me.getClass(v);
            });
            me.setRT();
            me.loader.hide(true);
        };

        /**
         * Charge tous les templates de ressources
         */
        this.setRT = function (cb = false) {
            me.rts = me.syncRequest(me.api + 'resource_templates?per_page=1000');
            if (cb) cb(me.rts);
        };

        /**
         * Récupère un template par label
         */
        this.getRt = function (label) {
            return me.rts.filter(rt => rt['o:label'] == label)[0];
        };

        /**
         * Récupère un template par ID
         */
        this.getRtById = function (id) {
            return me.rts.filter(rt => rt['o:id'] == id)[0];
        };

        /**
         * Récupère l'ID d'un template par label
         */
        this.getRtId = function (label) {
            return me.rts.filter(rt => rt['o:label'] == label)[0]['o:id'];
        };

        /**
         * Charge les propriétés d'un vocabulaire
         */
        this.getProps = function (prefix, cb = false) {
            let url = me.api + 'properties?per_page=1000&vocabulary_prefix=' + prefix;
            let data = me.syncRequest(url);
            data.forEach(p => me.props.push(p));
            if (cb) cb(me.props);
        };

        /**
         * Récupère l'ID d'une propriété par son terme
         */
        this.getPropId = function (t) {
            return me.props.filter(prp => prp['o:term'] == t)[0]['o:id'];
        };

        /**
         * Récupère une propriété complète par son terme
         */
        this.getPropByTerm = function (t) {
            return me.props.filter(prp => prp['o:term'] == t)[0];
        };

        /**
         * Charge les classes d'un vocabulaire
         */
        this.getClass = function (prefix, cb = false) {
            let url = me.api + 'resource_classes?per_page=1000&vocabulary_prefix=' + prefix;
            let data = me.syncRequest(url);
            data.forEach(c => me.class.push(c));
            if (cb) cb(data);
        };

        /**
         * Récupère une classe par son label
         */
        this.getClassByName = function (cl) {
            let c = me.class.filter(c => c['o:label'].toLowerCase() == cl.toLowerCase());
            return c[0];
        };

        /**
         * Récupère une classe par son terme
         */
        this.getClassByTerm = function (cl) {
            let c = me.class.filter(c => c['o:term'].toLowerCase() == cl.toLowerCase());
            return c[0];
        };

        /**
         * Récupère un item aléatoire d'une classe
         */
        this.getRandomItemByClass = function (cl, cb = false) {
            let url;
            try {
                url = me.api + 'items?resource_class_id=' +
                    me.getClassByName(cl)['o:id'];
            } catch (error) {
                console.error(error);
            }
            let rs = me.syncRequest(url);
            let r = rs[Math.floor(Math.random() * rs.length)];
            if (cb) cb(r);
            return r;
        };

        /**
         * Récupère les médias d'un item
         */
        this.getMedias = async function (p, linkMedia = '') {
            p.medias = [];
            if (p['o:media']) {
                p['o:media'].forEach(m => {
                    p.medias.push(me.syncRequest(m['@id']));
                });
            }
            if (linkMedia && p[linkMedia]) me.getLinkMedias(p, linkMedia);
        };

        /**
         * Récupère les médias liés à un item
         */
        this.getLinkMedias = function (p, linkMedia) {
            p.medias = p.medias ? p.medias : [];
            if (p[linkMedia]) {
                p[linkMedia].forEach(i => {
                    let item = me.syncRequest(i['@id']);
                    me.getMedias(item);
                    if (item.medias) {
                        item.medias.forEach(m => {
                            p.medias.push(m);
                        });
                    }
                });
            }
        };

        /**
         * Récupère un item par ID
         */
        this.getItem = function (id, cb = false) {
            if (me.items[id]) return me.items[id];
            let url = me.api + 'items/' + id;
            let rs = me.syncRequest(url);
            me.items[id] = rs;
            if (cb) cb(rs);
            return rs;
        };

        /**
         * Récupère un média par ID
         */
        this.getMedia = function (id, cb = false) {
            if (me.medias[id]) return me.medias[id];
            let url = me.api + 'media/' + id;
            let rs = me.syncRequest(url);
            me.medias[id] = rs;
            if (cb) cb(rs);
            return rs;
        };

        /**
         * Récupère le lien admin d'une ressource
         */
        this.getAdminLink = function (r, id = false, type = false) {
            if (!type) type = r['@type'][0];
            return type == "o:Item" ?
                me.api.replace("/api/", "/admin/items/") + (id ? id : r['o:id'])
                : me.api.replace("/api/", "/admin/media/") + (id ? id : r['o:id']);
        };

        /**
         * Récupère le lien public d'un média
         */
        this.getMediaLink = function (file) {
            return me.api.replace("/api", "") + file;
        };

        /**
         * Recherche des items
         */
        this.searchItems = function (query, cb = false, sync = true) {
            let url = me.api + 'items?' + query;
            let rs;
            if (sync) {
                rs = me.syncRequest(url);
                if (cb) cb(rs);
            } else {
                me.asyncRequest(url, cb);
            }
            return rs;
        };

        /**
         * Récupère l'utilisateur connecté
         */
        this.getUser = function (cb = false) {
            let url = me.api + 'users?email=' + me.mail + '&key_identity=' + me.ident + '&key_credential=' + me.key;
            me.asyncRequest(url, function (data) {
                me.user = data.length ? data[0] : false;
                if (cb) cb(me.user);
            });
        };

        /**
         * Crée un nouvel item Omeka-S
         * @param {Object} data - Données de l'item
         * @param {Function} cb - Callback après création
         * @param {String} verifDoublons - Query pour vérifier les doublons
         */
        this.createItem = function (data, cb = false, verifDoublons = false) {
            if (verifDoublons) {
                let items = me.searchItems(verifDoublons);
                if (items.length) {
                    if (cb) cb(items[0]);
                    return items[0];
                }
            }
            let url = me.api + 'items?key_identity=' + me.ident + '&key_credential=' + me.key;
            me.postData({ 'u': url, 'm': 'POST' }, me.formatData(data)).then((rs) => {
                me.items[rs['o:id']] = rs;
                if (cb) cb(rs);
            });
        };

        /**
         * Crée un item "Audio" Study-Whis
         * @param {Object} audioData - {titre, fichier, dateUpload, duree, importePar, description}
         * @param {Function} cb - Callback
         */
        this.createAudioItem = function (audioData, cb = false) {
            let data = {
                'o:resource_template': me.getRtId('Audio'),
                'o:resource_class': 'sw:Audio',
                'dcterms:title': audioData.titre || 'Audio sans titre',
                'dcterms:description': audioData.description || '',
                'dcterms:created': audioData.dateUpload || new Date().toISOString().split('T')[0],
                'sw:titre': audioData.titre || 'Audio',
                'sw:fichier': audioData.fichier || '',
                'sw:dateUpload': audioData.dateUpload || new Date().toISOString().split('T')[0],
                'sw:duree': audioData.duree || 'À calculer',
                'sw:importePar': audioData.importePar || 'API Study-Whis'
            };
            me.createItem(data, cb);
        };

        /**
         * Crée un item "Transcription" Study-Whis
         * @param {Object} transcData - {contenu, transcritDe (ID de l'audio)}
         * @param {Function} cb - Callback
         */
        this.createTranscriptionItem = function (transcData, cb = false) {
            let data = {
                'o:resource_template': me.getRtId('Transcription'),
                'o:resource_class': 'sw:Transcription',
                'dcterms:title': 'Transcription - ' + (transcData.titre || 'Sans titre'),
                'sw:contenu': transcData.contenu || '',
                'sw:transcritDe': transcData.transcritDe ? { rid: transcData.transcritDe } : null
            };
            me.createItem(data, cb);
        };

        /**
         * Crée un item "Analyse" Study-Whis
         * @param {Object} analyseData - {resume, questions, analyseDe (ID de l'audio)}
         * @param {Function} cb - Callback
         */
        this.createAnalyseItem = function (analyseData, cb = false) {
            let data = {
                'o:resource_template': me.getRtId('Analyse'),
                'o:resource_class': 'sw:Analyse',
                'dcterms:title': 'Analyse - ' + (analyseData.titre || 'Sans titre'),
                'sw:resume': analyseData.resume || '',
                'sw:questions': analyseData.questions || '',
                'sw:analyseDe': analyseData.analyseDe ? { rid: analyseData.analyseDe } : null
            };
            me.createItem(data, cb);
        };

        /**
         * Met à jour une ressource
         */
        this.updateResource = function (id, data, type = 'items', fd = null, m = 'PUT', cb = false, dataOri = false) {
            let oriData, newData, url = me.api + type + '/' + id + '?key_identity=' + me.ident + '&key_credential=' + me.key;
            if (data) {
                oriData = dataOri ? dataOri : me.getItem(id);
                newData = me.formatData(data, types[type]);
                for (const p in newData) {
                    if (p != '@type') {
                        if (oriData[p]) {
                            if (m == "PUT") oriData[p] = oriData[p].concat(newData[p]);
                            if (m == "PATCH") oriData[p] = newData[p];
                        } else {
                            oriData[p] = newData[p];
                        }
                    }
                }
            }
            me.postData({ 'u': url, 'm': m }, fd ? fd : oriData).then((rs) => {
                me.items[rs['o:id']] = rs;
                if (cb) cb(rs);
            });
        };

        /**
         * Formate les données pour l'API Omeka-S
         */
        this.formatData = function (data, type = "o:Item") {
            let fd = { "@type": type };
            let p;

            for (let [k, v] of Object.entries(data)) {
                switch (k) {
                    case 'o:item_set':
                        fd[k] = [{ 'o:id': v }];
                        break;
                    case 'o:resource_class':
                        p = me.getClassByTerm(v);
                        fd[k] = { 'o:id': p['o:id'] };
                        break;
                    case 'o:resource_template':
                        if (typeof v === 'number') {
                            fd[k] = { 'o:id': v };
                        } else {
                            p = me.rts.filter(rt => rt['o:label'] == v)[0];
                            fd[k] = { 'o:id': p['o:id'] };
                        }
                        break;
                    case 'o:media':
                        if (!fd[k]) fd[k] = [];
                        fd[k].push({ "o:ingester": "url", "ingest_url": v });
                        break;
                    case 'file':
                        fd['o:media'] = [{ "o:ingester": "upload", "file_index": "1" }];
                        break;
                    default:
                        if (v === null || v === undefined) break;
                        if (!fd[k]) fd[k] = [];
                        p = me.props.filter(prp => prp['o:term'] == k)[0];
                        if (p) {
                            if (Array.isArray(v)) {
                                fd[k] = v.map(val => formatValue(p, val));
                            } else {
                                fd[k].push(formatValue(p, v));
                            }
                        }
                        break;
                }
            }
            return fd;
        };

        /**
         * Formate une valeur pour l'API Omeka-S
         */
        function formatValue(p, v) {
            if (typeof v === 'object' && v.rid) {
                return {
                    "property_id": p['o:id'],
                    "value_resource_id": v.rid,
                    "type": "resource"
                };
            } else if (typeof v === 'object' && v.a) {
                return {
                    "property_id": p['o:id'],
                    "@value": v.v,
                    "type": "literal",
                    "@annotation": v.a
                };
            } else if (typeof v === 'object' && v.u) {
                return {
                    "property_id": p['o:id'],
                    "@id": v.u,
                    "o:label": v.l,
                    "type": "uri"
                };
            } else if (typeof v === 'object') {
                return {
                    "property_id": p['o:id'],
                    "@value": JSON.stringify(v),
                    "type": "literal"
                };
            } else {
                return {
                    "property_id": p['o:id'],
                    "@value": v,
                    "type": "literal"
                };
            }
        }

        /**
         * Requête synchrone (XMLHttpRequest)
         * À éviter en production - utiliser asyncRequest
         */
        this.syncRequest = function (url) {
            me.loader.show();
            const request = new XMLHttpRequest();
            request.open('GET', url, false);
            request.send(null);
            if (request.status === 200) {
                me.loader.hide();
                return JSON.parse(request.response);
            }
            return [];
        };

        /**
         * Requête asynchrone (fetch)
         */
        this.asyncRequest = function (url, cb) {
            me.loader.show();
            fetch(url)
                .then(response => response.json())
                .then(json => {
                    cb(json);
                    me.loader.hide();
                })
                .catch(error => {
                    console.error('Erreur fetch:', error);
                    me.loader.hide();
                });
        };

        /**
         * Envoie des données (POST/PUT/PATCH)
         */
        this.postData = async function (url, data = {}, file = null) {
            let bodyData;
            let options = {
                method: url.m,
                mode: "cors",
                cache: "no-cache",
                credentials: "same-origin",
                referrerPolicy: "no-referrer"
            };

            if (url.m == 'POST' || url.m == 'PUT' || url.m == 'PATCH') {
                if (file) {
                    bodyData = new FormData();
                    bodyData.append('data', JSON.stringify(data));
                    bodyData.append('file[1]', file);
                } else {
                    bodyData = JSON.stringify(data);
                    options.headers = {
                        "Content-Type": "application/json"
                    };
                }
                options.body = bodyData;
            }

            const response = await fetch(url.u, options);
            me.loader.hide(true);
            return response.json();
        };

        /**
         * Sauvegarde les données en JSON
         */
        this.saveJson = function (data) {
            const filename = 'study-whis-export.json';
            const jsonStr = JSON.stringify(data, null, 2);

            let element = document.createElement('a');
            element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(jsonStr));
            element.setAttribute('download', filename);

            element.style.display = 'none';
            document.body.appendChild(element);
            element.click();
            document.body.removeChild(element);
        };

        // Initialisation
        this.init();
    }
}
